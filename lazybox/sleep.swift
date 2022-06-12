import Foundation

func Sleep() {
	switch globalState.input.count {
	case (1 + globalState.shift):
		print("Usage: " + globalState.input[globalState.shift] + " seconds")
		print("--help\t\t\tdisplay this help and exit")
		print("--version\t\toutput version information and exit")
	default:
		switch globalState.input[(1 + globalState.shift)] {
		case "--help":
			print("Usage: " + globalState.input[globalState.shift] + " seconds")
			print("--help\t\t\tdisplay this help and exit")
			print("--version\t\toutput version information and exit")
		case "-h":
			print("Usage: " + globalState.input[globalState.shift] + " seconds")
			print("--help\t\t\tdisplay this help and exit")
			print("--version\t\toutput version information and exit")
		case "--version":
			print(VERSION)
		case "-v":
			print(VERSION)
		default:
			if UInt32(globalState.input[(1 + globalState.shift)]) != nil {
				sleep(UInt32(globalState.input[(1 + globalState.shift)]).unsafelyUnwrapped)
			} else {
				print("Usage: " + globalState.input[globalState.shift] + " seconds")
				print("--help\t\t\tdisplay this help and exit")
				print("--version\t\toutput version information and exit")
			}
		}
	}
}
