import Foundation

func Hostname(_ shift: Int) {
	switch CommandLine.arguments.count {
	case (1+shift):
		print(Host.current().names[shift].replacingOccurrences(of: ".local", with: ""))
	default:
		switch CommandLine.arguments[(1+shift)] {
		case "--help":
			print("Usage: " + CommandLine.arguments[shift] + " OPTION")
			print("--help\t\t\tdisplay this help and exit")
			print("--version\t\toutput version information and exit")
		case "-h":
			print("Usage: " + CommandLine.arguments[shift] + " OPTION")
			print("--help\t\t\tdisplay this help and exit")
			print("--version\t\toutput version information and exit")
		case "--version":
			print(VERSION)
		case "-v":
			print(VERSION)
		default:
			eprint("Unable to set hostname to: " + CommandLine.arguments[(1+shift)])
		}
	}
}
