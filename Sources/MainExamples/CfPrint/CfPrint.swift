// Copyright (c) 2025 Peter Summerland
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import CmdArgLib
import CmdArgLibMacros

public enum Name: String, BasicParameterEnum {case manny, moe, jack }
public enum Vname: String, BasicParameterEnum {case manny_v, moe_v, jack_v }
public enum Fruit: String, BasicParameterEnum {case apple, banana, orange }

typealias Count = Int
typealias Text = String
typealias TextFile = String
typealias Directory = String
typealias Path = String

@main
struct Main {

    @MainFunction(shadowGroups: [])
    private static func cfPrint(
        _ fruit: Fruit = .apple,
        c__count count: Count = 1,
        n__name names: [Name] = [],
        v__vnames vnames: Variadic<Vname> = [],
        f__file file: TextFile = "default_file.txt",
        d__directory directory: Directory = "default_directory/",
        p__path path: Path = "default_path",
        u__upper upper: Flag = false,
        generateFishCompletionScript: MetaFlag = MetaFlag(completionScriptFor: .fish, showElements: helpElements),
        generateZshCompletionScript: MetaFlag = MetaFlag(completionScriptFor: .zsh, showElements: helpElements),
        h__help help: MetaFlag = MetaFlag(helpElements: helpElements)) throws
    {
        print("count: ", count)
        print("names: ", names)
        print("vnames: ", vnames)
        print("file: ", file)
        print("directory", directory)
        print("path", path)
        print("fruit: ", fruit)
        print("upper", upper)
    }

    private static let helpElements: [ShowElement] = [
        .text("DESCRIPTION\n", "Print values passed in from the command line."),
        .synopsis("\nUSAGE\n"),
        .text("\nARGUMENT"),
        .parameter("fruit", "A fruit.", .list(Fruit.cases)),
        .text("\nOPTIONS"),
        .parameter("count", "A count"),
        .parameter("names", "A name (can be repeated)", .list(Name.cases)),
        .parameter("vnames", "Various names", .list(Vname.cases)),
        .parameter("file", "The name of a text file", .file("*.txt")),
        .parameter("directory", "The name of a directory", .directory("c*")),
        .parameter("path", "The name of a path", .path),
        .parameter("upper", "Upper case flag"),
        .text("\nMETA-OPTIONS"),
        .parameter("help", "Show this help message"),
        .parameter("generateFishCompletionScript","Print a fish completion script"),
        .parameter("generateZshCompletionScript","Print a zsh completion script"),
     ]
}
