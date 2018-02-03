function [ExperimentName,Subject,Session,ClockInformation,DataFileBasename,DisplayRefreshRate,ExperimentVersion,Group,Instructions5Duration,Instructions5OffsetTime,Instructions5OnsetTime,Instructions5RTTime,RandomSeed,RestACC,RestCRESP,RestOnsetTime,RestRESP,RestRTTime,RuntimeCapabilities,RuntimeVersion,RuntimeVersionExpected,SessionDate,SessionStartDateTimeUtc,SessionTime,StudioVersion,Block,BaselineDuration,BlockCount,Duration,DurationList,elEndRecording,elEndRecordingCycle,elEndRecordingSample,elStartRecording,elStartRecordingCycle,elStartRecordingSample,KeyboardBlockList,KeyboardBlockListCycle,KeyboardBlockListSample,ProcedureBlock,RunningBlock,startBaselineDuration,startBaselineOnsetTime,sync,syncCycle,syncSample,syncSlideDuration,syncSlideOffsetTime,syncSlideOnsetTime,syncSlideRESP,syncSlideRT,syncSlideRTTime,Trial,after575OffsetTime,after575OnsetTime,beepOnsetDelay,beepOnsetTime,before650OnsetTime,collectTapACC,collectTapCRESP,collectTapOnsetTime,collectTapRESP,collectTapRT,collectTapRTTime,envFollowupPromptRESP,envFollowupPromptRT,envFollowupPromptRTTime,followupPromptRESP,followupPromptRT,followupPromptRTTime,pauseFixationOnsetTime,ProcedureTrial,promptOnsetTime,promptRESP,promptRT,promptRTTime,RunningTrial,trial16s,trial16sCycle,trial16sSample,trial20s,trial20sCycle,trial20sSample,trial24s,trial24sCycle,trial24sSample,trial28s,trial28sCycle,trial28sSample,trial32s,trial32sCycle,trial32sSample,trial36s,trial36sCycle,trial36sSample] = importfile_MRI_task(filename, startRow, endRow)
%IMPORTFILE1 Import numeric data from a text file as column vectors.
%   [EXPERIMENTNAME,SUBJECT,SESSION,CLOCKINFORMATION,DATAFILEBASENAME,DISPLAYREFRESHRATE,EXPERIMENTVERSION,GROUP,INSTRUCTIONS5DURATION,INSTRUCTIONS5OFFSETTIME,INSTRUCTIONS5ONSETTIME,INSTRUCTIONS5RTTIME,RANDOMSEED,RESTACC,RESTCRESP,RESTONSETTIME,RESTRESP,RESTRTTIME,RUNTIMECAPABILITIES,RUNTIMEVERSION,RUNTIMEVERSIONEXPECTED,SESSIONDATE,SESSIONSTARTDATETIMEUTC,SESSIONTIME,STUDIOVERSION,BLOCK,BASELINEDURATION,BLOCKCOUNT,DURATION,DURATIONLIST,ELENDRECORDING,ELENDRECORDINGCYCLE,ELENDRECORDINGSAMPLE,ELSTARTRECORDING,ELSTARTRECORDINGCYCLE,ELSTARTRECORDINGSAMPLE,KEYBOARDBLOCKLIST,KEYBOARDBLOCKLISTCYCLE,KEYBOARDBLOCKLISTSAMPLE,PROCEDUREBLOCK,RUNNINGBLOCK,STARTBASELINEDURATION,STARTBASELINEONSETTIME,SYNC,SYNCCYCLE,SYNCSAMPLE,SYNCSLIDEDURATION,SYNCSLIDEOFFSETTIME,SYNCSLIDEONSETTIME,SYNCSLIDERESP,SYNCSLIDERT,SYNCSLIDERTTIME,TRIAL,AFTER575OFFSETTIME,AFTER575ONSETTIME,BEEPONSETDELAY,BEEPONSETTIME,BEFORE650ONSETTIME,COLLECTTAPACC,COLLECTTAPCRESP,COLLECTTAPONSETTIME,COLLECTTAPRESP,COLLECTTAPRT,COLLECTTAPRTTIME,ENVFOLLOWUPPROMPTRESP,ENVFOLLOWUPPROMPTRT,ENVFOLLOWUPPROMPTRTTIME,FOLLOWUPPROMPTRESP,FOLLOWUPPROMPTRT,FOLLOWUPPROMPTRTTIME,PAUSEFIXATIONONSETTIME,PROCEDURETRIAL,PROMPTONSETTIME,PROMPTRESP,PROMPTRT,PROMPTRTTIME,RUNNINGTRIAL,TRIAL16S,TRIAL16SCYCLE,TRIAL16SSAMPLE,TRIAL20S,TRIAL20SCYCLE,TRIAL20SSAMPLE,TRIAL24S,TRIAL24SCYCLE,TRIAL24SSAMPLE,TRIAL28S,TRIAL28SCYCLE,TRIAL28SSAMPLE,TRIAL32S,TRIAL32SCYCLE,TRIAL32SSAMPLE,TRIAL36S,TRIAL36SCYCLE,TRIAL36SSAMPLE]
%   = IMPORTFILE1(FILENAME) Reads data from text file FILENAME for the
%   default selection.
%
%   [EXPERIMENTNAME,SUBJECT,SESSION,CLOCKINFORMATION,DATAFILEBASENAME,DISPLAYREFRESHRATE,EXPERIMENTVERSION,GROUP,INSTRUCTIONS5DURATION,INSTRUCTIONS5OFFSETTIME,INSTRUCTIONS5ONSETTIME,INSTRUCTIONS5RTTIME,RANDOMSEED,RESTACC,RESTCRESP,RESTONSETTIME,RESTRESP,RESTRTTIME,RUNTIMECAPABILITIES,RUNTIMEVERSION,RUNTIMEVERSIONEXPECTED,SESSIONDATE,SESSIONSTARTDATETIMEUTC,SESSIONTIME,STUDIOVERSION,BLOCK,BASELINEDURATION,BLOCKCOUNT,DURATION,DURATIONLIST,ELENDRECORDING,ELENDRECORDINGCYCLE,ELENDRECORDINGSAMPLE,ELSTARTRECORDING,ELSTARTRECORDINGCYCLE,ELSTARTRECORDINGSAMPLE,KEYBOARDBLOCKLIST,KEYBOARDBLOCKLISTCYCLE,KEYBOARDBLOCKLISTSAMPLE,PROCEDUREBLOCK,RUNNINGBLOCK,STARTBASELINEDURATION,STARTBASELINEONSETTIME,SYNC,SYNCCYCLE,SYNCSAMPLE,SYNCSLIDEDURATION,SYNCSLIDEOFFSETTIME,SYNCSLIDEONSETTIME,SYNCSLIDERESP,SYNCSLIDERT,SYNCSLIDERTTIME,TRIAL,AFTER575OFFSETTIME,AFTER575ONSETTIME,BEEPONSETDELAY,BEEPONSETTIME,BEFORE650ONSETTIME,COLLECTTAPACC,COLLECTTAPCRESP,COLLECTTAPONSETTIME,COLLECTTAPRESP,COLLECTTAPRT,COLLECTTAPRTTIME,ENVFOLLOWUPPROMPTRESP,ENVFOLLOWUPPROMPTRT,ENVFOLLOWUPPROMPTRTTIME,FOLLOWUPPROMPTRESP,FOLLOWUPPROMPTRT,FOLLOWUPPROMPTRTTIME,PAUSEFIXATIONONSETTIME,PROCEDURETRIAL,PROMPTONSETTIME,PROMPTRESP,PROMPTRT,PROMPTRTTIME,RUNNINGTRIAL,TRIAL16S,TRIAL16SCYCLE,TRIAL16SSAMPLE,TRIAL20S,TRIAL20SCYCLE,TRIAL20SSAMPLE,TRIAL24S,TRIAL24SCYCLE,TRIAL24SSAMPLE,TRIAL28S,TRIAL28SCYCLE,TRIAL28SSAMPLE,TRIAL32S,TRIAL32SCYCLE,TRIAL32SSAMPLE,TRIAL36S,TRIAL36SCYCLE,TRIAL36SSAMPLE]
%   = IMPORTFILE1(FILENAME, STARTROW, ENDROW) Reads data from rows STARTROW
%   through ENDROW of text file FILENAME.
%
% Example:
%   [ExperimentName,Subject,Session,ClockInformation,DataFileBasename,DisplayRefreshRate,ExperimentVersion,Group,Instructions5Duration,Instructions5OffsetTime,Instructions5OnsetTime,Instructions5RTTime,RandomSeed,RestACC,RestCRESP,RestOnsetTime,RestRESP,RestRTTime,RuntimeCapabilities,RuntimeVersion,RuntimeVersionExpected,SessionDate,SessionStartDateTimeUtc,SessionTime,StudioVersion,Block,BaselineDuration,BlockCount,Duration,DurationList,elEndRecording,elEndRecordingCycle,elEndRecordingSample,elStartRecording,elStartRecordingCycle,elStartRecordingSample,KeyboardBlockList,KeyboardBlockListCycle,KeyboardBlockListSample,ProcedureBlock,RunningBlock,startBaselineDuration,startBaselineOnsetTime,sync,syncCycle,syncSample,syncSlideDuration,syncSlideOffsetTime,syncSlideOnsetTime,syncSlideRESP,syncSlideRT,syncSlideRTTime,Trial,after575OffsetTime,after575OnsetTime,beepOnsetDelay,beepOnsetTime,before650OnsetTime,collectTapACC,collectTapCRESP,collectTapOnsetTime,collectTapRESP,collectTapRT,collectTapRTTime,envFollowupPromptRESP,envFollowupPromptRT,envFollowupPromptRTTime,followupPromptRESP,followupPromptRT,followupPromptRTTime,pauseFixationOnsetTime,ProcedureTrial,promptOnsetTime,promptRESP,promptRT,promptRTTime,RunningTrial,trial16s,trial16sCycle,trial16sSample,trial20s,trial20sCycle,trial20sSample,trial24s,trial24sCycle,trial24sSample,trial28s,trial28sCycle,trial28sSample,trial32s,trial32sCycle,trial32sSample,trial36s,trial36sCycle,trial36sSample] = importfile1('Sub1_MRT_dissertation.csv',2, 1341);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2017/07/19 14:00:53

