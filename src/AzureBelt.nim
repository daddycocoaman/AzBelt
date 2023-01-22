import std/tables

import winim/lean

import azurebelt/modules/aadjoin
import azurebelt/modules/tbres
import azurebelt/modules/msal
import azurebelt/modules/vscode

proc entrypoint(args: varargs[LPCWSTR, `$`]): void {.cdecl, exportc, dynlib.} =  
  when not defined(release):
    AttachConsole(ATTACH_PARENT_PROCESS)
    
  case ($args[0]):
    of "all":
      echo runAADJoin()
      echo runTBRES()
      echo runMSAL()
      echo runVSCode()
    of "aadjoin":
      echo runAADJoin()
    of "tbres":
      echo runTBRES()
    of "msal":
      echo runMSAL()
    of "vscode":
      echo runVSCode()
    else:
        echo "Unknown command: " & $args[0]

proc NimMain() {.cdecl, importc.}

proc DllMain(hinstDLL: HINSTANCE, fdwReason: DWORD, lpvReserved: LPVOID) : BOOL {.stdcall, exportc, dynlib.} =
  NimMain()
  return true