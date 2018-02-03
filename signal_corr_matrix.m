% import data from text files
%transpose data so that voxel data are organized by column
%corrcoef function to obtain correlation matrix
%fisher transform
%get half of correlation matrix and average
%store to network_correlation_average
%do this for default mode network (DMN) data and for task positive network
%(TPN) data

cd('/home/cgodwin9/MWRSC/converted');

load('FINALsubjectlistforanalysisn112.mat')


network_correlation_average = {};

for i = 1:112
    sub = FINALsubjectlistforanalysisn112(i);
    sub = char(sub);
    input_folder = sprintf('/home/cgodwin9/MWRSC/converted/%s.GSRresults', sub);
    cd(input_folder)
    
    %DMN
    
    dmn_data_file = sprintf('/home/cgodwin9/MWRSC/converted/%s.GSRresults/DMN-GSR_allvoxels_20c_mask100_vox_%s.txt', sub, sub);
    dmn_data = dlmread(dmn_data_file);

    dmn_data = dmn_data(:,4:end);
    mydata = dmn_data';


    results = corrcoef(mydata);
    fisher_results = .5.*log((1+results)./(1-results));
    index = find(tril(ones(size(fisher_results)), -1));
    lower_half = fisher_results(index);
    dmn_avg = nanmean(lower_half);

    network_correlation_average{i,1} = sub;
    network_correlation_average{i,2} = dmn_avg;
    
    
    %TPN

    tpn_data_file = sprintf('/home/cgodwin9/MWRSC/converted/%s.GSRresults/TPN-GSR_allvoxels_20c_mask100_vox_%s.txt', sub, sub);
    tpn_data = dlmread(tpn_data_file);
    
    tpn_data = tpn_data(:,4:end);
    mydata = tpn_data';
    
    results = corrcoef(mydata);
    fisher_results = .5.*log((1+results)./(1-results));
    index = find(tril(ones(size(fisher_results)), -1));
    lower_half = fisher_results(index);
    tpn_avg = nanmean(lower_half);
    
    network_correlation_average{i,3} = tpn_avg;
    

end


