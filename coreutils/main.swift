//
//  main.swift
//  coreutils
//
//  Created by TheBitStick.
//

import Foundation

#if os(Linux) || os(FreeBSD)
	import Glibc
#else
	import Darwin
#endif

// Utilities
let VERSION = "0.0.1"
let Commands = ["arch", // COMPLETE
				"env", // INCOMPLETE {WRONG FORMATTING, NO OPTIONS}
				"false", // COMPLETE
				"hostname", // INCOMPLETE {UNABLE TO SET HOSTNAME}
				"printenv", // INCOMPLETE {WRONG FORMATTING}
				"pwd", // COMPLETE
				"sleep", // COMPLETE
				"sync", // INCOMPLETE {NO OPTIONS}
				"true", // COMPLETE
				"whoami", // COMPLETE
				"yes" // COMPLETE
				]

public struct StderrOutputStream: TextOutputStream {
	public mutating func write(_ string: String) {
		fputs(string, stderr)
	}
}

func eprint(_ str: String) {
	print(str, to: &errStream)
	exit(1)
}

func displayRootHelp() {
	print("Usage: " + CommandLine.arguments[0] + " command [OPTIONS]")
	print("\nAvailable commands:")
	print(Commands.formatted())
}

// Parsing https://www.freebsd.org/cgi/man.cgi
public var errStream = StderrOutputStream()
switch CommandLine.arguments.count {
case 0:
	eprint("Fatal erorr")
case 1:
	displayRootHelp()
default:
	switch CommandLine.arguments[1] {
	case "--help":
		displayRootHelp()
	case "-h":
		displayRootHelp()
	
	// Done on uutils/coreutils
	case "arch":
		switch CommandLine.arguments.count {
		case 2:
			#if arch(i386)
				print("i386")
			#elseif arch(x86_64)
				print("x86_64")
			#elseif arch(arm)
				print("arm")
			#elseif arch(arm64)
				print("arm64")
			#else
				print("Unknown")
			#endif
		default:
			switch CommandLine.arguments[2] {
			case "--help":
				print("Usage: " + CommandLine.arguments[1] + " [OPTION]...")
				print("--help\t\t\tdisplay this help and exit")
				print("--version\t\toutput version information and exit")
			case "-h":
				print("Usage: " + CommandLine.arguments[1] + " [OPTION]...")
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
	/*case "basename":
		print()
	case "cat":
		print()
	case "clear":
		print()
	case "dirname":
		print()
	case "echo":
		print()*/
	case "env":
		switch CommandLine.arguments.count {
		case 2:
			print(ProcessInfo.processInfo.environment as AnyObject)
		default:
			switch CommandLine.arguments[2] {
			case "--help":
				print("Usage: " + CommandLine.arguments[1] + " OPTION")
				print("--help\t\t\tdisplay this help and exit")
				print("--version\t\toutput version information and exit")
			case "-h":
				print("Usage: " + CommandLine.arguments[1] + " OPTION")
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
	case "false":
		switch CommandLine.arguments.count {
		case 2:
			exit(1)
		default:
			switch CommandLine.arguments[2] {
			case "--help":
				print("Usage: " + CommandLine.arguments[1] + " OPTION")
				print("--help\t\t\tdisplay this help and exit")
				print("--version\t\toutput version information and exit")
			case "-h":
				print("Usage: " + CommandLine.arguments[1] + " OPTION")
				print("--help\t\t\tdisplay this help and exit")
				print("--version\t\toutput version information and exit")
			case "--version":
				print(VERSION)
			case "-v":
				print(VERSION)
			default:
				exit(1)
			}
		}
	case "hostname":
		switch CommandLine.arguments.count {
		case 2:
			print(Host.current().names[1].replacingOccurrences(of: ".local", with: ""))
		default:
			switch CommandLine.arguments[2] {
			case "--help":
				print("Usage: " + CommandLine.arguments[1] + " OPTION")
				print("--help\t\t\tdisplay this help and exit")
				print("--version\t\toutput version information and exit")
			case "-h":
				print("Usage: " + CommandLine.arguments[1] + " OPTION")
				print("--help\t\t\tdisplay this help and exit")
				print("--version\t\toutput version information and exit")
			case "--version":
				print(VERSION)
			case "-v":
				print(VERSION)
			default:
				eprint("Unable to set hostname to: " + CommandLine.arguments[2])
			}
		}
	/*case "id":
		print()
	case "kill":
		print()
	case "nice":
		print()*/
	case "printenv":
		switch CommandLine.arguments.count {
		case 2:
			print(ProcessInfo.processInfo.environment as AnyObject)
		default:
			switch CommandLine.arguments[2] {
			case "--help":
				print("Usage: " + CommandLine.arguments[1] + " OPTION")
				print("--help\t\t\tdisplay this help and exit")
				print("--version\t\toutput version information and exit")
			case "-h":
				print("Usage: " + CommandLine.arguments[1] + " OPTION")
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
	case "pwd":
		switch CommandLine.arguments.count {
		case 2:
			print(String(cString: getcwd(nil, 0)))
		default:
			switch CommandLine.arguments[2] {
			case "--help":
				print("Usage: " + CommandLine.arguments[1] + " OPTION")
				print("--help\t\t\tdisplay this help and exit")
				print("--version\t\toutput version information and exit")
			case "-h":
				print("Usage: " + CommandLine.arguments[1] + " OPTION")
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
	case "sleep":
		switch CommandLine.arguments.count {
		case 2:
			print("Usage: " + CommandLine.arguments[1] + " seconds")
			print("--help\t\t\tdisplay this help and exit")
			print("--version\t\toutput version information and exit")
		default:
			switch CommandLine.arguments[2] {
			case "--help":
				print("Usage: " + CommandLine.arguments[1] + " seconds")
				print("--help\t\t\tdisplay this help and exit")
				print("--version\t\toutput version information and exit")
			case "-h":
				print("Usage: " + CommandLine.arguments[1] + " seconds")
				print("--help\t\t\tdisplay this help and exit")
				print("--version\t\toutput version information and exit")
			case "--version":
				print(VERSION)
			case "-v":
				print(VERSION)
			default:
				if UInt32(CommandLine.arguments[2]) != nil {
					sleep(UInt32(CommandLine.arguments[2]).unsafelyUnwrapped)
				} else {
					print("Usage: " + CommandLine.arguments[1] + " seconds")
					print("--help\t\t\tdisplay this help and exit")
					print("--version\t\toutput version information and exit")
				}
			}
		}
	/*case "sum":
		print()*/
	case "sync":
		switch CommandLine.arguments.count {
		case 2:
			sync()
		default:
			switch CommandLine.arguments[2] {
			case "--help":
				print("Usage: " + CommandLine.arguments[1] + " OPTION")
				print("--help\t\t\tdisplay this help and exit")
				print("--version\t\toutput version information and exit")
			case "-h":
				print("Usage: " + CommandLine.arguments[1] + " OPTION")
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
	/*case "touch":
		print()*/
	case "true":
		switch CommandLine.arguments.count {
		case 2:
			exit(0)
		default:
			switch CommandLine.arguments[2] {
			case "--help":
				print("Usage: " + CommandLine.arguments[1] + " OPTION")
				print("--help\t\t\tdisplay this help and exit")
				print("--version\t\toutput version information and exit")
			case "-h":
				print("Usage: " + CommandLine.arguments[1] + " OPTION")
				print("--help\t\t\tdisplay this help and exit")
				print("--version\t\toutput version information and exit")
			case "--version":
				print(VERSION)
			case "-v":
				print(VERSION)
			default:
				exit(0)
			}
		}
	/*case "uname":
		print()
	case "uptime":
		print()*/
	case "whoami":
		switch CommandLine.arguments.count {
		case 2:
			print(NSUserName())
		default:
			switch CommandLine.arguments[2] {
			case "--help":
				print("Usage: " + CommandLine.arguments[1] + " OPTION")
				print("--help\t\t\tdisplay this help and exit")
				print("--version\t\toutput version information and exit")
			case "-h":
				print("Usage: " + CommandLine.arguments[1] + " OPTION")
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
	case "yes":
		switch CommandLine.arguments.count {
		case 2:
			while (true) {
					print("y")
			}
		default:
			switch CommandLine.arguments[2] {
			case "--help":
				print("Usage: " + CommandLine.arguments[1] + " [expletive]")
				print("--help\t\t\tdisplay this help and exit")
				print("--version\t\toutput version information and exit")
			case "-h":
				print("Usage: " + CommandLine.arguments[1] + " [expletive]")
				print("--help\t\t\tdisplay this help and exit")
				print("--version\t\toutput version information and exit")
			case "--version":
				print(VERSION)
			case "-v":
				print(VERSION)
			default:
				while (true) {
					print(CommandLine.arguments[2])
				}
			}
		}
	
	// Semi-Done on uutils/coreutils
	case "ls":
		print()
	
	// To Do on uutils/coreutils
	/*case "stty":
		print()*/
	
	default:
		eprint("Unknown command")
	}
}


/* UNCOMPLETED COMMANDS */
/* Done on uutils/coreutils */
/*case "base32":
	print()
case "base64":
	print()
case "basenc":
	print()
case "chcon":
	print()
case "chgrp":
	print()
case "chmod":
	print()
case "chown":
	print()
case "chroot":
	print()
case "cksum":
	print()
case "comm":
	print()
case "csplit":
	print()
case "cut":
	print()
case "dircolors":
	print()
case "du":
	print()
case "expand":
	print()
case "factor":
	print()
case "fmt":
	print()
case "fold":
	print()
case "groups":
	print()
case "hashsum":
	print()
case "head":
	print()
case "hostid":
	print()
case "join":
	print()
case "link":
	print()
case "ln":
	print()
case "logname":
	print()
case "md5sum":
	print()
case "sha1sum":
	print()
case "sha224sum":
	print()
case "sha256sum":
	print()
case "sha384sum":
	print()
case "sha512sum":
	print()
case "mkdir":
	print()
case "mkfifo":
	print()
case "mknod":
	print()
case "mktemp":
	print()
case "mv":
	print()
case "nl":
	print()
case "nohup":
	print()
case "nproc":
	print()
case "paste":
	print()
case "pathchk":
	print()
case "pinky":
	print()
case "ptx":
	print()
case "readlink":
	print()
case "realpath":
	print()
case "relpath":
	print()
case "rm":
	print()
case "rmdir":
	print()
case "runcon":
	print()
case "seq":
	print()
case "shred":
	print()
case "shuf":
	print()
case "stat":
	print()
case "stdbuf":
	print()
case "tee":
	print()
case "timeout":
	print()
case "tr":
	print()
case "truncate":
	print()
case "tsort":
	print()
case "tty":
	print()
case "unexpand":
	print()
case "uniq":
	print()
case "unlink":
	print()
case "users":
	print()
case "wc":
	print()
case "who":
	print()*/


/* Semi-Done on uutils/coreutils */
/*case "cp":
	print()
case "date":
	print()
case "dd":
	print()
case "df":
	print()
case "expr":
	print()
case "install":
	print()
 case "more":
	 print()
 case "numfmt":
	 print()
 case "od":
	 print()
 case "pr":
	 print()
 case "printf":
	 print()
 case "sort":
	 print()
 case "split":
	 print()
 case "tac":
	 print()
 case "tail":
	 print()
 case "test":
	 print()*/
