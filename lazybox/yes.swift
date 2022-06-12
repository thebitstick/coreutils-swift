import Foundation

func Yes() {
	switch CommandLine.arguments.count {
	case (1+shift):
		while (true) {
				print("y")
		}
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
		default:
			while (true) {
				print(CommandLine.arguments[(1+shift)])
			}
		}
	}
}
