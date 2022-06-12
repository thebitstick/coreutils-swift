#if os(Linux) || os(FreeBSD)
	import Glibc
#else
	import Darwin
	import Foundation
#endif

public struct State {
	var shift: Int
	var command: String
	var input: [String] = CommandLine.arguments
}

public var globalState = State(shift: 0, command: "")

let VERSION = "0.0.1"
let Commands = ["arch",			// COMPLETE
				"env",			// INCOMPLETE {WRONG FORMATTING, NO OPTIONS}
				"false",		// COMPLETE
				"hostname",		// INCOMPLETE {UNABLE TO SET HOSTNAME}
				"printenv",		// INCOMPLETE {WRONG FORMATTING}
				"pwd",			// COMPLETE
				"sleep", 		// COMPLETE
				"sync", 		// INCOMPLETE {NO OPTIONS}
				"touch",		//
				"true", 		// COMPLETE
				"whoami", 		// COMPLETE
				"yes" 			// COMPLETE
				]

public struct StderrOutputStream: TextOutputStream {
	public mutating func write(_ string: String) {
		fputs(string, stderr)
	}
}

func eprint(_ str: String) {
	print(str, to: &errStream)
	exit(1)
}

func displayRootHelp() {
	print("Usage: " + globalState.input[0] + " command [OPTIONS]")
	print("\nAvailable commands:")
	print(Commands.formatted())
}

public var errStream = StderrOutputStream()

/* UNCOMPLETED COMMANDS */
/* Done on uutils/coreutils */
/*
case "base32":
case "base64":
case "basenc":
case "chcon":
case "chgrp":
case "chmod":
case "chown":
case "chroot":
case "cksum":
case "comm":
case "csplit":
case "cut":
case "dircolors":
case "du":
case "expand":
case "factor":
case "fmt":
case "fold":
case "groups":
case "hashsum":
case "head":
case "hostid":
case "join":
case "link":
case "ln":
case "logname":
case "md5sum":
case "sha1sum":
case "sha224sum":
case "sha256sum":
case "sha384sum":
case "sha512sum":
case "mkdir":
case "mkfifo":
case "mknod":
case "mktemp":
case "mv":
case "nl":
case "nohup":
case "nproc":
case "paste":
case "pathchk":
case "pinky":
case "ptx":
case "readlink":
case "realpath":
case "relpath":
case "rm":
case "rmdir":
case "runcon":
case "seq":
case "shred":
case "shuf":
case "stat":
case "stdbuf":
case "tee":
case "timeout":
case "tr":
case "truncate":
case "tsort":
case "tty":
case "unexpand":
case "uniq":
case "unlink":
case "users":
case "wc":
case "who":
*/


/* Semi-Done on uutils/coreutils */
/*
case "cp":
case "date":
case "dd":
case "df":
case "expr":
case "install":
case "more":
case "numfmt":
case "od":
case "pr":
case "printf":
case "sort":
case "split":
case "tac":
case "tail":
case "test":
*/


/* Semi-Done on uutils/coreutils */
/*
case "ls":
*/


/* To Do on uutils/coreutils */
/*
case "stty":
*/
