%for creating timing files for the regressors of interest
%timing files are output with a series of 9 when there are no trials of the category for the
%run
clear

for s = [5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35]

    clearvars -except s
    sub = int2str(s);
    filename = sprintf('Sub%s_MRI_task_data_RFA.csv', sub);
    [subject_ID,tap_period_duration,RTT_all_5,RTT_all_4,RTT_all_3,RTT_all_2,RTT_all_1,tap_response_5,tap_response_4,tap_response_3,tap_response_2,tap_response_1,tap_count_all_cell,promptRESP_all,env_promptRESP_all,fm_promptRESP_all,timing_file_7beeps,promptRESP_RFA,env_promptRESP_RFA,fm_promptRESP_RFA,block] = importRFAfile(filename);
    timing_file_4sec = timing_file_7beeps + 5;
    
  
        filename_internal = sprintf('internal_Sub%s.1D', sub);
        filename_external = sprintf('external_Sub%s.1D', sub);
        filename_int_free = sprintf('int_free_Sub%s.1D', sub);
        filename_int_const = sprintf('int_const_Sub%s.1D', sub);
    
        fileID_internal = fopen(filename_internal, 'w');
        fileID_external = fopen(filename_external, 'w');
        fileID_int_free = fopen(filename_int_free, 'w');
        fileID_int_const = fopen(filename_int_const, 'w');
    
    for b = 1:5
        [blocked_data] = create_blocked_data(b, block, tap_count_all_cell, promptRESP_RFA, env_promptRESP_RFA, fm_promptRESP_RFA, timing_file_4sec);
        
        internal = [];
        external = [];
        int_free = [];
        int_const = [];
       
      
        for r = 1:15
            if blocked_data(r,1) < 3 || isnan(blocked_data(r,5))
                continue
            elseif blocked_data(r,3) == 1
                external = horzcat(external, blocked_data(r,5));
            elseif blocked_data(r,3) == 2
                internal = horzcat(internal, blocked_data(r,5));
            end
        end
        
        for r = 1:15
            if blocked_data(r,1) < 3 || isnan(blocked_data(r,5))
                continue
            elseif blocked_data(r,3) == 2 && blocked_data(r,4) == 1
                int_free = horzcat(int_free, blocked_data(r,5));
            elseif blocked_data(r,3) == 2 && blocked_data(r,4) == 2
                int_const = horzcat(int_const, blocked_data(r,5));
            end
            
        end
        
        
        internal = check_empty(internal);
        external = check_empty(external);
        int_free = check_empty(int_free);
        int_const = check_empty(int_const);

                
        fprintf(fileID_external, '%.2f ', external);
        fprintf(fileID_external, '\n');
        
        fprintf(fileID_int_free, '%.2f ', int_free);
        fprintf(fileID_int_free, '\n');
        
        fprintf(fileID_int_const, '%.2f ', int_const);
        fprintf(fileID_int_const, '\n');
        
        fprintf(fileID_internal, '%.2f ', internal);
        fprintf(fileID_internal, '\n'); 
    end
    
        fclose(fileID_external);
        fclose(fileID_internal);
        fclose(fileID_int_const);
        fclose(fileID_int_free);
        
end