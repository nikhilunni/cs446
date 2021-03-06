#!/bin/bash

mkdir bin

make

# Generate the example features (first and last characters of the
# first names) from the entire dataset. This shows an example of how
# the featurre files may be built. Note that don't necessarily have to
# use Java for this step.

java -cp lib/weka.jar:bin cs446.homework2.FeatureGenerator ../data/badges.train ./../badges.train.arff
java -cp lib/weka.jar:bin cs446.homework2.FeatureGenerator ../data/badges.test.blind ./../badges.test.arff

# Using the features generated above, train a decision tree classifier
# to predict the data. This is just an example code and in the
# homework, you should perform five fold cross-validation. 

#java -cp lib/weka.jar:bin cs446.homework2.BalloonTester ./../balloons.train.arff #1
#java -cp lib/weka.jar:bin cs446.homework2.SGDTester ./../badges.train.arff #2b
#java -cp lib/weka.jar:bin cs446.homework2.WekaTester ./../badges.train.arff #2c
#java -cp lib/weka.jar:bin cs446.homework2.ShortTreeTester ./../badges.train.arff #2d
#java -cp lib/weka.jar:bin cs446.homework2.StumpTester ./../badges.train.arff #2e

