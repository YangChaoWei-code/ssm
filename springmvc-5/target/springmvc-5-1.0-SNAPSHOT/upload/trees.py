from math import log
import operator

# 计算信息熵 
def calcShannonEnt(dataSet):
    numEntries = len(dataSet)#计算数据集的输入个数  
    labelCounts = {}# 创建存储标签的元字典
    for featVec in dataSet:#对数据集dataSet中的每一行进行循环遍历 
        currentLabel = featVec[-1]# currentLabels为featVec的最后一个元素 
        if currentLabel not in labelCounts.keys():# 如果标签currentLabels不在元字典对应的key中
            labelCounts[currentLabel] = 0# 将标签currentLabels放到字典中作为key，并将值赋为0 
        labelCounts[currentLabel] += 1 # 将currentLabels对应的值加1 
    shannonEnt = 0.0
    for key in labelCounts:# 遍历元字典labelCounts中的key
        prob = float(labelCounts[key])/numEntries# 计算每一个标签出现的概率 
        shannonEnt -= prob * log(prob,2)# 计算每个标签的信息熵并累加到shannonEnt上
    return shannonEnt

# 创建数据集 
def createDataSet():
    dataSet = [[1,1,'yes'],
            [1,1,'yes'],
            [1,0,'no'],
            [0,1,'no'],
            [0,1,'no']]
    labels = ['no sufacing','flippers']
    return dataSet,labels
# 分割数据集 
def splitDataSet(dataSet,axis,value):
    retDataSet = []# 定义要返回的数据集 
    for featVec in dataSet: # 遍历数据集中的每个数据
        if featVec[axis] == value:# 判断列标签对应的值是否为value
            reducedFeatVec = featVec[:axis]# 取0-axis个数据，放到reducedFeatVec中
            reducedFeatVec.extend(featVec[axis+1:])# 取axis+1到最后的数据，放到reducedFeatVec的后面
            retDataSet.append(reducedFeatVec)# 将reducedFeatVec添加到分割后的数据集retDataSet中，没有了axis列的数据
    return retDataSet# 返回分割后的数据集 

# 选择使分割后信息增益最大的特征，即对应的列  
def chooseBestFeatureToSplit(dataSet):
    """选择最好的数据集划分方式"""
    numFeatures = len(dataSet[0]) - 1# 获取特征的数目
    baseEntropy = calcShannonEnt(dataSet)# 计算数据集当前的信息熵  
    bestInfoGain = 0.0# 定义最大的信息增益  
    bestFeature = -1# 定义分割后信息增益最大的特征
    for i in range(numFeatures):# 遍历所有的列，计算每一列分割后的信息增益，找出信息增益最大的列 
        featList = [example[i] for example in dataSet]# 取出第i列特征赋给featList  
        uniqueVals = set(featList) # 将特征对应的值放到一个集合中，使得特征列的数据具有唯一性 
        newEntropy = 0# 定义分割后的信息熵  
        for value in uniqueVals:# 遍历特征列的所有值，分割并计算信息增益
            subDataSet = splitDataSet(dataSet, i, value)# 按照特征列的每个值进行数据集分割
            prob = len(subDataSet)/float(len(dataSet))# 计算分割后的每个子集的概率
            newEntropy += prob * calcShannonEnt(subDataSet)# 计算分割后的子集的信息熵并相加，得到分割后的整个数据集的信息熵 
        infoGain = baseEntropy - newEntropy# 计算分割后的信息增益
        if(infoGain > bestInfoGain):# 如果分割后信息增益大于最好的信息增益
            bestInfoGain = infoGain# 将当前的分割的信息增益赋值为最好信息增益
            bestFeature = i# 分割的最好特征列赋为i
    return bestFeature# 返回分割后信息增益最大的特征列

# 对类标签进行投票 ，找标签数目最多的标签  
def majorityCnt(classList):
    classCount={} # 定义标签元字典
    for vote in classList:# 遍历所有标签
        if vote not in classCount.keys():#如果标签不在元字典对应的key中
            classCount[vote] = 0# 将标签作为key放到字典中，并将值赋为0 
        classCount[vote] += 1# 对应标签的数目加1
    sortedClassCount = sorted(classCount.item(),key=operator.itemgetter(1), reverse=True)# 对所有标签按数目排序
    return sortedClassCount[0][0]# 返回数目最多的标签

# 创建决策树  
def createTree(dataSet, labels):
    classList = [example[-1] for example in dataSet]# 将dataSet的最后一列数据取出赋给classList
    if classList.count(classList[0]) == len(classList):# 判断是否所有的列的标签都一致
        return classList[0]# 直接返回标签列的第一个数据
    if len(dataSet[0]) == 1:# 判断dataSet是否只有一条数据
        return majorityCnt(classList)# 返回标签列数据最多的标签
    bestFeat = chooseBestFeatureToSplit(dataSet) # 选择一个使数据集分割后最大的特征列的索引
    bestFeatLabel = labels[bestFeat]# 找到最好的标签
    myTree = {bestFeatLabel:{}}# 定义决策树，key为bestFeatLabel，value为空
    del (labels[bestFeat])# 删除labels[bestFeat]对应的元素
    featValues = [example[bestFeat] for example in dataSet]# 取出dataSet中bestFeat列的所有值  
    uniqueVals = set(featValues)# 将特征对应的值放到一个集合中，使得特征列的数据具有唯一性 
    for value in uniqueVals:# 遍历uniqueVals中的值 
        subLabels = labels[:]# 子标签subLabels为labels删除bestFeat标签后剩余的标签
        myTree[bestFeatLabel][value] = createTree(splitDataSet(dataSet, bestFeat, value),subLabels) # myTree为key为bestFeatLabel时的决策树
    return myTree # 返回决策树

# 决策树分类函数 
def classify(inputTree,featLabels,testVec):
    firstStr = inputTree.keys()[0]# 得到树中的第一个特征  
    secondDict = inputFree[firstStr]# 得到第一个对应的值 
    featIndex = featLabels.index(firstStr)# 得到树中第一个特征对应的索引  
    for key in scondDict.keys():# 遍历树  
        if testVec[featIndex] == key:# 如果在secondDict[key]中找到testVec[featIndex] 
            if type(secondDict[key]).__name__=='dict':# 判断secondDict[key]是否为字典 
                classLabel = classify(secondDict[key],featLabels,testVec)# 若为字典，递归的寻找testVec 
            else:
                classLabel = secondDict[key]# 若secondDict[key]为标签值，则将secondDict[key]赋给classLabel
    return classLabel# 返回类标签 

# 决策树的序列化 
def storeTree(inputTree,filename):
    import pickle# 导入pyton模块
    with open(filename,'wb+') as fw:# 以写的方式打开文件 
        pickle.dump(inputTree,fw)# 决策树序列化 
# 读取序列化的树 
def grabTree(filename):
    import pickle
    with open(filename,'rb+') as fr:
        return pickle.load(fr) # 返回读到的树 