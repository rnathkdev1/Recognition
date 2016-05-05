clear
load('../dat/traintest.mat');

load('dictionary.mat');
dictionarySize=size(dictionary,2);

layerNum=3;

%clear train_labels;

for i=1:length(train_imagenames)
    name=train_imagenames{i};
    
    dotindex=find(name=='.');
    train_name{i} = char(name(1:dotindex-1));
    matname=strcat(['../dat/'],train_name{i},['.mat']);
    
    load(matname);
    
    [h] = getImageFeaturesSPM(layerNum, wordMap, dictionarySize);
    train_features(:,i)=h;
    
end

clearvars -except filterBank dictionary train_features train_labels
save('vision.mat');