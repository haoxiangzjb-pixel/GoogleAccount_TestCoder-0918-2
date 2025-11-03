import std/[macros, random, sequtils, strutils, times, os]

# 定义一个宏来生成重复代码
macro generateRepeatedCode(count: static[int], code: untyped): untyped =
  ## 生成重复的代码块
  result = newStmtList()
  for i in 0..<count:
    let newCode = code.copyNimTree()
    # 在代码中插入计数器值（如果需要的话）
    result.add(newCode)

# 辅助宏来创建重复的函数
macro createRepeatedFunctions(funcNamePrefix: static[string], count: static[int]): untyped =
  result = newStmtList()
  for i in 0..<count:
    let funcName = ident(funcNamePrefix & $i)
    let index = newLit($i)  # 创建一个字面量而不是引用循环变量
    let funcBody = quote do:
      proc `funcName`() =
        echo "This is function number " & `index`
    result.add(funcBody)

# 创建一个过程来生成随机命名的.nim文件
proc generateRandomNimFile() =
  # 初始化随机数生成器
  randomize()
  # 生成随机文件名
  let randomSuffix = rand(1000000).int
  let fileName = "generated_code_" & $randomSuffix & ".nim"
  
  var fileContent = ""
  fileContent.add "# Generated Nim file with repeated code macros\n"
  fileContent.add "\n"
  fileContent.add "import std/[macros, random, sequtils, strutils]\n"
  fileContent.add "\n"
  
  # 添加宏定义到文件内容
  fileContent.add "# 定义一个宏来生成重复代码\n"
  fileContent.add("macro generateRepeatedCode(count: static[int], code: untyped): untyped =\n")
  fileContent.add("  ## 生成重复的代码块\n")
  fileContent.add("  result = newStmtList()\n")
  fileContent.add("  for i in 0..<count:\n")
  fileContent.add("    let newCode = code.copyNimTree()\n")
  fileContent.add("    # 在代码中插入计数器值（如果需要的话）\n")
  fileContent.add("    result.add(newCode)\n")
  fileContent.add("\n")
  
  fileContent.add("# 辅助宏来创建重复的函数\n")
  fileContent.add("macro createRepeatedFunctions(funcNamePrefix: static[string], count: static[int]): untyped =\n")
  fileContent.add("  result = newStmtList()\n")
  fileContent.add("  for i in 0..<count:\n")
  fileContent.add("    let funcName = ident(funcNamePrefix & $i)\n")
  fileContent.add("    let index = newLit($i)  # 创建一个字面量而不是引用循环变量\n")
  fileContent.add("    let funcBody = quote do:\n")
  fileContent.add("      proc `funcName`() =\n")
  fileContent.add("        echo \"This is function number \" & `index`\n")
  fileContent.add("    result.add(funcBody)\n")
  fileContent.add("\n")
  
  # 添加使用宏的示例代码
  fileContent.add("# 示例：使用宏生成重复代码\n")
  fileContent.add("proc example() =\n")
  fileContent.add("  echo \"Generating repeated code...\"\n")
  fileContent.add("  \n")
  fileContent.add("  # 使用宏生成重复代码\n")
  fileContent.add("  generateRepeatedCode(5):\n")
  fileContent.add("    echo \"This line will be repeated\"\n")
  fileContent.add("  \n")
  fileContent.add("  # 使用宏生成重复函数\n")
  fileContent.add("  createRepeatedFunctions(\"generatedFunc\", 3)\n")
  fileContent.add("  \n")
  fileContent.add("  # 调用生成的函数\n")
  fileContent.add("  generatedFunc0()\n")
  fileContent.add("  generatedFunc1()\n")
  fileContent.add("  generatedFunc2()\n")
  fileContent.add("\n")
  fileContent.add("when isMainModule:\n")
  fileContent.add("  example()\n")
  
  # 写入文件
  writeFile(fileName, fileContent)
  echo "Generated random Nim file: ", fileName

when isMainModule:
  generateRandomNimFile()