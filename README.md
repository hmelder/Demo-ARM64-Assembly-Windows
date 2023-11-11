# Playground for Windows WoA (ARM64) native software development

## Pre-requisites
Make sure to have the following installed:
- Visual Studio 2022 
- LLVM
- Meson
- Ninja

### Visual Studio 2022
In the installer, select the _workload_ `Desktop development with C++`, and the following optional packages:
- MSVC vXXX - VS 2022 C++ x64/x86 build tools
- Windows 10 SDK or Windows 11 SDK

### LLVM
Get the latest LLVM release from the GitHub [releases
page](https://github.com/llvm/llvm-project/releases). Select the
`LLVM-XXX-woa64.exe` file, and install it. Make sure to add LLVM to the PATH.

### Meson and Ninja
```powershell
choco install meson ninja
```

### For developers accustomed to Unix-like systems
As I loath the windows command line, I use [MSYS2](https://www.msys2.org/) to get a bash shell and a lot of useful tools. You can install it with chocolatey:
```powershell
choco install msys2
```

Configure the `.bashrc` or `.profile` file to add the following lines:
You need to adjust the paths to match your installation.
```bash
# Add native Git and LLVM (renamed to LLVM-woa64) to path
export PATH=/c/Program\ Files/LLVM-woa64/bin:/c/Program\ Files/Git/bin:/c/Program\ Files/Python311-arm64:/c/ProgramData/chocolatey/bin:/c/Program\ Files/Meson/meson.exe:$PATH
```
