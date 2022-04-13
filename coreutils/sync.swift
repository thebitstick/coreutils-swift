//
//  sync.swift
//  coreutils
//
//  Created by Jorge Huicochea on 4/12/22.
//

import Foundation

func Sync(_ shift: Int) {
	switch CommandLine.arguments.count {
	case (1+shift):
		sync()
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
		case "--sfsync":
			eprint("Not implemented")
		case "-f":
			eprint("Not implemented")
		case "--fsync":
			eprint("Not implemented")
		case "-s":
			eprint("Not implemented")
		case "--syncfs":
			eprint("Not implemented")
		case "-S":
			eprint("Not implemented")
		case "--all":
			sync()
		case "--sync":
			sync()
		case "-X":
			sync()
		default:
			eprint("Unknown option")
		}
	}
}
