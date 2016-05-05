load('../dat/traintest.mat');

for i=1:length(train_imagenames)
    
    i
    name=all_imagenames{i};
    
    dotindex=find(name=='.');
    train_name{i} = char(name(1:dotindex-1));
    matname=strcat(['../dat/'],train_name{i},['.mat']);
    
    load(matname);
    
    figure(i)
    colormap jet;
    imagesc(wordMap);
    
end
