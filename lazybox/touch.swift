import Foundation

func Touch() {
	var ignore = false
	switch CommandLine.arguments.count {
	case (1+shift):
		print("Usage: " + CommandLine.arguments[shift] + " [expletive]")
		print("--help\t\t\tdisplay this help and exit")
		print("--version\t\toutput version information and exit")
	default:
		switch CommandLine.arguments[(1+shift)] {
		case "--help":
			print("Usage: " + CommandLine.arguments[shift] + " [expletive]")
			print("--help\t\t\tdisplay this help and exit")
			print("--version\t\toutput version information and exit")
		case "-h":
			print("Usage: " + CommandLine.arguments[shift] + " [expletive]")
			print("--help\t\t\tdisplay this help and exit")
			print("--version\t\toutput version information and exit")
		case "--version":
			print(VERSION)
		case "-v":
			print(VERSION)
		case "-A":
			eprint("Not implemented")
		case "-a":
			if CommandLine.arguments[(1+shift)] == "-m" {
				shift += 1
			}
			if FileManager.default.fileExists(atPath: CommandLine.arguments[(1+shift)]) {
				do {
					try FileManager.default.setAttributes([FileAttributeKey.creationDate: NSDate()],
														  ofItemAtPath: CommandLine.arguments[(1+shift)])
				} catch {
					print(error)
					eprint("Unable to modify access date")
				}
			}
		default:
			if CommandLine.arguments[(1+shift)] == "-c" {
				shift += 1
				ignore = true
			}
			if FileManager.default.fileExists(atPath: CommandLine.arguments[(1+shift)]) {
				do {
					try FileManager.default.setAttributes([FileAttributeKey.modificationDate: NSDate()],
														  ofItemAtPath: CommandLine.arguments[(1+shift)])
				} catch {
					print(error)
					eprint("Unable to modify modification date")
				}
			} else if !ignore {
				FileManager.default.createFile(atPath: CommandLine.arguments[(1+shift)], contents: nil, attributes: nil)
			}
		}
	}
}
