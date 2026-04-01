package com.simxstudio.simx_zendesk_support

import android.app.Activity
import android.content.Context
import android.util.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import zendesk.chat.Chat
import zendesk.chat.ChatConfiguration
import zendesk.chat.ChatEngine
import zendesk.chat.ChatProvidersConfiguration
import zendesk.chat.VisitorInfo
import zendesk.classic.messaging.MessagingActivity
import zendesk.core.*
import zendesk.support.*
import zendesk.support.guide.HelpCenterActivity
import zendesk.support.request.RequestActivity
import zendesk.support.requestlist.RequestListActivity


class SimxZendeskSupportPlugin : FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware {
    private lateinit var channel: MethodChannel
    private var context: Context? = null
    private var activity: Activity? = null
    private var userId: String = ""
    private var isInitialized: Boolean = false

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        context = binding.applicationContext
        channel = MethodChannel(binding.binaryMessenger, "simx_zendesk_support")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "initialize" -> {
                val url = call.argument<String>("zendeskUrl")
                val appId = call.argument<String>("appId")
                val clientId = call.argument<String>("clientId")
                val name = call.argument<String>("name") ?: ""
                val emailId = call.argument<String>("emailId") ?: ""
                userId = call.argument<String>("userId") ?: ""
                val jwtToken = call.argument<String>("jwtToken")
                
                if (url.isNullOrBlank() || appId.isNullOrBlank() || clientId.isNullOrBlank()) {
                    result.error("INVALID_ARGUMENTS", "Missing required initialization parameters", null)
                    return
                }

                try {
                    context?.let { ctx ->
                        // Initialize Zendesk Core
                        Zendesk.INSTANCE.init(ctx, url, appId, clientId)
                        
                        // Initialize Support SDK
                        Support.INSTANCE.init(Zendesk.INSTANCE)
                        
                        // Initialize Chat SDK
                        Chat.INSTANCE.init(ctx, clientId, appId)
                        
                        // Set identity
                        val identity = if (!jwtToken.isNullOrBlank()) {
                            JwtIdentity(jwtToken)
                        } else {
                            AnonymousIdentity.Builder()
                                .withNameIdentifier("$name | UserID: $userId")
                                .withEmailIdentifier(emailId)
                                .build()
                        }
                        Zendesk.INSTANCE.setIdentity(identity)
                        
                        isInitialized = true
                        Log.d("ZendeskPlugin", "Zendesk initialized successfully")
                        result.success(null)
                    } ?: result.error("NO_CONTEXT", "Context is null", null)
                } catch (e: Exception) {
                    Log.e("ZendeskPlugin", "Initialize failed", e)
                    result.error("INIT_FAILED", e.message ?: "Unknown error", null)
                }
            }

            "showHelpCenter" -> {
                if (!isInitialized) {
                    result.error("NOT_INITIALIZED", "Zendesk not initialized", null)
                    return
                }
                
                try {
                    val categoryIdList = call.argument<List<Long>>("categoryIdList") ?: emptyList()
                    val ctx = activity ?: return result.error("NO_ACTIVITY", "No activity attached", null)
                    
                    val requestActivityConfig = RequestActivity.builder()
                        .withTags(listOf("user_id:$userId", "mobile_app"))
                        .config()
                    
                    HelpCenterActivity.builder()
                        .withArticlesForCategoryIds(categoryIdList)
                        .withContactUsButtonVisible(true)
                        .show(ctx, requestActivityConfig)
                    
                    result.success(null)
                } catch (e: Exception) {
                    Log.e("ZendeskPlugin", "showHelpCenter failed", e)
                    result.error("LAUNCH_FAILED", e.message ?: "Unknown error", null)
                }
            }

            "sendUserInformationForTicket" -> {
                if (!isInitialized) {
                    result.error("NOT_INITIALIZED", "Zendesk not initialized", null)
                    return
                }
                
                try {
                    userId = call.argument<String>("userId") ?: ""
                    val tripId = call.argument<String>("tripId") ?: ""

                    val ctx = activity ?: return result.error("NO_ACTIVITY", "No activity attached", null)
                    
                    val config = RequestActivity.builder()
                        .withTags(listOf("user_id:$userId", "trip_id:$tripId"))
                        .intent(ctx)

                    ctx.startActivity(config)
                    result.success(null)
                } catch (e: Exception) {
                    Log.e("ZendeskPlugin", "sendUserInformationForTicket failed", e)
                    result.error("LAUNCH_FAILED", e.message ?: "Unknown error", null)
                }
            }

