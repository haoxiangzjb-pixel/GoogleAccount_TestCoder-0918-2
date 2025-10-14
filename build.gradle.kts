plugins {
    kotlin("jvm") version "1.9.10"
    application
}

repositories {
    mavenCentral()
}

dependencies {
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.7.3")
    // For file I/O
    implementation(kotlin("stdlib"))
}

application {
    mainClass.set("NetworkRequestExampleKt")
}