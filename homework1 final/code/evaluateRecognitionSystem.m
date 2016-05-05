load('../dat/traintest.mat');
n=length(test_imagenames);
for i=1:n
    imagename=strcat(['../dat/'],test_imagenames{i});
    load('vision.mat');
    fprintf('[Loading..]\n');
    image = im2double(imread(imagename));

    fprintf('[Getting Visual Words..]\n');
    wordMap = getVisualWords(image, filterBank, dictionary);
    h = getImageFeaturesSPM( 3, wordMap, size(dictionary,2));
    distances = distanceToSet(h, train_features);
    [~,nnI] = max(distances);
    predictedlabel(i)=train_labels(nnI);
    load('../dat/traintest.mat','mapping');
    guessedImage = mapping{train_labels(nnI)};
    fprintf('[My Guess]:%s.\n',guessedImage);
    actualAnswer=mapping{test_labels(i)}
end

 C=zeros(8,8);
 
 for x=1:n
     i=test_labels(x);
     j=predictedlabel(x);
     C(i,j)=C(i,j)+1;
 end
 
 accuracy=trace(C)/sum(C(:))*100;
