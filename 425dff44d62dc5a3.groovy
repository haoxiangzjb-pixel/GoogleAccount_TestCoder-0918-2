// Groovy DSL Build Task Definitions

tasks.register('buildApp') {
    group = 'Build'
    description = 'Compiles source code, runs tests, and packages the application'
    
    doLast {
        println '>>> Compiling source code...'
        // compileJava, compileGroovy actions would go here
        
        println '>>> Running tests...'
        // test task execution would go here
        
        println '>>> Packaging application...'
        // jar, war, or other packaging tasks would go here
        
        println '>>> Build completed successfully!'
    }
}

tasks.register('cleanBuild') {
    group = 'Build'
    description = 'Cleans the build directory'
    
    doLast {
        println '>>> Cleaning build directory...'
        delete layout.buildDirectory
        println '>>> Clean completed!'
    }
}

tasks.register('fullBuild') {
    group = 'Build'
    description = 'Performs a clean build (clean + build)'
    dependsOn 'cleanBuild', 'buildApp'
    
    doLast {
        println '>>> Full build process completed!'
    }
}
