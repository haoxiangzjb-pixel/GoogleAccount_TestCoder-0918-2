import std/[macros, random, strutils]

# 定义一个宏来生成重复代码
macro generateRepeatedCode(count: static[int], code: untyped): untyped =
  ## 生成重复的代码块
  result = newNimNode(nnkStmtList)
  for i in 0..<count:
    let repeatedStmt = code.copyNimTree
    result.add repeatedStmt

# 示例：生成重复的打印语句
proc exampleUsage() =
  echo "生成重复代码示例："
  
  # 使用宏生成5次重复的打印语句
  generateRepeatedCode(5):
    echo "这是重复的代码行"
  
  echo "宏执行完成"

# 生成随机文件名的函数
proc generateRandomNimFile() =
  import times
  
  # 生成基于时间的随机文件名
  let timestamp = $(getTime().toUnix)
  let randomSuffix = random(1000..9999)
  let filename = "generated_code_" & timestamp & "_" & $randomSuffix & ".nim"
  
  var fileContent = ""
  fileContent.add "# 自动生成的Nim代码文件\n"
  fileContent.add "# 生成时间: " & $now() & "\n\n"
  fileContent.add "import std/[strformat, times]\n\n"
  
  # 添加使用宏的示例代码
  fileContent.add "proc generatedRepeatedCode() =\n"
  fileContent.add "  echo \"开始执行重复代码\"\n"
  
  # 添加50行重复代码作为示例
  for i in 1..10:
    fileContent.add &"  echo \"重复代码行 {i}\"\n"
  
  fileContent.add "  echo \"重复代码执行完毕\"\n\n"
  
  # 添加调用
  fileContent.add "generatedRepeatedCode()\n"
  
  # 写入文件
  writeFile(filename, fileContent)
  echo "已生成文件: ", filename

when isMainModule:
  exampleUsage()
  generateRandomNimFile()