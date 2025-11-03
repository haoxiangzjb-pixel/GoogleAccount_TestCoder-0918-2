import std/[macros, random, sequtils, strutils]

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
    let funcBody = quote do:
      proc `funcName`() =
        echo "This is function number " & `i`.intToStr()
    result.add(funcBody)

# 生成重复代码示例
proc main() =
  echo "Generating repeated code..."
  
  # 使用宏生成重复代码
  generateRepeatedCode(3):
    echo "This line will be repeated"
  
  # 使用宏生成重复函数
  createRepeatedFunctions("testFunc", 5)
  
  # 调用生成的函数
  testFunc0()
  testFunc1()
  testFunc2()
  testFunc3()
  testFunc4()

when isMainModule:
  main()