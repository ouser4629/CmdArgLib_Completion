## CmdArgLib_Completion

This repositiory provides three executable programs built
using [Command Argument Library](https://github.com/ouser4629/cmd-arg-lib.git). The
repository has a dual purpose.

* Provide examples of how to use the `CommandAction` macro.
* Provide examples of how to generate fish and zsh completion scripts.

The programs `cf-ca1-simple` and `cf-ca2-stateful` use the `CommandAction` macro.
These, along with `cf-print`, generate fish and zsh completion scripts.

## Installation

Download and install cal-install.

Go to some folder, say Tme, and install the programs

```
> cd Temp
> git clone https://github.com/ouser4629/CmdArgLib_Completion.git
> cd CmdArgLib_Completion
> swift build -c release
> ca-install # assumes the default completion set up
cf-ca1-simple
    installed "cf-ca1-simple" in /Users/po/.local/bin
    installed "cf-ca1-simple.fish" in /Users/po/.config/fish/completions
    installed "_cf-ca1-simple" in /Users/po/.config/zsh/completions
cf-ca2-stateful
    installed "cf-ca2-stateful" in /Users/po/.local/bin
    installed "cf-ca2-stateful.fish" in /Users/po/.config/fish/completions
    installed "_cf-ca2-stateful" in /Users/po/.config/zsh/completions
cf-print
    installed "cf-print" in /Users/po/.local/bin
    installed "cf-print.fish" in /Users/po/.config/fish/completions
    installed "_cf-print" in /Users/po/.config/zsh/completions
```

## Usage

After installation, cd to a new terminal and run the programs. E.g.,

```
> cd
> cf-print -c 1 --name jack 
count:  1
names:  [jack]
vanmes:  []
file:  default_file.txt
directory default_directory/
path default_path
fruit:  apple
...
