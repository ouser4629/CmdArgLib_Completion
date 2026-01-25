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
import Foundation


enum Cheese: String, CaseIterable, CustomStringConvertible, BasicParameterType {case comté, gouda, roncal}
enum Bread: String, CaseIterable, CustomStringConvertible, BasicParameterType {case baguette, multigrain, sourdough }
enum Wine: String, CaseIterable, CustomStringConvertible, BasicParameterType {case bordeaux , rioja, sancerre }
enum People: String, CaseIterable, CustomStringConvertible, BasicParameterType {case manny , moe, jack }


extension CaseIterable where AllCases.Element: CustomStringConvertible {
    static var oneOf: String { "One of: \(Self.casesJoinedWith("or"))" }
}

// public enum Person: String, CaseIterable, CustomStringConvertible, BasicParameterType {case Manny, Moe, Jack}

typealias Table = Int
typealias Text = String

struct Food {

    static let command = SimpleCommand(
        name: "food", synopsis: "Print food items passed in from the command line.",
        action: action, config: actionConfig())

    @CommandAction
    private static func values(
        table: Table = 2,
        wines: Variadic<Wine> = [],
        cheese: [Cheese] = [],
        bread: Bread = .baguette,
        _ people: Variadic<People> = [],
        upper: Flag = false,
        h__help help: MetaFlag = MetaFlag(helpElements: helpElements)) throws
    {
        print("table: ", table)
        print("wines", wines)
        print("cheese: ", cheese)
        print("bread: ", bread)
        print("people" , people)
        print("upper:", upper)
    }

    private static let helpElements: [ShowElement] = [
        .text("DESCRIPTION\n", "Print values passed in from the command line."),
        .customSynopsis("\nUSAGE\n", chunkLists: [["[<options>]", "<fruit>"]]),
        .text("\nARGUMENTS"),
        .parameter("people","Some people (\(People.casesJoinedWith("and")))", .list(People.cases)),
        .text("\nOPTIONS"),
        .parameter("table", "The table number"),
        .parameter("wines", "Wines (\(Wine.casesJoinedWith("and")))", .list(Wine.cases)),
        .parameter("cheese", "Cheese. \(Cheese.oneOf) (can be repeated)", .list(Cheese.cases)),
        .parameter("bread", "The bread. \(Bread.oneOf) ", .list(Bread.cases)),
        .parameter("help", "Show this help message"),
    ]
}
