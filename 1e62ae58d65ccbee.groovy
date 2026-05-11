// Groovy DSL 构建任务定义

tasks.register('buildApp') {
    group = 'build'
    description = '构建应用程序'

    doLast {
        println '开始构建...'
        
        // 编译源代码
        println '编译源代码...'
        
        // 运行测试
        println '运行测试...'
        
        // 打包应用
        println '打包应用...'
        
        println '构建完成!'
    }
}

tasks.register('cleanBuild') {
    group = 'build'
    description = '清理构建目录'

    doLast {
        println '清理构建目录...'
        delete layout.buildDirectory
        println '清理完成!'
    }
}

tasks.register('fullBuild') {
    group = 'build'
    description = '完整构建（清理 + 构建）'
    dependsOn cleanBuild, buildApp

    doLast {
        println '完整构建完成!'
    }
}
