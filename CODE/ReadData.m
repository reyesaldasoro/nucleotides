
clear all
close all

cd ('D:\OneDrive - City, University of London\Acad\Research\Birmingham_Nucleotides');

%%

dir0 = dir('*.txt');


%%
for k=4:10

currentTrace_Handle     = fopen(dir0(k).name); 
s                       = fread(currentTrace_Handle); 
numLine                 = sum(s==10); 
fclose(currentTrace_Handle); 


%
clear Trace_data Trace_data_header
Trace_data_header{167,1} = {};
%Load the EPG file that contains the palatogram information in a coded way
currentTrace_Handle           = fopen(dir0(k).name);
%Trace_data                    = fread(currentTrace_Handle);
%Trace_data                    = fscanf(currentTrace_Handle);
for k2=1:167
    Trace_data_header{k2,1}                      = fgetl(currentTrace_Handle);
end
%fclose(currentTrace_Handle);
%
Trace_data(numLine-167,4)=0;
k2=0;
while ~feof(currentTrace_Handle)
    a                   = fgetl(currentTrace_Handle);
    k2                  = k2+1;
    disp(k2)
    Trace_data(k2,:)    = [ str2double(a(1:23)) str2double(a(25:25+22)) str2double(a(49:49+22)) str2double(a(73:73+23)) ];
end

%plot(Trace_data(32000+(1:320)))
% save
nameSave =  strcat(dir0(k).name(1:end-3),'mat');
save(nameSave,'Trace_data','Trace_data_header')






end

