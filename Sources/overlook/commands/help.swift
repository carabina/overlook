//
//  help.swift
//  overlook
//
//  Created by Wesley Cope on 9/30/16.
//
//

import Foundation
import SwiftCLI
import Rainbow

public class HelpCommand : SwiftCLI.HelpCommand, Command {
  let name              = "help"
  let signature         = "[<opt>] ..."
  let shortDescription  = "Prints help information"
  
  var printCLIDescription: Bool = true
  var allCommands: [Command]    = []
  
  public func setupOptions(options: OptionRegistry) {}
  
  public func execute(arguments: CommandArguments) throws {
    print("Usage: overlook [OPTIONS]\n")
    print("Available commands: ")
    
    for command in allCommands {
      var name = command.name
      
      if !command.signature.isEmpty && !(command is HelpCommand) {
        name += " \(command.signature)"
      }
      
      printLine(name: name, description: command.shortDescription)
    }
  }
  
  private func printLine(name: String, description: String) {
    let spacing = String(repeating: " ", count: 20 - name.characters.count)
    
    print(" " + Overlook.name.lowercased() + " " + name.bold + "\(spacing)\(description)")
  }
  
}


