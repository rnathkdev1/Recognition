function [histInter] = distanceToSet(wordHist, histograms)

%This procedure is to match dimensions of wordHist and histograms

T=size(histograms,2);

wordHist=repmat(wordHist,[1,T]);
histInter=sum(min(wordHist,histograms));

end
