package cs446.homework2;

import weka.classifiers.*;
import weka.core.Instances;
import weka.core.Instance;
import java.util.*;
import java.lang.Boolean;
import java.lang.Exception;

public class SGD extends Classifier{

    private boolean trained = false;
    private ArrayList<Double> w;
    private double w_0;

    private ArrayList<Double> addVectors(ArrayList<Double> a, ArrayList<Double> b) throws Exception{ //out = a + b
	if(a.size() != b.size())
	    throw new Exception("Vector size mismatch!");
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
    private double dot(ArrayList<Double> a, ArrayList<Double> b) throws Exception {
	if(a.size() != b.size())
	    throw new Exception("Vector size mismatch!");
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
	double alpha = 0.0033;
	int numFeatures = arg0.numAttributes()-1;
	w = new ArrayList<Double>(numFeatures);
	w_0 = -1.0;
	for(int i = 0; i < numFeatures; i++)
	    w.add(1.0);

	for(int numRuns = 100; numRuns > 0; numRuns--) {
	    arg0.randomize(new Random(10));
	    for(int i = 0; i < arg0.numInstances(); i++) {
		Instance curInstance = arg0.instance(i);
		ArrayList<Double> x_i = toArrayList(curInstance.toDoubleArray());
		x_i.remove(numFeatures);

		double y_i = (curInstance.classValue() == 0.0 ? -1 : 1);
		double w_error = w_0 + dot(w, x_i) - y_i;
		//w = addVectors(w, multScalar(normalize(x_i), -1.0*alpha*w_error));
		for(int j = 0; j < w.size(); j++) {
		    w.set(j, w.get(j) - alpha*w_error*x_i.get(j) );
		}
		w_0 = w_0 - alpha*w_error;
	    }
	}
	trained = true;
    }


    @Override
    public double classifyInstance(Instance instance) throws java.lang.Exception {
	if(!trained){
	    throw new Exception("The classifier is not trained!");
	}

	ArrayList<Double> x = toArrayList(instance.toDoubleArray()); x.remove(w.size());
	return (dot(w,x) + w_0  >= 0) ? 1.0 : 0.0;
    }

}