%% Initialize variables.
delimiter = ',';
if nargin<=2
    startRow = 2;
    endRow = inf;
end

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(block)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric text to numbers.
% Replace non-numeric text with NaN.
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = dataArray{col};
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[2,3,6,8,9,10,11,12,13,14,16,18,26,27,28,29,30,34,35,36,37,38,39,40,42,43,44,45,46,47,48,49,51,52,53,54,55,56,57,58,59,61,62,63,64,72,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1);
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData{row}, regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if any(numbers==',');
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'));
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator;
                numbers = textscan(strrep(numbers, ',', ''), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch me
        end
    end
end

dateFormats = {'MM/dd/yyyy', 'MM/dd/yyyy HH:mm', 'HH:mm:ss'};
dateFormatIndex = 1;
blankDates = cell(1,size(raw,2));
anyBlankDates = false(size(raw,1),1);
invalidDates = cell(1,size(raw,2));
anyInvalidDates = false(size(raw,1),1);
for col=[22,23,24]% Convert the contents of columns with dates to MATLAB datetimes using the specified date format.
    try
        dates{col} = datetime(dataArray{col}, 'Format', dateFormats{col==[22,23,24]}, 'InputFormat', dateFormats{col==[22,23,24]}); %#ok<SAGROW>
    catch
        try
            % Handle dates surrounded by quotes
            dataArray{col} = cellfun(@(x) x(2:end-1), dataArray{col}, 'UniformOutput', false);
            dates{col} = datetime(dataArray{col}, 'Format', dateFormats{col==[22,23,24]}, 'InputFormat', dateFormats{col==[22,23,24]}); %%#ok<SAGROW>
        catch
            dates{col} = repmat(datetime([NaN NaN NaN]), size(dataArray{col})); %#ok<SAGROW>
        end
    end
    
    dateFormatIndex = dateFormatIndex + 1;
    blankDates{col} = cellfun(@isempty, dataArray{col});
    anyBlankDates = blankDates{col} | anyBlankDates;
    invalidDates{col} = isnan(dates{col}.Hour) - blankDates{col};
    anyInvalidDates = invalidDates{col} | anyInvalidDates;
end
dates = dates(:,[22,23,24]);
blankDates = blankDates(:,[22,23,24]);
invalidDates = invalidDates(:,[22,23,24]);

%% Split data into numeric and cell columns.
rawNumericColumns = raw(:, [2,3,6,8,9,10,11,12,13,14,16,18,26,27,28,29,30,34,35,36,37,38,39,40,42,43,44,45,46,47,48,49,51,52,53,54,55,56,57,58,59,61,62,63,64,72,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95]);
rawCellColumns = raw(:, [1,4,5,7,15,17,19,20,21,25,31,32,33,41,50,60,65,66,67,68,69,70,71,73,74,75,76]);


%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),rawNumericColumns); % Find non-numeric cells
rawNumericColumns(R) = {NaN}; % Replace non-numeric cells

