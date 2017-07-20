import os
import sys
import argparse
verbose = False

def prune_lf(lfpath, dfpath):
    lf_funcs = {}
    for line in open(lfpath):
        tokens = line.split()
        if len(tokens) > 2:
            lf_funcs[tokens[1]] = line

    for line in open(dfpath):
        tokens = line.split()
        if len(tokens) == 3 and \
                tokens[2] in lf_funcs:
                    lf_funcs.pop(tokens[2])

    for func in lf_funcs:
        print lf_funcs[func]

def parseArgs():
    parser = argparse.ArgumentParser()
    parser.add_argument("--lf", help="Path to lf file")
    parser.add_argument("--df", help="Path to defined functions file")
    parser.add_argument("-v", "--verbose", help="verbose output",
            action="store_true")
    return parser.parse_args()

def main():
    args = parseArgs()
    global verbose
    verbose = args.verbose
    prune_lf(args.lf, args.df)

if __name__ == "__main__":
    main()
