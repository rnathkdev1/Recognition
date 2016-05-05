clc;
clear;
load('../dat/airport/sun_aerinlrdodkqnypz.mat');
layerNum=3;
load('dictionary.mat');
dictionarySize=size(dictionary,2);
[h] = getImageFeaturesSPM(layerNum, wordMap, dictionarySize);
h
hist(h,dictionarySize);
