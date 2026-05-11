macro repeatCode*(count: int, body: untyped): untyped =
  result = newNimNode(nnkStmtList)
  for i in 0..<count:
    result.add(body)

# 使用示例
repeatCode(5):
  echo "这是第 ", i+1, " 次执行"