            "showListOfTickets" -> {
                if (!isInitialized) {
                    result.error("NOT_INITIALIZED", "Zendesk not initialized", null)
                    return
                }
                
                try {
                    val ctx = activity ?: return result.error("NO_ACTIVITY", "No activity attached", null)
                    RequestListActivity.builder().show(ctx)
                    result.success(null)
                } catch (e: Exception) {
                    Log.e("ZendeskPlugin", "showListOfTickets failed", e)
                    result.error("LAUNCH_FAILED", e.message ?: "Unknown error", null)
                }
            }

            "startChat" -> {
                if (!isInitialized) {
                    result.error("NOT_INITIALIZED", "Zendesk not initialized", null)
                    return
                }
                
                try {
                    val name = call.argument<String>("name") ?: ""
                    val emailId = call.argument<String>("emailId") ?: ""
                    val phoneNumber = call.argument<String>("phoneNumber") ?: ""
                    
                    val ctx = activity ?: return result.error("NO_ACTIVITY", "No activity attached", null)
                    
                    val chatConfiguration = ChatConfiguration.builder()
                        .withAgentAvailabilityEnabled(false)
                        .build()
                    
                    val visitor = VisitorInfo.builder()
                        .withName(name)
                        .withEmail(emailId)
                        .withPhoneNumber(phoneNumber)
                        .build()
                    
                    val chatProvideConfig = ChatProvidersConfiguration.builder()
                        .withVisitorInfo(visitor)
                        .build()
                    
                    Chat.INSTANCE.setChatProvidersConfiguration(chatProvideConfig)
                    
                    val supportEngine = SupportEngine.engine()
                    val chatEngine = ChatEngine.engine()
                    
                    MessagingActivity.builder()
                        .withEngines(supportEngine, chatEngine)
                        .withMultilineResponseOptionsEnabled(true)
                        .show(ctx, chatConfiguration)
                    
                    result.success(null)
                } catch (e: Exception) {
                    Log.e("ZendeskPlugin", "startChat failed", e)
                    result.error("CHAT_ENGINE_FAILED", e.message ?: "Unknown error", null)
                }
            }

            "startChatBot" -> {
                if (!isInitialized) {
                    result.error("NOT_INITIALIZED", "Zendesk not initialized", null)
                    return
                }
                
                try {
                    val ctx = activity ?: return result.error("NO_ACTIVITY", "No activity attached", null)
                    
                    val supportEngine = SupportEngine.engine()
                    val chatEngine = ChatEngine.engine()
                    
                    MessagingActivity.builder()
                        .withEngines(supportEngine, chatEngine)
                        .show(ctx)
                    
                    result.success(null)
                } catch (e: Exception) {
                    Log.e("ZendeskPlugin", "startChatBot failed", e)
                    result.error("AUTO_BOT_CHAT", e.message ?: "Unknown error", null)
                }
            }

            "setPushToken" -> {
                val token = call.argument<String>("token")
                if (token.isNullOrBlank()) {
                    result.error("INVALID_ARGUMENTS", "Push token is empty", null)
                    return
                }
                try {
                    // Register with Support
                    Zendesk.INSTANCE.provider()?.pushRegistrationProvider()?.registerWithDeviceIdentifier(token, null)
                    
                    // Register with Chat
                    Chat.INSTANCE.providers()?.pushNotificationsProvider()?.registerPushToken(token)
                    
                    Log.d("ZendeskPlugin", "Push token updated successfully for Support and Chat")
                    result.success(null)
                } catch (e: Exception) {
                    Log.e("ZendeskPlugin", "setPushToken failed", e)
                    result.error("PUSH_TOKEN_FAILED", e.message ?: "Unknown error", null)
                }
            }

            "setThemeColor" -> {
                val color = call.argument<Int>("color")
                // For Android Unified SDK, primary color is usually handled via theme in XML.
                // We'll log it for now as programmatic theme change is limited in Unified SDK.
                Log.d("ZendeskPlugin", "Theme color requested: $color (Note: Programmatic color change is limited on Android Unified SDK, utilize styles.xml for better results)")
                result.success(null)
            }

            "uninitialize" -> {
                isInitialized = false
                userId = ""
                try {
                    // Reset identity for support
                    Zendesk.INSTANCE.setIdentity(AnonymousIdentity.Builder().build())
                    // Log out from Chat
                    Chat.INSTANCE.clearCache()
                    Log.d("ZendeskPlugin", "Zendesk uninitialized and identity reset")
                    result.success(null)
                } catch (e: Exception) {
                    Log.e("ZendeskPlugin", "Error during uninitialize", e)
                    result.error("UNINIT_FAILED", e.message ?: "Unknown error", null)
                }
            }

            else -> result.notImplemented()

        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }
}
