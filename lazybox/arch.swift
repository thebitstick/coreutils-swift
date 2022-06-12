import Foundation

func Arch() {
	switch CommandLine.arguments.count {
	case (1+shift):
		#if arch(i386)
			print("i386")
		#elseif arch(x86_64)
			print("x86_64")
		#elseif arch(arm)
			print("arm")
		#elseif arch(arm64)
			print("arm64")
		#else
			print("Unknown")
		#endif
	default:
		switch CommandLine.arguments[(1+shift)] {
		case "--help":
			print("Usage: " + CommandLine.arguments[shift] + " [OPTION]...")
			print("--help\t\t\tdisplay this help and exit")
			print("--version\t\toutput version information and exit")
		case "-h":
			print("Usage: " + CommandLine.arguments[shift] + " [OPTION]...")
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
