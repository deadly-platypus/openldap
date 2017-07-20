import os
import sys
import argparse
import subprocess

verbose = False
dirstack = []
newcc = None

def pr(line):
    tmpln = str(line)
    if not tmpln.endswith("\n"):
        tmpln = tmpln + "\n"
    sys.stdout.write(tmpln)
    sys.stdout.flush()

def executeCmd(cmd):
    if verbose:
        pr("Input line: %s" % cmd)
    if cmd.startswith("/bin/sh"):
        cmd = "C:/msys64/usr" + cmd

    if executeCompileCmd(cmd):
        return
    elif executeChangeDirCmd(cmd):
        return

def sanitizeAndExecute(cmd):
    cmd = sanitize(cmd)
    if verbose:
        pr("Executing %s" % cmd)
    os.system(cmd)

def sanitize(cmd):
    tokens = cmd.split()
    finalCmd = ""
    for token in tokens:
        add = token + " "
        if add.startswith("/"):
            add = "C:/msys64" + add
        finalCmd += add
    return finalCmd

def extractDir(line):
    tokens = line.split()
    if verbose:
        pr(tokens)
    newDir = tokens[3].replace("\'", "")
    newDir = "C:/msys64" + newDir
    newDir = newDir.replace("/", "\\")
    return newDir

def changeOutputFileName(cmd):
    tokens = cmd.split()
    result = ""
    index = 0
    while index < len(tokens):
        add = tokens[index]
        if add == "-o":
            outputname = tokens[index + 1].replace(".o", "") + ".ll"
            add = add + " " + outputname + " "
            index += 1
        result += add + " "
        index += 1

    return result

def executeChangeDirCmd(changeDirCmd):
    newDir = None

    if changeDirCmd.find("Entering directory") >= 0:
        newDir = extractDir(changeDirCmd)
        dirstack.append(newDir)
    elif changeDirCmd.find("Leaving directory") >= 0:
        dirstack.pop()
        newDir = dirstack[-1]

    if newDir:
        try:
            os.chdir(newDir)
            if verbose:
                pr("CWD: %s" % os.getcwd())
            return True
        except:
            pr("Could not change directory to %s" % newDir)
            raise

    return False

def executeLibToolCmd(libToolCmd):
    libToolCmd = libToolCmd.replace("libtool", "libtool -n", 1)
    if verbose:
        pr("Executing %s" % libToolCmd)
    compileCmds = subprocess.check_output(libToolCmd).splitlines()
    for line in compileCmds:
        if(verbose):
            pr("libtool line: {}".format(line))
        executeCompileCmd(line)

def executeCompileCmd(compileCmd):
    if compileCmd and not compileCmd.strip():
        return False

    if compileCmd.startswith('clang') or \
            compileCmd.find("--mode=compile") >= 0 or \
            compileCmd.split()[0].endswith('clang'):
        # Emit IR
        if compileCmd.find('-emit-llvm') < 0:
            compileCmd = compileCmd.replace("clang", \
                "%s -g -S -emit-llvm -fno-builtin" % newcc, 1)
        # Change *.o to *.ll
        compileCmd = changeOutputFileName(compileCmd)

        try:
            if compileCmd.find('libtool') >= 0:
                executeLibToolCmd(compileCmd)
            else:
                sanitizeAndExecute(compileCmd)
            return True
        except:
            pr("%s failed\n" % compileCmd)
            raise
    return False

def readCmds(inputFile):
    dirstack.append(os.getcwd())
    for line in inputFile:
        executeCmd(line)

def parseArgs():
    parser = argparse.ArgumentParser()
    parser.add_argument("inpath", help="Path to make output")
    parser.add_argument("cc", help="Path to new CC")
    parser.add_argument("-v", "--verbose", help="verbose output",
            action="store_true")
    return parser.parse_args()

def main():
    args = parseArgs()
    inputFile = None
    #try:
    global verbose
    global newcc
    newcc = args.cc
    verbose = args.verbose

    inputFile = open(args.inpath, 'r')
    readCmds(inputFile)
    #except:
    #    print "Unexpected error: ", sys.exc_info()[0]
    #finally:
    #    if inputFile and not inputFile.closed:
    #        inputFile.close()

if __name__ == "__main__":
    main()
