load('../dat/traintest.mat');

for i=700:length(train_imagenames)
    guessImage(strcat(['../dat/'],train_imagenames{i}));
    actualAnswer=mapping{train_labels(i)}
end