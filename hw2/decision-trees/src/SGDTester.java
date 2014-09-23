package cs446.homework2;

import java.io.File;
import java.io.FileReader;

import weka.classifiers.Evaluation;
import weka.core.Instances;
import cs446.homework2.SGD;

public class SGDTester {

    public static void main(String[] args) throws Exception {

	if (args.length != 1) {
	    System.err.println("Usage: WekaTester arff-file");
	    System.exit(-1);
	}

	// Load the data
	Instances data = new Instances(new FileReader(new File(args[0])));

	// The last attribute is the class label
	data.setClassIndex(data.numAttributes() - 1);

	// Train on 80% of the data and test on 20%
	Instances train = data.trainCV(5,0);
	Instances test = data.testCV(5, 0);

	// Create a new SGD classifier. This is the modified one where you can
	// set the depth of the tree.
	SGD classifier = new SGD();


	// Train
	classifier.buildClassifier(train);

	// Print the classfier
	System.out.println(classifier);
	System.out.println();

	// Evaluate on the test set
	Evaluation evaluation = new Evaluation(test);
	evaluation.evaluateModel(classifier, test);
	System.out.println(evaluation.toSummaryString());

    }
}
