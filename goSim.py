import sys, random, math, subprocess, os, datetime

def fuzz_buffer(buffer, factor):
	f = open(buffer, 'r')
	tmp = f.read()
	buf = list(tmp)
	numwrites=random.randrange(math.ceil((float(len(buf)) / factor)))+1
	for j in range(numwrites):
		rbyte = random.randrange(256)
		rn = random.randrange(len(buf))
		buf[rn] = "%c"%(rbyte);
	return "".join(buf)


if(len(sys.argv) == 1):
	print("usage: " + sys.argv[0] + " <filelocation> <filename>")
else:
	fuzzed = fuzz_buffer(sys.argv[1] + sys.argv[2], 10)
	fname = "out_"+sys.argv[2]
	out = open(fname, "wb")
	out.write(fuzzed)
	out.close()
	print fname
	output = subprocess.Popen(["./fuzzSim.sh", "-r", "file://" + sys.argv[1] + fname], stdout=subprocess.PIPE).communicate()[0]
	print(output)
	out = open("log.txt", "a")
	out.write(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")+"\n"+output+"\n")
	os.unlink(fname)