%updated 081517 to extract timing file data
%updated 071917 for dissertation MRI task

%trial16s
trial16s_beepOnsetTime = zeros(1,150);
trial16s_collectTapRTTime = zeros(1,150);
trial16s_collectTapRESP = cell(1,30);

trial16s_promptRESP = cell(1,30); %allocate to 30
trial16s_envFollowupPromptRESP = cell(1,30); %allocate to 30
trial16s_followupPromptRESP = cell(1,30); %allocate to 30

sync_times = cell(1,30);
condition_length = length(sync_times); %number of trials in condition

j = 1;
k = 1;
t = 1;
for i = 2:length(trial16s)
    if trial16s(i) == 2
        trial16s_beepOnsetTime(k:(k+4)) = beepOnsetTime((i-5):(i-1)); %obtain the 5 beep onset times
        trial16s_collectTapRTTime(k:(k+4)) = collectTapRTTime((i-5):(i-1)); %obtain the 5 tap onset itmes
        trial16s_collectTapRESP{j} = collectTapRESP((i-5):(i-1)); %obtain the response for each tap
       
        trial16s_promptRESP{j} = promptRESP(i); %first prompt response
        trial16s_envFollowupPromptRESP{j} = envFollowupPromptRESP(i); %int/ext prompt response (empty if not applicable)
        trial16s_followupPromptRESP{j} = followupPromptRESP(i); %freely moving prompt response (empty if not applicable)
        
        [sync_times,t] = get_fMRI_onsets(t, j, i, condition_length, beepOnsetTime, sync_RTTimes, sync_times);
        
        j = j+1;
        k = k+5;
    end
end

% trial16s_promptRESP = trial16s_promptRESP';
% trial16s_envFollowupPromptRESP = trial16s_envFollowupPromptRESP';
% trial16s_followupPromptRESP = trial16s_followupPromptRESP';


field1 = 'beepOnsetTime';
field2 = 'tapRTTime';
field3 = 'tapRESP';
field4 = 'promptRESP';
field5 = 'env_promptRESP';
field6 = 'freely_moving_promptRESP';
field7 = 'onset_fMRI_times';


s16 = struct(field1, trial16s_beepOnsetTime, field2, trial16s_collectTapRTTime, field3, trial16s_collectTapRESP, field4, trial16s_promptRESP, field5, trial16s_envFollowupPromptRESP, field6, trial16s_followupPromptRESP, field7, sync_times);
