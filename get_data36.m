%updated 081517 to extract timing file data
%updated 071917 for dissertation MRI task

%trial36s
trial36s_beepOnsetTime = zeros(1,25);
trial36s_collectTapRTTime = zeros(1,25);
trial36s_collectTapRESP = cell(1,5);

trial36s_promptRESP = cell(1,5);
trial36s_envFollowupPromptRESP = cell(1,5); 
trial36s_followupPromptRESP = cell(1,5); 

sync_times = cell(1,5);
condition_length = length(sync_times);

j = 1;
k = 1;
t = 1;
for i = 2:length(trial36s)
    if trial36s(i) == 2
        trial36s_beepOnsetTime(k:(k+4)) = beepOnsetTime((i-5):(i-1)); %obtain the 5 beep onset times
        trial36s_collectTapRTTime(k:(k+4)) = collectTapRTTime((i-5):(i-1)); %obtain the 5 tap onset itmes
        trial36s_collectTapRESP{j} = collectTapRESP((i-5):(i-1)); %obtain the response for each tap
       
        trial36s_promptRESP{j} = promptRESP(i); %first prompt response
        trial36s_envFollowupPromptRESP{j} = envFollowupPromptRESP(i); %int/ext prompt response (empty if not applicable)
        trial36s_followupPromptRESP{j} = followupPromptRESP(i); %freely moving prompt response (empty if not applicable)
        
        [sync_times,t] = get_fMRI_onsets(t, j, i, condition_length, beepOnsetTime, sync_RTTimes, sync_times);    
        
        j = j+1;
        k = k+5;
    end
end

field1 = 'beepOnsetTime';
field2 = 'tapRTTime';
field3 = 'tapRESP';
field4 = 'promptRESP';
field5 = 'env_promptRESP';
field6 = 'freely_moving_promptRESP';
field7 = 'onset_fMRI_times';


s36 = struct(field1, trial36s_beepOnsetTime, field2, trial36s_collectTapRTTime, field3, trial36s_collectTapRESP, field4, trial36s_promptRESP, field5, trial36s_envFollowupPromptRESP, field6, trial36s_followupPromptRESP, field7, sync_times);
