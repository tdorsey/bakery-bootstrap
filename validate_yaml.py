#!/usr/bin/python


import yaml,sys;
file = str(sys.argv[1])

print("Validating " + file)
yaml.safe_load(open(file)) 
