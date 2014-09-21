from math import log

data = [("Y","S","S","A",True),
        ("Y","S","S","C",True),
        ("Y","S","D","A",True),
        ("Y","S","D","C",True),
        ("Y","L","S","A",True),
        ("Y","L","S","C",False),
        ("Y","L","D","A",False),
        ("Y","L","D","C",False),
        ("P","S","S","A",True),
        ("P","S","S","C",False),
        ("P","S","D","A",False),
        ("P","S","D","C",False),
        ("P","L","S","A",True),
        ("P","L","S","C",False),
        ("P","L","D","A",False),
        ("P","L","D","C",False)]

def filter_feature(data, feature_pos, feature):
    return [tups for tups in data if tups[feature_pos] is feature]
def ID3_heuristic(data):    
    numFeatures = len(data[0])-1
    numTotal = len(data)
    numPos = len([pos for pos in data if pos[numFeatures] is True])
    numNeg = numTotal - numPos
    entropy = -1.0*numPos/numTotal*log(1.0*numPos/numTotal,2) - 1.0*numNeg/numTotal*log(1.0*numNeg/numTotal,2)
    for i in range(numFeatures):
        
        

ID3_heuristic(data)
