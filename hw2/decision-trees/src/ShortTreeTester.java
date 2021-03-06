package cs446.homework2;

import java.io.File;
import java.io.FileReader;

import weka.classifiers.Evaluation;
import weka.core.Instances;
import cs446.weka.classifiers.trees.Id3;

public class ShortTreeTester {

    public static void main(String[] args) throws Exception {

	if (args.length != 1) {
	    System.err.println("Usage: WekaTester arff-file");
	    System.exit(-1);
	}

	// Load the data
	Instances data = new Instances(new FileReader(new File(args[0])));

	// The last attribute is the class label
	data.setClassIndex(data.numAttributes() - 1);


	double totalCorrect = 0;
	double totalPossible = 0;
	for(int i = 0; i < 5; i++) {
	    // Train on 80% of the data and test on 20%
	    Instances train = data.trainCV(5,i);
	    Instances test = data.testCV(5, i);
	    Id3 classifier = new Id3();
	    classifier.setMaxDepth(4);
	    classifier.buildClassifier(train);

            System.out.println(classifier);
            System.out.println();

	    Evaluation evaluation = new Evaluation(test);
	    evaluation.evaluateModel(classifier, test);
	    System.out.println(evaluation.toSummaryString());
	    totalCorrect += evaluation.correct();
	    totalPossible += evaluation.correct() + evaluation.incorrect();
	}

	System.out.println("Average percentage across five-fold cross validation:");
	System.out.println(totalCorrect / totalPossible * 100 + " %");


	totalCorrect = 0; 
	totalPossible = 0;
	for(int i = 0; i < 5; i++) {
	    // Train on 80% of the data and test on 20%
	    Instances train = data.trainCV(5,i);
	    Instances test = data.testCV(5, i);
	    Id3 classifier = new Id3();
	    classifier.setMaxDepth(8);
	    classifier.buildClassifier(train);

            System.out.println(classifier);
            System.out.println();

	    Evaluation evaluation = new Evaluation(test);
	    evaluation.evaluateModel(classifier, test);
	    System.out.println(evaluation.toSummaryString());
	    totalCorrect += evaluation.correct();
	    totalPossible += evaluation.correct() + evaluation.incorrect();
	}

	System.out.println("Average percentage across five-fold cross validation:");
	System.out.println(totalCorrect / totalPossible * 100 + " %");




	Id3 classifier = new Id3();
	classifier.setMaxDepth(4);
	classifier.buildClassifier(data);
	FeatureGenerator.writePred("./../data/2.d.4.pred", classifier);

	Id3 classifier2 = new Id3();
	classifier.setMaxDepth(8);
	classifier2.buildClassifier(data);
	FeatureGenerator.writePred("./../data/2.d.8.pred", classifier2);

    }
}
