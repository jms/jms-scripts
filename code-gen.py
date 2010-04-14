import itertools

code = '3479ACDEFHJKLMNPQRTWXY'
test = itertools.permutations(code,7)

path_prefix = '/home/strafe/data-codes/'
r2 = range(1,32,1)
files = []
for x in r2:
    files.append(path_prefix + "set"+str(x)+".csv")

n=0
y=1000000

for f in files:
    file = open(f,'w')
    x = list(itertools.islice(test,n,y,1))
    for i in x:
        print >> file, "".join(i)

    file.close()
    n=y
    y=y+1000000
        
