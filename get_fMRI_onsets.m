%written 081517 to extract timing file data
function [sync_times, t] = get_fMRI_onsets(t, j, i, condition_length, beepOnsetTime, sync_RTTimes, sync_times)
 
block_length = condition_length/5;
        if t < (block_length + 1)
            sync_times{j} = beepOnsetTime((i-7)) - sync_RTTimes(1); % 7 taps preceding prompt; approx 10 seconds
            t = t + 1;
        elseif t < (block_length *2 + 1)
            sync_times{j} = beepOnsetTime((i-7)) - sync_RTTimes(2);
            t = t + 1;
        elseif t < (block_length *3 + 1)
            sync_times{j} = beepOnsetTime((i-7)) - sync_RTTimes(3);
            t = t + 1;
        elseif t < (block_length *4 + 1)
            sync_times{j} = beepOnsetTime((i-7)) - sync_RTTimes(4);
            t = t + 1;
        else t < (block_length *5 + 1);
            sync_times{j} = beepOnsetTime((i-7)) - sync_RTTimes(5);
            t = t + 1;
        end