# Package

version       = "0.1.0"
author        = "Leron Gray"
description   = "Azure credential searching in Nim"
license       = "MIT"
srcDir        = "src"
bin           = @["azurebelt"]


# Dependencies

requires "nim >= 1.6.10"
requires "winim"

# Build
task dbuild, "Debug build":
    exec "nim c -d=mingw --app=lib --nomain --cpu=amd64 --gc:arc --mm:arc --outdir:. src/AzureBelt.nim"

task rbuild, "Release build":
    exec "nim c -d=mingw -d:danger -d:strip --opt:size -d:release --passc=-flto --passl=-flto --app=lib --nomain --mm:arc --cpu=amd64 --gc:arc --outdir:. src/AzureBelt.nim"

task dllrun, "Build DLL runner":
    exec "nim c -d=mingw -d:danger -d:strip --opt:size -d:release --passc=-flto --passl=-flto --app=console --mm:arc --cpu=amd64 --gc:arc --outdir:. tools/dllrun.nim"

task all, "Build all":
    dbuildTask()
    rbuildTask()
    dllrunTask()