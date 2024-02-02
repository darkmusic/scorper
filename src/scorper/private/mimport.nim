import macros
import os 

const explicitSourcePath {.strdefine.} = os.parentDir(os.parentDir( os.getCurrentCompilerExe()))

macro mImport*(path: static[string]): untyped =
  let combinedPath = joinPath(explicitSourcePath, path)
  result = newNimNode(nnkStmtList)
  result.add(quote do:
    import `combinedPath`
  )