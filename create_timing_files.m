%generates the timing information needed for the regressors of no interest
%(early tapping periods, and prompts)

clear

for sub = [5, 6]

s = int2str(sub);
filename = sprintf('Sub%s_MRT_dissertation.csv', s);
[ExperimentName,Subject,Session,ClockInformation,DataFileBasename,DisplayRefreshRate,ExperimentVersion,Group,Instructions5Duration,Instructions5OffsetTime,Instructions5OnsetTime,Instructions5RTTime,RandomSeed,RestACC,RestCRESP,RestOnsetTime,RestRESP,RestRTTime,RuntimeCapabilities,RuntimeVersion,RuntimeVersionExpected,SessionDate,SessionStartDateTimeUtc,SessionTime,StudioVersion,Block,BaselineDuration,BlockCount,Duration,DurationList,elEndRecording,elEndRecordingCycle,elEndRecordingSample,elStartRecording,elStartRecordingCycle,elStartRecordingSample,KeyboardBlockList,KeyboardBlockListCycle,KeyboardBlockListSample,ProcedureBlock,RunningBlock,startBaselineDuration,startBaselineOnsetTime,sync,syncCycle,syncSample,syncSlideDuration,syncSlideOffsetTime,syncSlideOnsetTime,syncSlideRESP,syncSlideRT,syncSlideRTTime,Trial,after575OffsetTime,after575OnsetTime,beepOnsetDelay,beepOnsetTime,before650OnsetTime,collectTapACC,collectTapCRESP,collectTapOnsetTime,collectTapRESP,collectTapRT,collectTapRTTime,envFollowupPromptRESP,envFollowupPromptRT,envFollowupPromptRTTime,followupPromptRESP,followupPromptRT,followupPromptRTTime,pauseFixationOnsetTime,ProcedureTrial,promptOnsetTime,promptRESP,promptRT,promptRTTime,RunningTrial,trial16s,trial16sCycle,trial16sSample,trial20s,trial20sCycle,trial20sSample,trial24s,trial24sCycle,trial24sSample,trial28s,trial28sCycle,trial28sSample,trial32s,trial32sCycle,trial32sSample,trial36s,trial36sCycle,trial36sSample] = importfile_MRI_task(filename);

last_tap_trials = find(diff(Trial) < 0); %get indices where a trial stops
last_tap_indices = last_tap_trials - 1; %get indices of the last beep of each trial
nan_idx = find(isnan(Trial)); %get indices of last trial for each block, which are followed by nans
nan_idx = nan_idx(3:3:end);
nan_tap_indices = nan_idx - 2;
all_indices = sort(vertcat(last_tap_indices, nan_tap_indices));

sync_RTTimes = syncSlideRTTime(~isnan(syncSlideRTTime));

all_sync_times = vertcat((ones(15,1)*sync_RTTimes(1)), (ones(15,1)*sync_RTTimes(2)), (ones(15,1)*sync_RTTimes(3)), (ones(15,1)*sync_RTTimes(4)), (ones(15,1)*sync_RTTimes(5)));

timing_information = zeros(75,5);
for i = 1:length(all_indices)
    
    last_tap_idx = all_indices(i);
    Trial_value = Trial(last_tap_idx);
    first_tap_idx = last_tap_idx - (Trial_value - 1);
    mid_tap_idx = (last_tap_idx - 7);
    
    
    timing_information(i,1) = before650OnsetTime(first_tap_idx);
    timing_information(i,2) = after575OffsetTime(mid_tap_idx);
  
end

%calculate tap period to be modeled as reg of no interest using the start
%and end of tap period
%use column 1 for start of tap period to be modeled (as reg of no
%interest)
timing_information(:,1) = timing_information(:,1) - all_sync_times;
%use column 2 for end of tap period to be modeled (as reg of no
%interest)
timing_information(:,2) = timing_information(:,2) - all_sync_times;

timing_information(:,3) = timing_information(:,1)/1000;

%the duration for the timing files
timing_information(:,4) = (timing_information(:,2) - timing_information(:,1))/1000;

prompt_idx = find(~cellfun('isempty',promptOnsetTime));
a = promptOnsetTime(prompt_idx);
prompt_onsets = cellfun(@str2num, a);
prompt_onsets = (prompt_onsets - all_sync_times)/1000;

%the onset for the prompts (duration always 16 s)
timing_information(:,5) = prompt_onsets;

filename = sprintf('Sub%d_for_timing_files.mat', sub);
save(filename, 'timing_information');

clearvars -except sub

end
    

