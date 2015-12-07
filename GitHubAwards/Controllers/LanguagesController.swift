//
//  LanguagesController.swift
//  GitHubAwards
//
//  Created by Nuno Gonçalves on 25/11/15.
//  Copyright © 2015 Nuno Gonçalves. All rights reserved.
//

import UIKit

class LanguagesController: UIViewController {
    
    @IBOutlet weak var languagesTable: UITableView!
    
    let languages = [
        "JavaScript","Java","Python","CSS","PHP","Ruby","C++","C","Shell","C#","Objective-C",
        "R","Swift","Scala","Clojure","Assembly","Augeas","AutoHotkey","AutoIt","Awk","Bison",
        "BitBake","BlitzBasic","BlitzMax","Bluespec","Boo","Brightscript","Bro","Ada","Alloy",
        "ActionScript","CLIPS","COBOL","APL","Ceylon","Chapel","Cirru","Clean","AspectJ","CoffeeScript",
        "ColdFusion","Common Lisp","Component Pascal","Cool","Coq","Crystal","Cuda","Cycript","D",
        "DCPU-16 ASM", "DM","DOT","Dart","Delphi","Dogescript","Dylan","E","Ecl","Eiffel","Elixir",
        "Elm", "Emacs Lisp","EmberScript","Erlang","F#","FLUX","FORTRAN","Factor","Fancy","Fantom",
        "Forth", "Frege","GAMS","GAP","GDScript","Game Maker Language","Glyph","Gnuplot","Go",
        "Golo","Gosu","Grace", "Grammatical Framework","Groovy","HTML","HaXe","Hack","Harbour","Haskell",
        "Haxe","Hy","IDL", "IGOR Pro","Idris","Inform 7","Io","Ioke","Isabelle","J","JSONiq",
        "Jasmin", "AGS Script","ABAP","Julia","KRL","Kotlin","LOLCODE","LSL","LabVIEW","Lasso",
        "LiveScript", "Logos","Logtalk","LookML","LoomScript","Lua","M","Makefile","Mathematica",
        "Matlab", "Max", "Mercury","Mirah","Monkey","Moocode","MoonScript", "Nemerle","NetLogo","Nimrod",
        "Nit","Nix", "Nu","OCaml","Apex","Objective-C++","Objective-J","Omgrofl","Opa","Opal",
        "OpenEdge ABL","OpenSCAD","Ox","Oxygene","Oz","PAWN","ASP","Pan","Papyrus","Parrot","Pascal",
        "Perl", "Perl6","PigLatin","Pike","PogoScript","PowerShell","Powershell","Processing",
        "Prolog", "Propeller Spin","Puppet","Pure Data","PureBasic","PureScript","ANTLR","AppleScript",
        "REALbasic","Racket","Ragel in Ruby Host","Rebol","Red","RobotFramework","Rouge","ATS",
        "Rust","SAS","SQF","SQL", "Arduino", "Scheme","Scilab","Self","Agda","Shen","Slash",
        "Smalltalk","SourcePawn","Squirrel", "Standard ML","Stata","SuperCollider","Arc","SystemVerilog",
        "TXL","Tcl","TeX","Thrift", "Turing", "TypeScript","UnrealScript", "VCL","VHDL","Vala","Verilog",
        "VimL","Visual Basic","Volt","WebIDL","XC","XML","XProc","XQuery","XSLT","Xojo","Xtend",
        "Zephir", "Zimpl","eC","nesC","ooc","wisp","xBase"
    ]
    
    var displayingLanguages = [String]()
  
    override func viewDidLoad() {
        displayingLanguages = languages
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GoToLanguageRankings" {
            let vc = segue.destinationViewController as! LanguageRankingsController
            vc.language = displayingLanguages[languagesTable.indexPathForSelectedRow!.row]
        }
    }
}

extension LanguagesController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayingLanguages.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LanguageCell", forIndexPath: indexPath) as! LanguageCell
        cell.language = displayingLanguages[indexPath.row]
        return cell
    }
}

extension LanguagesController : UISearchBarDelegate {
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            displayingLanguages = languages
        } else {
            let resultPredicate = NSPredicate(format: "self contains[c] %@", searchText)
            displayingLanguages = languages.filter { resultPredicate.evaluateWithObject($0) }
        }
       
        languagesTable.reloadData()
    }
}