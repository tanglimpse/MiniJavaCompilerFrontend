from antlr4 import *
from MiniJavaLexer import MiniJavaLexer
from MiniJavaParser import MiniJavaParser
from MiniJavaVisitor import MiniJavaVisitor
from MiniJavaListener import MiniJavaListener
import sys


def main(argv):
    if len(argv) != 2:
        print ("Command Wrong! Please use like: python src/Main.py src/tests/xxxxx.java")
    print("First get the input file...")
    texts = FileStream(argv[1])
    print("Processing texts by MiniJavaLexer and MiniJavaParser...")
    lexer = MiniJavaLexer(texts)
    stream = CommonTokenStream(lexer)
    parser = MiniJavaParser(stream)
    tree = parser.goal()
    print("Print the string tree:")
    print(tree.toStringTree(recog=parser))

if __name__ == "__main__":
    main(sys.argv)
    