# Zendesk SDK ProGuard Rules
-keep class zendesk.** { *; }
-keep class com.zendesk.** { *; }
-keepattributes *Annotation*
-keepattributes Signature
-keepattributes Exceptions

# OkHttp
-dontwarn okhttp3.**
-dontwarn okio.**
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }

# Retrofit
-dontwarn retrofit2.**
-keep class retrofit2.** { *; }
-keepattributes Signature
-keepattributes Exceptions

# Gson
-keep class com.google.gson.** { *; }
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

# Keep Zendesk models
-keep class zendesk.support.** { *; }
-keep class zendesk.answerbot.** { *; }
-keep class zendesk.chat.** { *; }
-keep class zendesk.core.** { *; }
-keep class zendesk.classic.messaging.** { *; }
