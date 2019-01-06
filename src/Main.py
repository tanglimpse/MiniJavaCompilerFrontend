from antlr4 import *
from MiniJavaLexer import MiniJavaLexer
from MiniJavaParser import MiniJavaParser
from MiniJavaVisitor import MiniJavaVisitor
from MiniJavaListener import MiniJavaListener
import sys


def main(argv):

    print ("First get the input file")
    texts = FileStream(argv[1])
    lexer = MiniJavaLexer(texts)
    stream = CommonTokenStream(lexer)
    parser = MiniJavaParser(stream)
    tree = parser.goal()
    print(tree.toStringTree(recog=parser))

if __name__ == "__main__":
    main(sys.argv)
    