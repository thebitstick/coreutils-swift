#if os(Linux) || os(FreeBSD)
	import Glibc
#else
	import Darwin
	import Foundation
#endif

public var shift = 0

// Parsing https://www.freebsd.org/cgi/man.cgi
switch CommandLine.arguments.count {
	case shift: eprint("Fatal error")
	default:
		switch CommandLine.arguments[shift].replacingOccurrences(of: "./", with: "") {
			case "arch": Arch()
			case "env": Env()
			case "false": False()
			case "hostname": Hostname()
			case "printenv": Printenv()
			case "pwd": Pwd()
			case "sleep": Sleep()
			case "sync": Sync()
			case "touch": Touch()
			case "true": True()
			case "whoami": Whoami()
			case "yes": Yes()
			default:
				switch CommandLine.arguments.count {
					case 1: displayRootHelp()
					default:
						shift += 1
						switch CommandLine.arguments[shift] {
							case "--help": displayRootHelp()
							case "-h": displayRootHelp()
							case "arch": Arch()
							/*case "basename": print()
							case "cat": print()
							case "clear": print()
							case "dirname": print()
							case "echo": print()*/
							case "env": Env()
							case "false": False()
							case "hostname": Hostname()
							/*case "id": print()
							case "kill": print()
							case "nice": print()*/
							case "printenv": Printenv()
							case "pwd": Pwd()
							case "sleep": Sleep()
							/*case "sum": print()*/
							case "sync": Sync()
							case "touch": Touch()
							case "true": True()
							/*case "uname": print()
							case "uptime": print()*/
							case "whoami": Whoami()
							case "yes": Yes()
							default: eprint("Unknown command")
						}
				}
		}
}
