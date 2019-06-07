clear all
close all

cd ('D:\OneDrive - City, University of London\Acad\Research\Birmingham_Nucleotides');

%%

dir0 = dir('tr*.mat');

numFiles = size(dir0,1);
%%
for k=1:numFiles
    load(dir0(k).name)
    figure(1)
    subplot(numFiles,1,k)
     plot(Trace_data(:,1),Trace_data(:,3))
    figure(2)
    subplot(numFiles,1,k)
     plot(Trace_data(:,1),Trace_data(:,4))
     
end

    