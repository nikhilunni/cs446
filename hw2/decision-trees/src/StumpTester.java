package cs446.homework2;

import java.io.File;
import java.io.FileReader;

import weka.classifiers.Evaluation;
import weka.core.FastVector;
import weka.core.Attribute;
import weka.core.Instance;
import weka.core.Instances;
import cs446.weka.classifiers.trees.Id3;
import weka.core.converters.ArffSaver;
import java.util.*;

public class StumpTester {

    private static HashMap<String,Attribute> attrLookup = new HashMap<String,Attribute>();

    private static Instance makeInstance(double[] features, double value, Instances instances) {
	Instance instance = new Instance(101);
	instance.setDataset(instances);
	for(int i = 0; i < 100; i++) {
	    instance.setValue(attrLookup.get("stump"+i), (int)(features[i])+"");
	}
	instance.setClassValue((value == 0.0 ? "-1" : "1"));
	return instance;
    }

    public static void main(String[] args) throws Exception {

	if (args.length != 1) {
	    System.err.println("Usage: WekaTester arff-file");
	    System.exit(-1);
	}

	// Load the data
	Instances data = new Instances(new FileReader(new File(args[0])));

	// The last attribute is the class label
	data.setClassIndex(data.numAttributes() - 1);


	Id3[] stumps = new Id3[100];
	
	for(int i = 0; i < 100; i++) { //For each stump...
	    data.randomize(new java.util.Random());
	    Instances stumpData = data.trainCV(2,0);
	    stumps[i] = new Id3();
	    stumps[i].setMaxDepth(4);
	    stumps[i].buildClassifier(stumpData);	    
	}
	FastVector zeroOne = new FastVector(2);
	zeroOne.addElement("1");
	zeroOne.addElement("0");
	FastVector labels = new FastVector(2);
	labels.addElement("-1");
	labels.addElement("1");

	FastVector attributes = new FastVector();
	for(int i = 0; i < 100; i++) {
	    Attribute newAttr = new Attribute("stump"+i, zeroOne);
	    attrLookup.put("stump"+i,newAttr);
	    attributes.addElement(newAttr);
	}
	
	Attribute classLabel = new Attribute("Class", labels);
	attrLookup.put("Class", classLabel);
	attributes.addElement(classLabel);


	Instances richFeatures = new Instances("Decision Stumps", attributes, 0);
	richFeatures.setClass(classLabel);
	for(int i = 0; i < data.numInstances(); i++) {
	    Instance cur = data.instance(i);
	    double[] predictions = new double[100];
	    for(int j = 0; j < 100; j++)
		predictions[j] = stumps[j].classifyInstance(cur);
	    richFeatures.add(makeInstance(predictions, cur.classValue(),richFeatures));
	}



	double totalCorrect = 0;
	double totalPossible = 0;
	for(int i = 0; i < 5; i++) {
	    Instances train = richFeatures.trainCV(5,i);
	    Instances test = richFeatures.testCV(5,i);
	    SGD classifier = new SGD();
	    classifier.buildClassifier(train);

	    System.out.println(classifier); System.out.println();
	    
	    Evaluation evaluation = new Evaluation(test);	    
	    evaluation.evaluateModel(classifier, test);
	    System.out.println(evaluation.toSummaryString());
	    totalCorrect += evaluation.correct();
	    totalPossible += evaluation.correct() + evaluation.incorrect();
	}
	System.out.println("Average percentage across five-fold cross validation:");
	System.out.println(totalCorrect / totalPossible * 100 + " %");

	//	if(totalCorrect >= 1995)
	    

    }
}
