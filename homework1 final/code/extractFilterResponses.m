function [filterResponses] = extractFilterResponses(I, filterBank)
% CV Fall 2015 - Provided Code
% Extract the filter responses given the image and filter bank
% Please make sure the output format is unchanged. 
% Inputs: 
%   I:                  a 3-channel RGB image with width W and height H 
%   filterBank:         a cell array of N filters
% Outputs:
%   filterResponses:    a W*H x N*3 matrix of filter responses
 

%To convert the given image to RGB
[pixlen, pixwid, scale]=size(I);

if (scale==1)
    I=repmat(I,[1,1,3]);
end

%Convert input Image to Lab
doubleI = double(I);
[L,a,b] = RGB2Lab(doubleI(:,:,1), doubleI(:,:,2), doubleI(:,:,3));
pixelcount= pixlen*pixwid;

% figure(50)
% %imshow(doubleI,'DisplayRange',[]);
% imshow(L);


%filterResponses:    a W*H x N*3 matrix of filter responses
%filterResponses = zeros(size(doubleI,1)*size(doubleI,2), length(filterBank)*3);
%squareresponse = zeros(size(doubleI,1), size(doubleI,2), length(filterBank)*3);

filterdim=max(size(filterBank));
respno=1;
for i=1:filterdim
    squareresponse=imfilter(L,filterBank{i},'replicate');
    
    filterResponses(respno,:)=reshape(squareresponse,[1,pixelcount]);
    squareresponse=imfilter(a,filterBank{i},'replicate');
    filterResponses(respno+1,:)=reshape(squareresponse,[1,pixelcount]);
    squareresponse=imfilter(b,filterBank{i},'replicate');
%     figure(i)
%     imshow(squareresponse)
    filterResponses(respno+2,:)=reshape(squareresponse,[1,pixelcount]);
    respno=respno+3;
%      figure(i)
%      imshow(imfilter(L,filterBank{i}));

end




end
