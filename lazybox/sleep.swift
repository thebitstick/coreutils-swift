import Foundation

func Sleep() {
	switch CommandLine.arguments.count {
	case (1+shift):
		print("Usage: " + CommandLine.arguments[shift] + " seconds")
		print("--help\t\t\tdisplay this help and exit")
		print("--version\t\toutput version information and exit")
	default:
		switch CommandLine.arguments[(1+shift)] {
		case "--help":
			print("Usage: " + CommandLine.arguments[shift] + " seconds")
			print("--help\t\t\tdisplay this help and exit")
			print("--version\t\toutput version information and exit")
		case "-h":
			print("Usage: " + CommandLine.arguments[shift] + " seconds")
			print("--help\t\t\tdisplay this help and exit")
			print("--version\t\toutput version information and exit")
		case "--version":
			print(VERSION)
		case "-v":
			print(VERSION)
		default:
			if UInt32(CommandLine.arguments[(1+shift)]) != nil {
				sleep(UInt32(CommandLine.arguments[(1+shift)]).unsafelyUnwrapped)
			} else {
				print("Usage: " + CommandLine.arguments[shift] + " seconds")
				print("--help\t\t\tdisplay this help and exit")
				print("--version\t\toutput version information and exit")
			}
		}
	}
}
