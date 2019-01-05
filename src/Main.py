from antlr4 import *
import sys


def main():

    print ("Firstly get the input file")
    if len(sys.argv) != 2:
        print ("Command Wrong!")
    
    input = FileStream(sys.argv[1])

if __name__ == "__main__":
    main()
    