import Foundation

func Touch() {
	var ignore = false
	switch globalState.input.count {
	case (1 + globalState.shift):
		print("Usage: " + globalState.input[globalState.shift] + " [expletive]")
		print("--help\t\t\tdisplay this help and exit")
		print("--version\t\toutput version information and exit")
	default:
		switch globalState.input[(1 + globalState.shift)] {
		case "--help":
			print("Usage: " + globalState.input[globalState.shift] + " [expletive]")
			print("--help\t\t\tdisplay this help and exit")
			print("--version\t\toutput version information and exit")
		case "-h":
			print("Usage: " + globalState.input[globalState.shift] + " [expletive]")
			print("--help\t\t\tdisplay this help and exit")
			print("--version\t\toutput version information and exit")
		case "--version":
			print(VERSION)
		case "-v":
			print(VERSION)
		case "-A":
			eprint("Not implemented")
		case "-a":
			if globalState.input[(1 + globalState.shift)] == "-m" {
				globalState.shift += 1
			}
			if FileManager.default.fileExists(atPath: globalState.input[(1 + globalState.shift)]) {
				do {
					try FileManager.default.setAttributes([FileAttributeKey.creationDate: NSDate()],
														  ofItemAtPath: globalState.input[(1 + globalState.shift)])
				} catch {
					print(error)
					eprint("Unable to modify access date")
				}
			}
		default:
			if globalState.input[(1 + globalState.shift)] == "-c" {
				globalState.shift += 1
				ignore = true
			}
			if FileManager.default.fileExists(atPath: globalState.input[(1 + globalState.shift)]) {
				do {
					try FileManager.default.setAttributes([FileAttributeKey.modificationDate: NSDate()],
														  ofItemAtPath: globalState.input[(1 + globalState.shift)])
				} catch {
					print(error)
					eprint("Unable to modify modification date")
				}
			} else if !ignore {
				FileManager.default.createFile(atPath: globalState.input[(1 + globalState.shift)], contents: nil, attributes: nil)
			}
		}
	}
}
