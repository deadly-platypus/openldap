import os
import sys
import argparse
import subprocess
from shutil import copyfile

verbose = False
dest = ""

# These ll files won't be used, and are the result of an compiling
# more files than needed with gen-ir.py
unused = ['libraries_libldap_r_.libs_whoami', \
        'libraries_libldap_r_.libs_vlvctrl', \
        'libraries_libldap_r_.libs_util-int', \
        'libraries_libldap_r_.libs_utf-8', \
        'libraries_libldap_r_.libs_url', \
        'libraries_libldap_r_.libs_unbind', \
        'libraries_libldap_r_.libs_turn', \
        'libraries_libldap_r_.libs_tls2', \
        'libraries_libldap_r_.libs_string', \
        'libraries_libldap_r_.libs_stctrl', \
        'libraries_libldap_r_.libs_sortctrl', \
        'libraries_libldap_r_.libs_sort', \
        'libraries_libldap_r_.libs_search', \
        'libraries_libldap_r_.libs_schema', \
        'libraries_libldap_r_.libs_sbind', \
        'libraries_libldap_r_.libs_sasl', \
        'libraries_libldap_r_.libs_result', \
        'libraries_libldap_r_.libs_request', \
        'libraries_libldap_r_.libs_references', \
        'libraries_libldap_r_.libs_print', \
        'libraries_libldap_r_.libs_ppolicy', \
        'libraries_libldap_r_.libs_passwd', \
        'libraries_libldap_r_.libs_pagectrl', \
        'libraries_libldap_r_.libs_os-ip', \
        'libraries_libldap_r_.libs_options', \
        'libraries_libldap_r_.libs_open', \
        'libraries_libldap_r_.libs_modrdn', \
        'libraries_libldap_r_.libs_modify', \
        'libraries_libldap_r_.libs_messages', \
        'libraries_libldap_r_.libs_ldif', \
        'libraries_libldap_r_.libs_ldap_sync', \
        'libraries_libldap_r_.libs_init', \
        'libraries_libldap_r_.libs_gssapi', \
        'libraries_libldap_r_.libs_getvalues', \
        'libraries_libldap_r_.libs_getvalues', \
        'libraries_libldap_r_.libs_getentry', \
        'libraries_libldap_r_.libs_getdn', \
        'libraries_libldap_r_.libs_getattr', \
        'libraries_libldap_r_.libs_free', \
        'libraries_libldap_r_.libs_filter', \
        'libraries_libldap_r_.libs_fetch', \
        'libraries_libldap_r_.libs_extended', \
        'libraries_libldap_r_.libs_error', \
        'libraries_libldap_r_.libs_dnssrv', \
        'libraries_libldap_r_.libs_deref', \
        'libraries_libldap_r_.libs_delete', \
        'libraries_libldap_r_.libs_dds', \
        'libraries_libldap_r_.libs_cyrus', \
        'libraries_libldap_r_.libs_controls', \
        'libraries_libldap_r_.libs_compare', \
        'libraries_libldap_r_.libs_charray', \
        'libraries_libldap_r_.libs_cancel', \
        'libraries_libldap_r_.libs_bind', \
        'libraries_libldap_r_.libs_assertion', \
        'libraries_libldap_r_.libs_addentry', \
        'libraries_libldap_r_.libs_add', \
        'libraries_libldap_r_.libs_abandon', \
        'libraries_liblber_debug', \
        'servers_slapd_slapmodify']

l_files = [ 'servers_slapd_get_real_passwd', \
            'servers_slapd_l_passwd']

def transfer_objs():
    objs = []
    exclude = [dest, "tests", "clients"]
    for dpath, dnames, fnames in os.walk(os.getcwd(), topdown = True):
        dnames[:] = [d for d in dnames if d not in exclude]
        for i, fname in enumerate(fnames):
            if fname.endswith(".ll"):
                filename = os.path.join(dpath.replace(os.getcwd(), "")[1:], \
                        fname)
                objs.append(filename)

    for obj in objs:
        # Some object files are for external programs and thus
        # contain a 'main' definition. Don't transfer those
        #objContainsMain = subprocess.check_output("""objdump -S %s |
        #        grep \"main\" """ % obj)
        #if objContainsMain and obj is not main:
        #    continue


        destobj = os.path.join(dest, \
                obj.replace("/", "_").replace("\\", "_"))

        if destobj[len(dest) + 1:-3] in unused:
#            print "Skipping {}".format(destobj[len(dest) + 1:-3])
            continue
        elif destobj[len(dest) + 1:-3] in l_files:
            destobj = os.path.join(dest, "L-files", \
                    obj.replace("/", "_").replace("\\", "_"))

        if verbose:
            print "Copying {} to {}".format(obj, destobj)
        copyfile(obj, destobj)


def parseArgs():
    parser = argparse.ArgumentParser()
    parser.add_argument("-s", "--src", help="Path to top level source directory")
    parser.add_argument("-v", "--verbose", help="verbose output",
            action="store_true")
    parser.add_argument("dest", help="path to place object files")
    return parser.parse_args()

def main():
    args = parseArgs()
    global verbose
    global dest
    dest = args.dest
    verbose = args.verbose
    if args.src:
        os.chdir(args.src)
    transfer_objs()

if __name__ == "__main__":
    main()
