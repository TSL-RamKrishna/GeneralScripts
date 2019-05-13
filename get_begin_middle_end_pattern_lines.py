#!/user/bin/env python

# program to delete lines in between BEGIN and END pattern matches, the MIDDLE pattern matches
import sys

# usage: sys.argv[0] inputfile.txt begin_pattern middle_pattern end_pattern

#Example input file is below:

# I Love Linux
# ***** BEGIN *****
# BASH is awesome
# BASH is awesome
# ***** END *****
# I Love Linux
#
# I Love Linux
# ***** BEGIN *****
# BASH is awesome
# BASH is awesome
# ***** END *****
# I Love Linux
#
# I Love Linux
# ***** BEGIN *****
# BASH is awesome
# BASH is aweful
# ***** END *****
# I Love Linux
#
# I Love Linux
# ***** BEGIN *****
# BASH is awesome
# BASH is awesome
# ***** END *****
# I Love Linux
#
# For the command:
# python pattern_search.py input.txt BEGIN aweful END
# It should print
#
# ***** BEGIN *****
# BASH is awesome
# BASH is aweful
# ***** END *****

begin_pattern = sys.argv[2]
middle_pattern = sys.argv[3]
end_pattern = sys.argv[4]

def remove_pattern_begin_middle_end(filename, begin_pattern, middle_pattern, end_pattern):

    with open(sys.argv[1]) as fopen:
        begin=False; middle=False; end=False
        pattern_lines = ''
        for line in fopen:
            if begin_pattern in line:
                begin = True; middle=False; end=False
                pattern_lines = line
                continue

            if middle_pattern in line:
                middle = True; end=False
                pattern_lines += line
                continue

            if end_pattern in line and middle == True and begin == True:
                end = True
                pattern_lines += line.rstrip()
                print(pattern_lines)

                # set back to empty lines
                pattern_lines = ''
                begin = False; middle = False; end = False
            elif begin == True:
                pattern_lines += line

if __name__ == '__main__':
    remove_pattern_begin_middle_end(sys.argv[1], begin_pattern, middle_pattern, end_pattern)

exit(0)
