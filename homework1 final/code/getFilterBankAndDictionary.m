function [filterBank, dictionary]= getFilterBankAndDictionary(image_names)

num_of_pic=length(image_names);

%Choose the value of alpha and K suitably.
alpha=150;
K=300;
[filterBank] = createFilterBank();
rownum=1;

for i=1:num_of_pic
    string=['Processing the pic: ',num2str(i)];
    disp(string);
    I=imread(image_names{i});
    [filterResponses] = extractFilterResponses(I, filterBank);
    
    pixels=size(filterResponses,2);
    filterdim=size(filterResponses,1);
    
    %choosing random points between 
    points=randperm(pixels,alpha);
    
    disp('Calculating its filter response...')
    for j=points
        for k=1:filterdim
            filter_responses(rownum,k)=filterResponses(k,j);
        end
        rownum=rownum+1;
    end
end

size(filter_responses);
disp('Calculating K Means');

[~, dictionary] = kmeans(filter_responses,K,'EmptyAction','drop');

dictionary=dictionary';

    
end