%% Allocate imported array to column variable names
ExperimentName = rawCellColumns(:, 1);
Subject = cell2mat(rawNumericColumns(:, 1));
Session = cell2mat(rawNumericColumns(:, 2));
ClockInformation = rawCellColumns(:, 2);
DataFileBasename = rawCellColumns(:, 3);
DisplayRefreshRate = cell2mat(rawNumericColumns(:, 3));
ExperimentVersion = rawCellColumns(:, 4);
Group = cell2mat(rawNumericColumns(:, 4));
Instructions5Duration = cell2mat(rawNumericColumns(:, 5));
Instructions5OffsetTime = cell2mat(rawNumericColumns(:, 6));
Instructions5OnsetTime = cell2mat(rawNumericColumns(:, 7));
Instructions5RTTime = cell2mat(rawNumericColumns(:, 8));
RandomSeed = cell2mat(rawNumericColumns(:, 9));
RestACC = cell2mat(rawNumericColumns(:, 10));
RestCRESP = rawCellColumns(:, 5);
RestOnsetTime = cell2mat(rawNumericColumns(:, 11));
RestRESP = rawCellColumns(:, 6);
RestRTTime = cell2mat(rawNumericColumns(:, 12));
RuntimeCapabilities = rawCellColumns(:, 7);
RuntimeVersion = rawCellColumns(:, 8);
RuntimeVersionExpected = rawCellColumns(:, 9);
SessionDate = dates{:, 1};
SessionStartDateTimeUtc = dates{:, 2};
SessionTime = dates{:, 3};
StudioVersion = rawCellColumns(:, 10);
Block = cell2mat(rawNumericColumns(:, 13));
BaselineDuration = cell2mat(rawNumericColumns(:, 14));
BlockCount = cell2mat(rawNumericColumns(:, 15));
Duration = cell2mat(rawNumericColumns(:, 16));
DurationList = cell2mat(rawNumericColumns(:, 17));
elEndRecording = rawCellColumns(:, 11);
elEndRecordingCycle = rawCellColumns(:, 12);
elEndRecordingSample = rawCellColumns(:, 13);
elStartRecording = cell2mat(rawNumericColumns(:, 18));
elStartRecordingCycle = cell2mat(rawNumericColumns(:, 19));
elStartRecordingSample = cell2mat(rawNumericColumns(:, 20));
KeyboardBlockList = cell2mat(rawNumericColumns(:, 21));
KeyboardBlockListCycle = cell2mat(rawNumericColumns(:, 22));
KeyboardBlockListSample = cell2mat(rawNumericColumns(:, 23));
ProcedureBlock = cell2mat(rawNumericColumns(:, 24));
RunningBlock = rawCellColumns(:, 14);
startBaselineDuration = cell2mat(rawNumericColumns(:, 25));
startBaselineOnsetTime = cell2mat(rawNumericColumns(:, 26));
sync = cell2mat(rawNumericColumns(:, 27));
syncCycle = cell2mat(rawNumericColumns(:, 28));
syncSample = cell2mat(rawNumericColumns(:, 29));
syncSlideDuration = cell2mat(rawNumericColumns(:, 30));
syncSlideOffsetTime = cell2mat(rawNumericColumns(:, 31));
syncSlideOnsetTime = cell2mat(rawNumericColumns(:, 32));
syncSlideRESP = rawCellColumns(:, 15);
syncSlideRT = cell2mat(rawNumericColumns(:, 33));
syncSlideRTTime = cell2mat(rawNumericColumns(:, 34));
Trial = cell2mat(rawNumericColumns(:, 35));
after575OffsetTime = cell2mat(rawNumericColumns(:, 36));
after575OnsetTime = cell2mat(rawNumericColumns(:, 37));
beepOnsetDelay = cell2mat(rawNumericColumns(:, 38));
beepOnsetTime = cell2mat(rawNumericColumns(:, 39));
before650OnsetTime = cell2mat(rawNumericColumns(:, 40));
collectTapACC = cell2mat(rawNumericColumns(:, 41));
collectTapCRESP = rawCellColumns(:, 16);
collectTapOnsetTime = cell2mat(rawNumericColumns(:, 42));
collectTapRESP = cell2mat(rawNumericColumns(:, 43));
collectTapRT = cell2mat(rawNumericColumns(:, 44));
collectTapRTTime = cell2mat(rawNumericColumns(:, 45));
envFollowupPromptRESP = rawCellColumns(:, 17);
envFollowupPromptRT = rawCellColumns(:, 18);
envFollowupPromptRTTime = rawCellColumns(:, 19);
followupPromptRESP = rawCellColumns(:, 20);
followupPromptRT = rawCellColumns(:, 21);
followupPromptRTTime = rawCellColumns(:, 22);
pauseFixationOnsetTime = rawCellColumns(:, 23);
ProcedureTrial = cell2mat(rawNumericColumns(:, 46));
promptOnsetTime = rawCellColumns(:, 24);
promptRESP = rawCellColumns(:, 25);
promptRT = rawCellColumns(:, 26);
promptRTTime = rawCellColumns(:, 27);
RunningTrial = cell2mat(rawNumericColumns(:, 47));
trial16s = cell2mat(rawNumericColumns(:, 48));
trial16sCycle = cell2mat(rawNumericColumns(:, 49));
trial16sSample = cell2mat(rawNumericColumns(:, 50));
trial20s = cell2mat(rawNumericColumns(:, 51));
trial20sCycle = cell2mat(rawNumericColumns(:, 52));
trial20sSample = cell2mat(rawNumericColumns(:, 53));
trial24s = cell2mat(rawNumericColumns(:, 54));
trial24sCycle = cell2mat(rawNumericColumns(:, 55));
trial24sSample = cell2mat(rawNumericColumns(:, 56));
trial28s = cell2mat(rawNumericColumns(:, 57));
trial28sCycle = cell2mat(rawNumericColumns(:, 58));
trial28sSample = cell2mat(rawNumericColumns(:, 59));
trial32s = cell2mat(rawNumericColumns(:, 60));
trial32sCycle = cell2mat(rawNumericColumns(:, 61));
trial32sSample = cell2mat(rawNumericColumns(:, 62));
trial36s = cell2mat(rawNumericColumns(:, 63));
trial36sCycle = cell2mat(rawNumericColumns(:, 64));
trial36sSample = cell2mat(rawNumericColumns(:, 65));

% For code requiring serial dates (datenum) instead of datetime, uncomment
% the following line(s) below to return the imported dates as datenum(s).

% SessionDate=datenum(SessionDate);
% SessionStartDateTimeUtc=datenum(SessionStartDateTimeUtc);
% SessionTime=datenum(SessionTime);


