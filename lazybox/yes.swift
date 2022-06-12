import Foundation

func Yes() {
	switch globalState.input.count {
	case (1 + globalState.shift):
		while (true) {
				print("y")
		}
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
		default:
			while (true) {
				print(globalState.input[(1 + globalState.shift)])
			}
		}
	}
}
