from math import log

class Node:
    def __init__(self,attribute):
        self.value = attribute
        self.left = None
        self.right = None

    def printChildren(self,space=""):
        if(self != None):
            print(space + str(self.value))
        if(self.left != None):
            self.left.printChildren(space + '\t')
        if(self.right != None):
            self.right.printChildren(space + '\t')

def ID3_heuristic(data,root, length = -1):
    if(len(data) <= 1):
        root.left = Node(data[0][0])
        root.right = Node(data[0][0])
        return
    numFeatures = len(data[0])-1
    numTotal = len(data)
    numPos = len([pos for pos in data if pos[numFeatures] is True])
    numNeg = numTotal - numPos
    if(numPos / numTotal == 1):
        root.left = Node(True)
        root.right = Node(True)
        return
    elif(numNeg / numTotal == 1):
        root.left = Node(False)
        root.right = Node(False)
        return
    entropy = -1.0*numPos/numTotal*log(1.0*numPos/numTotal,2) - 1.0*numNeg/numTotal*log(1.0*numNeg/numTotal,2)
    minValue = (0,2)
    for i in range(numFeatures):
        classes = list(set(c[i] for c in data))
        expected_entropy = 0
        for cur_class in classes:
            totalInClass = [classItem for classItem in data if classItem[i] is cur_class]
            totalNumInClass = len(totalInClass)
            totalPos = len([item for item in totalInClass if item[numFeatures] is True])
            totalNeg = totalNumInClass - totalPos
            percentPos = 1.0*totalPos/totalNumInClass
            percentNeg = 1.0*totalNeg/totalNumInClass
            try:
                expected_entropy -= (1.0*percentPos*log(percentPos,2) + 1.0*percentNeg*log(percentNeg,2))
            except ValueError:
                expected_entropy -= 0
        if(expected_entropy < minValue[1]):
            minValue = (i,expected_entropy)
    split_feature = minValue[0]
    classes = list(set(c[split_feature] for c in data))

    newData0 = [tuple([x[i] for i in range(len(data[0])) if i != split_feature]) for x in data if x[split_feature] is classes[0]]
    newData1 = [tuple([x[i] for i in range(len(data[0])) if i != split_feature]) for x in data if x[split_feature] is classes[1]]

    root.left = Node(classes[0])
    root.right = Node(classes[1])
    
    ID3_heuristic(newData0,root.left)
    ID3_heuristic(newData1,root.right)


def secondHeuristic(data,root):
    if(len(data) <= 1):
        root.left = Node(data[0][0])
        root.right = Node(data[0][0])
        return
    numFeatures = len(data[0])-1
    numTotal = len(data)
    numPos = len([pos for pos in data if pos[numFeatures] is True])
    numNeg = numTotal - numPos
    if(numPos / numTotal == 1):
        root.left = Node(True)
        root.right = Node(True)
        return
    elif(numNeg / numTotal == 1):
        root.left = Node(False)
        root.right = Node(False)
        return
    minValue = (0,2)
    for i in range(numFeatures):
        classes = list(set(c[i] for c in data))
        expected_entropy = 10
        for cur_class in classes:
            totalInClass = [classItem for classItem in data if classItem[i] is cur_class]
            totalNumInClass = len(totalInClass)
            totalPos = len([item for item in totalInClass if item[numFeatures] is True])
            totalNeg = totalNumInClass - totalPos
            percentPos = 1.0*totalPos/totalNumInClass
            percentNeg = 1.0*totalNeg/totalNumInClass
            expected_entropy = min(percentPos,percentNeg, expected_entropy)

        if(expected_entropy < minValue[1]):
            minValue = (i,expected_entropy)
    
    split_feature = minValue[0]
    classes = list(set(c[split_feature] for c in data))

    newData0 = [tuple([x[i] for i in range(len(data[0])) if i != split_feature]) for x in data if x[split_feature] is classes[0]]
    newData1 = [tuple([x[i] for i in range(len(data[0])) if i != split_feature]) for x in data if x[split_feature] is classes[1]]

    root.left = Node(classes[0])
    root.right = Node(classes[1])
    
    secondHeuristic(newData0,root.left)
    secondHeuristic(newData1,root.right)    

data = [("Yellow","Small","Stretch","Adult",True),
        ("Yellow","Small","Stretch","Child",True),
        ("Yellow","Small","Dip","Adult",True),
        ("Yellow","Small","Dip","Child",True),
        ("Yellow","Large","Stretch","Adult",True),
        ("Yellow","Large","Stretch","Child",False),
        ("Yellow","Large","Dip","Adult",False),
        ("Yellow","Large","Dip","Child",False),
        ("Purple","Small","Stretch","Adult",True),
        ("Purple","Small","Stretch","Child",False),
        ("Purple","Small","Dip","Adult",False),
        ("Purple","Small","Dip","Child",False),
        ("Purple","Large","Stretch","Adult",True),
        ("Purple","Large","Stretch","Child",False),
        ("Purple","Large","Dip","Adult",False),
        ("Purple","Large","Dip","Child",False)]    

print("Second Heuristic") 
root1 = Node("ROOT")
secondHeuristic(data, root1)
root1.printChildren()
print("\n\n\n")

print("ID3 Heuristic")
root2 = Node("ROOT")
ID3_heuristic(data, root2)
root2.printChildren()

