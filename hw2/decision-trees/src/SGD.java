package cs446.homework2;

import weka.classifiers.*;
import weka.core.Instances;
import weka.core.Instance;
import java.util.*;
import java.lang.Boolean;

public class SGD extends Classifier{

    private boolean trained = false;
    /*
     * STUDENTS : What kind of state might you need to store in a classifier?
     */
	
    private ArrayList<Double> w;
    private double w_0;

    private ArrayList<Double> addVectors(ArrayList<Double> a, ArrayList<Double> b) { //out = a + b
	ArrayList<Double> out = new ArrayList<Double>(a.size());
	for(int i = 0; i < a.size(); i++)
	    out.add(a.get(i) + b.get(i));
	return out;
    }
    private ArrayList<Double> multScalar(ArrayList<Double> a, double b) { //out = \vec{a}b
	ArrayList<Double> out = new ArrayList<Double>(a.size());
	for(Double cur : a)
	    out.add(cur*b);
	return out;
    }
    private double dot(ArrayList<Double> a, ArrayList<Double> b) {
	double out = 0;
	for(int i = 0; i < a.size(); i++) {	    
	    out += a.get(i) * b.get(i);
	}

	return out;
    }

    private ArrayList<Double> toArrayList(double[] arr) { 
	ArrayList<Double> out = new ArrayList<Double>(arr.length);
	for(int i=0;i<arr.length;i++)
	    out.add(arr[i]);
	return out;
    }

    private void printArrayList(ArrayList<Double> a) {
	System.out.print("[");
	for(int i=0; i < a.size()-1; i++)
	    System.out.print(a.get(i) + ",");
	System.out.println(a.get(a.size()-1) + "]");
    }

    @Override
    public void buildClassifier(Instances arg0) throws Exception {
	double alpha = 0.00003;
	int numFeatures = arg0.numAttributes();
	w = new ArrayList<Double>(numFeatures);
	w_0 = 0;
	for(int i = 0; i < numFeatures; i++)
	    w.add(0.0);


	for(int i = 0; i < arg0.numInstances(); i++) {
	    Instance curInstance = arg0.instance(i);
	    ArrayList<Double> x_i = toArrayList(curInstance.toDoubleArray());
	    double y_i = (curInstance.classValue() == 0.0 ? -1 : 1);
	    double w_error = w_0 + dot(w, x_i) - y_i;
	        
	    w = addVectors(w, multScalar(x_i, alpha*w_error));
	    w_0 = w_0 + alpha*w_error;

	}

	/*
	 * STUDENTS : Implement your learning algorithm (e.g. SGD) inside this function, at the end of this function, your classifier
	 * should be prepared to classify data.
	 */
	//theta_n = theta_n-1 + alpha(y_i - theta_n-1 * x)
	    
	trained = true;//keep this
    }


    @Override
    public double classifyInstance(Instance instance) throws java.lang.Exception {
	if(!trained){
	    throw new Exception("The classifier is not trained!");
	}
	/*
	 * STUDENTS : Implement the decision function here.
	 *
	 * BEWARE: From the API, 
	 * 	Returns:
	 * 		index of the predicted class as a double if the class is nominal, otherwise the predicted value
	 *
	 * 		So for + -, if they are in that order in the ARFF file, you might return 0.0 and 1.0, respectively.
	 */



	double thresh = dot(w,toArrayList(instance.toDoubleArray())) + w_0;
	printArrayList(w);
	return (thresh  >= 0) ? 1.0 : 0.0;
    }

}
