## CmdArgLib_Completion

This repositiory provides an example of an executable program built
using [cmd-arg-lib](https://github.com/ouser4629/cmd-arg-lib.git). The
purpose of the example is to show show to generate fish and zsh completion scripts.

## Installation

Download and install [cal-arg-lib-package-manager](https://github.com/ouser4629/cmd-arg-lib-package-manager.git).

Make a directory, say Temp, cd to it, and install the programs

```
> mkdir Temp && cd Temp
> git clone https://github.com/ouser4629/CmdArgLib_Completion.git
> cd CmdArgLib_Completion
CmdArgLib_Completion> swift build -c release
CmdArgLib_Completion> calpm install -s fish -s zsh
cf-print
    installed "cf-print" in /Users/po/.local/bin
    installed "cf-print.fish" in /Users/po/.config/fish/completions
    installed "_cf-print" in /Users/po/.config/zsh/completions
cd ../..
rm -rf Temp
```

---




