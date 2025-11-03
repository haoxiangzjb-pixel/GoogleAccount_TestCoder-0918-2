# Generated Nim file with repeated code macros

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
    let index = newLit($i)  # 创建一个字面量而不是引用循环变量
    let funcBody = quote do:
      proc `funcName`() =
        echo "This is function number " & `index`
    result.add(funcBody)

# 示例：使用宏生成重复代码
proc example() =
  echo "Generating repeated code..."
  
  # 使用宏生成重复代码
  generateRepeatedCode(5):
    echo "This line will be repeated"
  
  # 使用宏生成重复函数
  createRepeatedFunctions("generatedFunc", 3)
  
  # 调用生成的函数
  generatedFunc0()
  generatedFunc1()
  generatedFunc2()

when isMainModule:
  example()
