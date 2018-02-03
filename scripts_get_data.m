clear

for s = [32, 33, 34, 35]
    
    s = int2str(s);
    
filename = sprintf('Sub%s_MRT_dissertation.csv', s);
[ExperimentName,Subject,Session,ClockInformation,DataFileBasename,DisplayRefreshRate,ExperimentVersion,Group,Instructions5Duration,Instructions5OffsetTime,Instructions5OnsetTime,Instructions5RTTime,RandomSeed,RestACC,RestCRESP,RestOnsetTime,RestRESP,RestRTTime,RuntimeCapabilities,RuntimeVersion,RuntimeVersionExpected,SessionDate,SessionStartDateTimeUtc,SessionTime,StudioVersion,Block,BaselineDuration,BlockCount,Duration,DurationList,elEndRecording,elEndRecordingCycle,elEndRecordingSample,elStartRecording,elStartRecordingCycle,elStartRecordingSample,KeyboardBlockList,KeyboardBlockListCycle,KeyboardBlockListSample,ProcedureBlock,RunningBlock,startBaselineDuration,startBaselineOnsetTime,sync,syncCycle,syncSample,syncSlideDuration,syncSlideOffsetTime,syncSlideOnsetTime,syncSlideRESP,syncSlideRT,syncSlideRTTime,Trial,after575OffsetTime,after575OnsetTime,beepOnsetDelay,beepOnsetTime,before650OnsetTime,collectTapACC,collectTapCRESP,collectTapOnsetTime,collectTapRESP,collectTapRT,collectTapRTTime,envFollowupPromptRESP,envFollowupPromptRT,envFollowupPromptRTTime,followupPromptRESP,followupPromptRT,followupPromptRTTime,pauseFixationOnsetTime,ProcedureTrial,promptOnsetTime,promptRESP,promptRT,promptRTTime,RunningTrial,trial16s,trial16sCycle,trial16sSample,trial20s,trial20sCycle,trial20sSample,trial24s,trial24sCycle,trial24sSample,trial28s,trial28sCycle,trial28sSample,trial32s,trial32sCycle,trial32sSample,trial36s,trial36sCycle,trial36sSample] = importfile_MRI_task(filename);

sub = Subject(1);
sync_RTTimes = syncSlideRTTime(~isnan(syncSlideRTTime));


get_data16
get_data20
get_data24
get_data28
get_data32
get_data36

filename = sprintf('Sub%d_MRI_task_data.mat', sub);
save(filename, 's16', 's20', 's24', 's28', 's32', 's36');

clearvars -except s

end
