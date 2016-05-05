clear
clc
load ('dictionary.mat')
[wordMap]= getVisualWords(imread('../dat/airport/sun_aerinlrdodkqnypz.jpg'), filterBank, dictionary);

figure(1)
colormap jet;
imagesc(wordMap);