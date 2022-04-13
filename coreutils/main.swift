//
//  main.swift
//  coreutils
//
//  Created by TheBitStick.
//

import Foundation

#if os(Linux) || os(FreeBSD)
	import Glibc
#else
	import Darwin
#endif

// Utilities
let VERSION = "0.0.1"
let Commands = ["arch",			// COMPLETE
				"env",			// INCOMPLETE {WRONG FORMATTING, NO OPTIONS}
				"false",		// COMPLETE
				"hostname",		// INCOMPLETE {UNABLE TO SET HOSTNAME}
				"printenv",		// INCOMPLETE {WRONG FORMATTING}
				"pwd",			// COMPLETE
				"sleep", 		// COMPLETE
				"sync", 		// INCOMPLETE {NO OPTIONS}
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
	print("Usage: " + CommandLine.arguments[0] + " command [OPTIONS]")
	print("\nAvailable commands:")
	print(Commands.formatted())
}

// Parsing https://www.freebsd.org/cgi/man.cgi
public var errStream = StderrOutputStream()
switch CommandLine.arguments.count {
case 0: eprint("Fatal error")
default:
	switch CommandLine.arguments[0].replacingOccurrences(of: "./", with: "") {
	case "arch": Arch(0)
	case "env": Env(0)
	case "false": False(0)
	case "hostname": Hostname(0)
	case "printenv": Printenv(0)
	case "pwd": Pwd(0)
	case "sleep": Sleep(0)
	case "sync": Sync(0)
	case "true": True(0)
	case "whoami": Whoami(0)
	case "yes": Yes(0)
	default:
		switch CommandLine.arguments.count {
		case 1: displayRootHelp()
		default:
			switch CommandLine.arguments[1] {
			case "--help": displayRootHelp()
			case "-h": displayRootHelp()
			case "arch": Arch(1)
			/*case "basename": print()
			case "cat": print()
			case "clear": print()
			case "dirname": print()
			case "echo": print()*/
			case "env": Env(1)
			case "false": False(1)
			case "hostname": Hostname(1)
			/*case "id": print()
			case "kill": print()
			case "nice": print()*/
			case "printenv": Printenv(1)
			case "pwd": Pwd(1)
			case "sleep": Sleep(1)
			/*case "sum": print()*/
			case "sync": Sync(1)
			/*case "touch": print()*/
			case "true": True(1)
			/*case "uname": print()
			case "uptime": print()*/
			case "whoami": Whoami(1)
			case "yes": Yes(1)
			default: eprint("Unknown command")
			}
		}
	}
}

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
