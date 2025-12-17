import java.io.FileInputStream
import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("com.google.gms.google-services")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}


android {
    namespace = "com.waslny.nabny"
    compileSdk = 36

    // ملاحظة: إصدار NDK هذا (27.x.x) يبدو جديداً جداً وغير شائع.
    // إذا واجهت مشاكل في البناء (Build Issues)، يفضل إما إزالة هذا السطر للاعتماد على إصدار Android Studio
    // الافتراضي، أو استخدام إصدار مستقر معروف (مثل 25.2.8992147).
    ndkVersion = "27.0.12077973"

//    compileOptions {
//        // تمكين Desugaring لدعم ميزات Java الحديثة (مثل Streams و Time APIs) على Android القديم.
//        isCoreLibraryDesugaringEnabled = true
//        sourceCompatibility = JavaVersion.VERSION_17
//        targetCompatibility = JavaVersion.VERSION_17
//    }
//
//    kotlinOptions {
//        jvmTarget = "17"
//    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    kotlinOptions {
        jvmTarget = "17"
    }




    defaultConfig {
        applicationId = "com.waslny.nabny"
        minSdk = 24
        targetSdk = 36
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    // 1. تحميل خصائص التوقيع (Keystore Properties)
    val keystorePropertiesFile = rootProject.file("app/release_mod/key.properties")
    val keystoreProperties = Properties().apply {
        if (keystorePropertiesFile.exists()) {
            load(FileInputStream(keystorePropertiesFile))
        }
    }

    // 2. إعدادات التوقيع (Signing Configs)
    signingConfigs {
        create("release") {
            storeFile = keystoreProperties["storeFile"]?.let { file(it) }
            storePassword = keystoreProperties["storePassword"] as String?
            keyAlias = keystoreProperties["keyAlias"] as String?
            keyPassword = keystoreProperties["keyPassword"] as String?
        }
    }

    // 3. إعدادات بناء إصدار النشر (Release Build Type)
    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")

            // تمكين تصغير الكود والموارد (لتقليل حجم التطبيق)
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )

            // إعداد رموز NDK لتتبع الأعطال الأصلية في Google Play Console
            ndk {
                debugSymbolLevel = "symbol_table"
            }
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // توفير مكتبة Desugaring (ضرورية لـ isCoreLibraryDesugaringEnabled)
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")

    // يمكنك إضافة مكتبات Kotlin/Android إضافية هنا إذا لزم الأمر
    implementation("androidx.core:core-ktx:1.13.1") // تم التحديث إلى أحدث إصدار (1.13.1) للثبات
}
