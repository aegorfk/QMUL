import nltk
from nltk.corpus import treebank
from nltk import tree


def loadData(path):
	with open(path,'r') as f:
		data = f.read().split('\n')
	return data

def getTreeData(data):
	return map(lambda s: tree.Tree.fromstring(s), data)

# Main script
print("loading data..")
data = loadData('parseTrees.txt')
print("generating trees..")
treeData = getTreeData(data)
print("done!")


# here we load in the sentences
sentence22 = treebank.parsed_sents('wsj_0003.mrg')[21]
sentence7 = treebank.parsed_sents('wsj_0003.mrg')[6]
sentence13 = treebank.parsed_sents('wsj_0004.mrg')[12]

# here we define a grammar
grammar = nltk.CFG.fromstring("""
S -> NP VP
NP -> Det N | 'NLP' | 'I'
VP -> V NP
Det -> 'the'
N -> 'students' | 'subject'
V -> 'like' | 'love'
""")

# here we let nltk construct a chart parser from our grammar
parser = nltk.ChartParser(grammar)

# input: a list of words
# returns all the parses of a sentence
def allParses(sentenceList):
	return parser.parse(sentenceList)

# input: a list of parse trees
# prints all the parse trees
def printParses(parses):
	for tree in parses:
		print(tree)

# input: a sentence as a string or as a list of words
# prints a sentence, then parses it and prints all the parse trees
def processSentence(sentence):
    sentenceList = sentence
    if isinstance(sentence,str):
        sentenceList = sentence.split(' ')
    print('Original sentence: ' + ' ' + sentence)
    printParses(allParses(sentenceList))

def mainScript():
	processSentence('I like NLP')
	processSentence('the students love the subject')
