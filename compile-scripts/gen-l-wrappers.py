import os
import sys
import argparse

def parseArgs():
    parser = argparse.ArgumentParser()
    parser.add_argument("lf", help="Path to lf file")
    return parser.parse_args()

def outputWrapper(lffile):
    sys.stdout.write("#define _CRT_SECURE_NO_WARNINGS\n")
    sys.stdout.write("#include <io.h>\n")
    sys.stdout.write("#include <stdio.h>\n")
    sys.stdout.write("#include <stdlib.h>\n")
    sys.stdout.write("#include <string.h>\n")
    sys.stdout.write("#define EXPORT __declspec(dllexport)\n\n")

    for line in lffile.readlines():
        if not line.strip():
            continue

        tokens = line.split()
        funcname = tokens[1]
        numargs = int(tokens[-1])
        args = ""
        #for i in range(numargs - 1):
        #    argname = chr(ord('a') + i)
        #    args += "void *{}, ".format(argname)

        #if numargs > 0:
        #    args += "void *{}".format(chr(ord('a') + numargs - 1))

        func = "EXPORT int {}__wrapper({}) {{\n".format(funcname, args)
        func += "\t__asm__(\"jmp {}\");\n\treturn 0;\n}}\n".format( \
                funcname)
        sys.stdout.write(func)

def main():
    args = parseArgs()
    lffile = open(args.lf, "r")
    outputWrapper(lffile)
    lffile.close()

if __name__ == "__main__":
    main()
