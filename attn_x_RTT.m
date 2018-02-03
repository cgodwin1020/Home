clear

load('MRI_behav_data_ALL_Subs1-35.mat')

for sub = [1 10 11 12 13 14 15 16 18 19 2 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 5 6 7 8 9]
    
    subject = int2str(sub);
    subject = strcat("Sub", subject);
    
    %get rows for each subject's data
    sub_rows_idx = ismember(subject_ID, subject);
    sub_rows = find(sub_rows_idx == 1);
    
    blocks = block(sub_rows);
    prompts = promptRESP_RFA(sub_rows);
    RTT = RTT_transformed(sub_rows);
    MRI_onsets = timing_4(sub_rows);
    
    prompts_3_idx = prompts == 3;
    prompts_1_idx = prompts == 1;
    
    prompts_3_rows = find(prompts_3_idx == 1);
    prompts_1_rows = find(prompts_1_idx == 1);
    
   prompts_1 = prompts(prompts_1_rows);
   prompts_3 = prompts(prompts_3_rows);
   RTT_1 = RTT(prompts_1_rows);
   RTT_3 = RTT(prompts_3_rows);
   MRI_onsets_1 = MRI_onsets(prompts_1_rows);
   MRI_onsets_3 = MRI_onsets(prompts_3_rows);
   blocks_1 = blocks(prompts_1_rows);
   blocks_3 = blocks(prompts_3_rows);
 
   
   med_RTT = nanmedian(RTT);
  
   
   RTT_1_above_rows = find(RTT_1 >= med_RTT);
   RTT_1_below_rows = find(RTT_1 < med_RTT);
   RTT_3_above_rows = find(RTT_3 >= med_RTT);
   RTT_3_below_rows = find(RTT_3 < med_RTT);
   
   %store the vars below in struct for future use
   
   RTT_1_above = RTT_1(RTT_1_above_rows);
    data.ra1 = RTT_1_above;
   blocks_1_above = blocks_1(RTT_1_above_rows);
    data.ba1 = blocks_1_above;
   onsets_1_above = MRI_onsets_1(RTT_1_above_rows);
    data.oa1 = onsets_1_above;
   
   RTT_1_below = RTT_1(RTT_1_below_rows);
    data.rb1 = RTT_1_below;
   blocks_1_below = blocks_1(RTT_1_below_rows);
    data.bb1 = blocks_1_below;
   onsets_1_below = MRI_onsets_1(RTT_1_below_rows);
    data.ob1 = onsets_1_below;
   
   RTT_3_above = RTT_3(RTT_3_above_rows);
    data.ra3 = RTT_3_above;
   blocks_3_above = blocks_3(RTT_3_above_rows);
    data.ba3 = blocks_3_above;
   onsets_3_above = MRI_onsets_3(RTT_3_above_rows);
    data.oa3 = onsets_3_above;
   
   RTT_3_below = RTT_3(RTT_3_below_rows);
    data.rb3 = RTT_3_below;
   blocks_3_below = blocks_3(RTT_3_below_rows);
    data.bb3 = blocks_3_below;
   onsets_3_below = MRI_onsets_3(RTT_3_below_rows);
    data.ob3 = onsets_3_below;
   
   
   filename = sprintf('att_x_RTT_data_Sub%d.mat', sub);
   save(filename, 'data');
    
end



