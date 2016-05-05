function [h] = getImageFeaturesSPM(layerNum, wordMap, dictionarySize)

L=layerNum-1;
leastdim=2^L;
bins=dictionarySize;

%Dividing the wordmap into layers of 2^L x 2^L
rowlen=size(wordMap,1);
collen=size(wordMap,2);

% rowlen=10;
% collen=9;
% leastdim=2;

rowdiv=floor(rowlen/leastdim);
coldiv=floor(collen/leastdim);

xpoints=[0:rowdiv:rowdiv*(leastdim-1)];
xpoints=[xpoints rowlen];

ypoints=[0:coldiv:coldiv*(leastdim-1)];
ypoints=[ypoints collen];


l=L;
for l=L:-1:0
    
    if (l==0)
        w=2^(-L);
    else w = 2^(l-L-1);
    end
    
    
    for i=1:leastdim
        
        xlow=xpoints(i)+1;
        xhigh=xpoints(i+1);
        for j=1:leastdim
            
            ylow=ypoints(j)+1;
            yhigh=ypoints(j+1);
        
            Temp=wordMap(xlow:xhigh,ylow:yhigh);
            h_iteration=getImageFeatures(Temp,dictionarySize);
            h_iteration=h_iteration*w;
            %summ=sum(h_iteration)
            if (l==L && i==1 && j==1)
                h=h_iteration;
            else h=cat(1,h,h_iteration);
            end
        
        end
    end
    xpoints=xpoints(1:2:leastdim+1);
    ypoints=ypoints(1:2:leastdim+1);
    leastdim=leastdim/2;
    
end

h=h/sum(h);

end
