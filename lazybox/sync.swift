import Foundation

func Sync() {
	switch globalState.input.count {
	case (1 + globalState.shift):
		sync()
	default:
		switch globalState.input[(1 + globalState.shift)] {
		case "--help":
			print("Usage: " + globalState.input[globalState.shift] + " OPTION")
			print("--help\t\t\tdisplay this help and exit")
			print("--version\t\toutput version information and exit")
		case "-h":
			print("Usage: " + globalState.input[globalState.shift] + " OPTION")
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
