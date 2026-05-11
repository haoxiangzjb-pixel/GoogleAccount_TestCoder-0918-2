# Nim macro for generating repetitive code

macro generateRepetitiveCode(count: static[int], body: untyped): untyped =
  ## This macro generates repetitive code by repeating the given body `count` times.
  ## 
  ## Example usage:
  ##   generateRepetitiveCode(5):
  ##     echo "Iteration: ", i
  
  result = newStmtList()
  
  for i in 0..<count.int:
    let iterStmt = newVarSection(newIdentDefs(
      ident("i"),
      newEmptyNode(),
      newIntLitNode(i)
    ))
    result.add(iterStmt)
    
    # Deep copy the body and add it to the result
    var bodyCopy = body.copyTree()
    result.add(bodyCopy)

# Example usage of the macro
when isMainModule:
  echo "Generating repetitive code example:"
  generateRepetitiveCode(5):
    echo "Current iteration value: ", i
  
  echo "\nAnother example with different count:"
  generateRepetitiveCode(3):
    echo "Number: ", i
    echo "Square: ", i * i
