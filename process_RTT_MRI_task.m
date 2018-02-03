%updated 081517 to include timing file information
%updated for dissertation MRI task

clear
for s = [32, 33, 34, 35]
    
    s = int2str(s);
    
%for the ALL condition
%load subject mat file

    sub_mat_file = sprintf('Sub%s_MRI_task_data.mat', s);
    load(sub_mat_file);

S(1,1).a = s16;
S(1,2).a = s20;
S(1,3).a = s24;
S(1,4).a = s28;
S(1,5).a = s32;
S(1,6).a = s36;

%tap period duration
duration = [16, 20, 24, 28, 32, 36];

%headers
mydata_all = {('tap_period_duration'), ('RTT_all_5'), ('RTT_all_4'), ('RTT_all_3'), ('RTT_all_2'), ('RTT_all_1'), ('tap_response_5'), ('tap_response_4'), ('tap_response_3'), ('tap_response_2'), ('tap_response_1'), ('tap_count_all_cell'), ('promptRESP_all'), ('env_promptRESP_all'), ('fm_promptRESP_all'), ('timing_file_7beeps')};

for d = 1:6

    duration_condition = duration(d);
    data = S(d).a;
    data_size = size(data,2);
    condition_column = num2cell((ones(data_size,1)).*duration_condition);

    onset_times = data.beepOnsetTime;
    tap_times = data.tapRTTime;

    %calculating RTT for the last 5 taps per trial
    RTT_all = zeros(data_size,5);
    j = 1;
    for i = 5:5:length(tap_times)
        onset_window = onset_times((i-4):i);
        tap_window = tap_times((i-4):i);
        RTT = onset_window - tap_window;
        RTT_all(j,1:5) = RTT;
        j = j+1;
    end

    RTT_all = num2cell(RTT_all);

    %count number of tap misses in last 5 taps
    tap_count_all = zeros(data_size,1);
    tap_responses_all = zeros(data_size, 5);
    j = [1 1 1 1 1]';
    for i = 1:data_size
        taps = data(i).tapRESP;
        tap_responses_all(i,1:5) = taps';
        count = j == taps;
        total_taps = sum(count);
        tap_count_all(i) = total_taps;
    end
    tap_count_all = num2cell(tap_count_all);
    tap_responses_all = num2cell(tap_responses_all);

    promptRESP_all = cell(data_size,1);
    for i = 1:data_size
        prompt = data(i).promptRESP;
        promptRESP_all{i} = prompt;
    end


    env_promptRESP_all = cell(data_size,1);
    for i = 1:data_size
        prompt = data(i).env_promptRESP;
        env_promptRESP_all{i} = prompt;
    end


    %for constrained/directed prompt
    fm_promptRESP_all = cell(data_size,1);
    for i = 1:data_size
        prompt = data(i).freely_moving_promptRESP;
        fm_promptRESP_all{i} = prompt;
    end

    %timing files
    timing_files_all = cell(data_size,1);
    for i = 1:data_size
        timing = data(i).onset_fMRI_times;
        timing = round((timing/1000),2);
        timing_files_all{i} = timing;
    end
    
    mydata = horzcat(condition_column, RTT_all, tap_responses_all, tap_count_all, promptRESP_all, env_promptRESP_all, fm_promptRESP_all, timing_files_all); 
    mydata_all = vertcat(mydata_all, mydata);
    
end


%creating column for subID 
sub_column = cell(75,1);
subID = cellstr(sub_mat_file(1:end-18));
sub_column(:) = subID;

sub_column_header = {'subject_ID'};
sub_column_all = vertcat(sub_column_header, sub_column);

mydata_all = horzcat(sub_column_all, mydata_all);

sub = sub_mat_file(1:end-4);
filename = sprintf('%s.dat', sub);
T = cell2table(mydata_all);
writetable(T, filename);

clearvars -except s
end
