import sys

def parse_config(filename):
	COMMENT_CHAR = '#'
	OPTION_CHAR = '='
	options = {}
	f = open(filename)
	# Remove comments
	for line in f:
		if COMMENT_CHAR in line:
			line, comment = line.split(COMMENT_CHAR, 1)
	# Find values
		if OPTION_CHAR in line:
			option, value = line.split(OPTION_CHAR, 1)
			# strip spaces:
			option = option.strip()
			value = value.strip()
			# store in dictionary:
			options[option] = value
		
	f.close()
	return options

if __name__ == "__main__":	
	filename = sys.argv[1]
	options = parse_config(filename)
	print options
	
