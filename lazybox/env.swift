import Foundation

func Env() {
	switch globalState.input.count {
	case (1 + globalState.shift):
		print(ProcessInfo.processInfo.environment as AnyObject)
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
		default:
			eprint("Unknown option")
		}
	}
}
