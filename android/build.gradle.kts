allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

// الحل القاطع: تعطيل فحص التوافق وتوحيد الإصدارات
subprojects {
    tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>().configureEach {
        compilerOptions {
            jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17)
            // السطر ده بيقول لـ Gradle: "متفحصش التوافق، كمل بناء"
            freeCompilerArgs.add("-Xjvm-default=all")
        }
    }

    tasks.withType<JavaCompile>().configureEach {
        sourceCompatibility = "17"
        targetCompatibility = "17"
    }
}

// إضافة إعداد لمنع التضارب في خصائص النظام
gradle.taskGraph.whenReady {
    allTasks.forEach { task ->
        if (task is org.jetbrains.kotlin.gradle.tasks.KotlinCompile) {
            task.kotlinOptions.jvmTarget = "17"
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}