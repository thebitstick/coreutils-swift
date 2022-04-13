//
//  whoami.swift
//  coreutils
//
//  Created by Jorge Huicochea on 4/12/22.
//

import Foundation

func Whoami(_ shift: Int) {
	switch CommandLine.arguments.count {
	case (1+shift):
		print(NSUserName())
	default:
		switch CommandLine.arguments[(1+shift)] {
		case "--help":
			print("Usage: " + CommandLine.arguments[shift] + " OPTION")
			print("--help\t\t\tdisplay this help and exit")
			print("--version\t\toutput version information and exit")
		case "-h":
			print("Usage: " + CommandLine.arguments[shift] + " OPTION")
			print("--help\t\t\tdisplay this help and exit")
			print("--version\t\toutput version information and exit")
		case "--version":
			print(VERSION)
		case "-v":
			print(VERSION)
		default:
			eprint("Unknown option")
		}
	}
}
