%for use on average roi signals generated from AFNI 
%FINALsubjectlistforanalysisn112 contains a list of the IDs for analysis
% import data from text files
%first column of file is the average signal for the network
%get static correlation between the two networks
%fisher transform correlation
%store to static_correlation

cd('/home/cgodwin9/MWRSC/converted');

load('FINALsubjectlistforanalysisn112.mat')
static_correlation = {};

for i = 1:112
    sub = FINALsubjectlistforanalysisn112(i);
    sub = char(sub);
    input_folder = sprintf('/home/cgodwin9/MWRSC/converted/%s.GSRresults', sub);
    cd(input_folder);
    
    %DMN
    
    dmn_data_file = sprintf('/home/cgodwin9/MWRSC/converted/%s.GSRresults/DMN-GSR_allvoxels_20c_mask100_avg_%s.txt', sub, sub);
    [dmn_data, ~, ~] = importfile(dmn_data_file, 1, 143);
    
    
    %TPN

    tpn_data_file = sprintf('/home/cgodwin9/MWRSC/converted/%s.GSRresults/TPN-GSR_allvoxels_20c_mask100_avg_%s.txt', sub, sub);
    [tpn_data, ~, ~] = importfile(tpn_data_file, 1, 143);
        
    %static correlation
    
    correl = corrcoef(dmn_data, tpn_data); %correl coefficient matrix
    correl = correl(1,2); %correlation
    fisher_correl = .5.*log((1+correl)./(1-correl));
    
    static_correlation{i,1} = sub;
    static_correlation{i,2} = fisher_correl;
    

end

