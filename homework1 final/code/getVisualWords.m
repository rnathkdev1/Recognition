function [wordMap]= getVisualWords(I, filterBank, dictionary)

[filter_response] = extractFilterResponses(I, filterBank);
pix=size(filter_response,2);
size(I);
[~,index] = pdist2(dictionary',filter_response','euclidean','Smallest',1);


for i=1:pix
    tempmap(i)=index(i);
end

wordMap=reshape(tempmap,size(I,1),size(I,2));

figure(1)
colormap jet;
imagesc(wordMap);

end
