function [h] = getImageFeatures(wordMap, dictionarySize)

h=hist(wordMap(:),dictionarySize);% ./ sum(hist(wordMap(:)));
h=h';


end
