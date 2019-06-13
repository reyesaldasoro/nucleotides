clear all
close all


%% Read the files that have been stored in the current folder
if strcmp(filesep,'/')
    % Running in Mac
        cd ('/Users/ccr22/OneDrive - City, University of London/Acad/Research/Birmingham_Nucleotides')
else
    % running in windows
    cd ('D:\OneDrive - City, University of London\Acad\Research\Birmingham_Nucleotides');
    
end
%% Read the Matlab files, it is assumed they have been converted from txt

dir0 = dir('tr*.mat');

numFiles = size(dir0,1);

%% Select one data set in Matlab and display

k=1;

load(dir0(k).name)

%%     detect minima
[min_100]=movmin(Trace_data(:,4),100);
[min_1000]=movmin(Trace_data(:,4),1000);
[min_10000]=movmin(Trace_data(:,4),10000);
%%

subplot(4,2,1)
hold on
plot(Trace_data(:,1),Trace_data(:,4),'k')
plot(Trace_data(:,1),min_100,'r')
plot(Trace_data(:,1),min_1000,'m')
plot(Trace_data(:,1),min_10000,'b')
hold off
axis tight

subplot(4,2,2)
hold on
plot(Trace_data(:,1),Trace_data(:,4),'k')
plot(Trace_data(:,1),min_100,'r')
plot(Trace_data(:,1),min_1000,'m')
plot(Trace_data(:,1),min_10000,'b')
hold off
set(gca,'xlim',[2.4 3.1])


subplot(4,2,3)
plot(Trace_data(:,1),Trace_data(:,4)-min_100,'r')
subplot(4,2,5)
plot(Trace_data(:,1),Trace_data(:,4)-min_1000,'m')
subplot(4,2,7)
plot(Trace_data(:,1),Trace_data(:,4)-min_10000,'b')
     

subplot(4,2,4)
plot(Trace_data(:,1),Trace_data(:,4)-min_100,'r')
set(gca,'xlim',[2.4 3.1])
subplot(4,2,6)
plot(Trace_data(:,1),Trace_data(:,4)-min_1000,'m')
set(gca,'xlim',[2.4 3.1])
subplot(4,2,8)
plot(Trace_data(:,1),Trace_data(:,4)-min_10000,'b')
set(gca,'xlim',[2.4 3.1])
     
     
%%
plot(Trace_data(:,1),a,'m')