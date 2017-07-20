import os
import sys

index_filename = sys.argv[1]
output_filename = sys.argv[2]

index_file = open(index_filename, "r")
output_file = open(output_filename, "w")

function_names = []

skip_functions = []

output_file.write("\t.text\n")

magic_counter = 0

for line in index_file:
	line = line.strip()
	if line == "":
		continue
	if len(line.split()) < 2:
                print "Insufficient args in %s" % line
		exit()
	fname = line.split()[1].strip()
        if fname in function_names or \
                fname in skip_functions:
            continue

        return_type = line.split()[0].strip()

	if len(line.split())>2:
		arg_types = line.split()[2].split(",")
	else:
		arg_types = []
	arg_types = arg_types + ["private", "private", "private", "private"]
	taint_flag = 0
	if return_type == "private":
		taint_flag = 1
	for i in range(4):
		taint_flag *= 2
		if arg_types[i].strip() == "private":
			taint_flag += 1

	output_file.write("\t.globl\t"+fname+"\n")
	output_file.write("\t.p2align\t4,0x90\n")
	output_file.write("__sgx_function_magic_"+str(magic_counter)+":\n")
	output_file.write("\t.space\t8, 0x9a\n")
	output_file.write("\t.byte\t"+str(taint_flag)+"\n")
	output_file.write("\t.space\t7, 0x00\n")
	output_file.write(fname+":\n")
	output_file.write("\tmovabsq\t$__library_dispatch_table, %r10\n")
	output_file.write("\tjmpq\t*"+str(magic_counter*8)+"(%r10)\n")
	output_file.write("\n")
	function_names += [fname]
	magic_counter+=1

output_file.write("\n\n")
output_file.write("\t.section\tsgx_flab\n")
for i in range(magic_counter):
	output_file.write("\t.quad\t__sgx_function_magic_"+str(i)+"\n")


output_file.write("\n\n")
output_file.write("\t.data\n")
output_file.write("\t.globl\t__library_dispatch_table\n")
output_file.write("__library_dispatch_table:\n")
for i in range(magic_counter):
	output_file.write("\t.quad\t0\n")

output_file.write("\t.globl\t__library_dispatcher_names\n")
output_file.write("__library_dispatcher_names:\n")
output_file.write("\t.quad\t"+str(magic_counter)+"\n")

for i in function_names:
	output_file.write("\t.asciz\t\""+i+"\"\n")


output_file.write("\t.section\t.drectve, \"yn\"\n")
output_file.write("\t.ascii\t\" /EXPORT:__library_dispatch_table,DATA /EXPORT:__library_dispatcher_names\"\n")

output_file.close()
