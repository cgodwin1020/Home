%for creating timing files for the regressors of interest
%timing files are output with a series of 9 when there are no trials of the category for the
%run
clear

for s = [32, 33, 34, 35]

    clearvars -except s
    sub = int2str(s);
    filename = sprintf('Sub%s_MRI_task_data_RFA.csv', sub);
    [subject_ID,tap_period_duration,RTT_all_5,RTT_all_4,RTT_all_3,RTT_all_2,RTT_all_1,tap_response_5,tap_response_4,tap_response_3,tap_response_2,tap_response_1,tap_count_all_cell,promptRESP_all,env_promptRESP_all,fm_promptRESP_all,timing_file_7beeps,promptRESP_RFA,env_promptRESP_RFA,fm_promptRESP_RFA,block] = importRFAfile(filename);
    timing_file_4sec = timing_file_7beeps + 5;
    
    
        filename_on_task = sprintf('on_task_Sub%s.1D', sub);
        filename_tri = sprintf('tri_Sub%s.1D', sub);
        filename_mw = sprintf('mw_Sub%s.1D', sub);
        filename_inatt = sprintf('inatt_Sub%s.1D', sub);
    
        fileID_on_task = fopen(filename_on_task, 'w');
        fileID_tri = fopen(filename_tri, 'w');
        fileID_mw = fopen(filename_mw, 'w');
        fileID_inatt = fopen(filename_inatt, 'w');
    
    for b = 1:5
        [blocked_data] = create_blocked_data(b, block, tap_count_all_cell, promptRESP_RFA, env_promptRESP_RFA, fm_promptRESP_RFA, timing_file_4sec);
        
        on_task = [];
        tri = [];
        mw = [];
        inatt = [];
       
      
        for r = 1:15
            if blocked_data(r,1) < 3 || isnan(blocked_data(r,5))
                continue
            elseif blocked_data(r,2) == 1
                on_task = horzcat(on_task, blocked_data(r,5));
            elseif blocked_data(r,2) == 2
                tri = horzcat(tri, blocked_data(r,5));
            elseif blocked_data(r,2) == 3
                mw = horzcat(mw, blocked_data(r,5));
            elseif blocked_data(r,2) == 4
                inatt = horzcat(inatt, blocked_data(r,5));
            end
        end
        
        
        inatt = check_empty(inatt);
        on_task = check_empty(on_task);
        tri = check_empty(tri);
        mw = check_empty(mw);

                
        fprintf(fileID_on_task, '%.2f ', on_task);
        fprintf(fileID_on_task, '\n');
        
        fprintf(fileID_tri, '%.2f ', tri);
        fprintf(fileID_tri, '\n');
        
        fprintf(fileID_mw, '%.2f ', mw);
        fprintf(fileID_mw, '\n');
        
        fprintf(fileID_inatt, '%.2f ', inatt);
        fprintf(fileID_inatt, '\n'); 
    end
    
        fclose(fileID_on_task);
        fclose(fileID_tri);
        fclose(fileID_mw);
        fclose(fileID_inatt);
        
end