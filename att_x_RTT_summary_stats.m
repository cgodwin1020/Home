
clear

summary_stats = ones(33,9) * -999;

i = 1;
for sub = [3 1 10 11 12 13 14 15 16 18 19 2 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 5 6 7 8 9]

    filename = sprintf('att_x_RTT_data_Sub%d.mat', sub);
    load(filename);
    
    ra1 = data.ra1;
    rb1 = data.rb1;
    ra3 = data.ra3;
    rb3 = data.rb3;
    
    summary_stats(i,1) = sub;
    summary_stats(i,2) = length(ra1);
    summary_stats(i,3) = length(rb1);
    summary_stats(i,4) = length(ra3);
    summary_stats(i,5) = length(rb3);
    summary_stats(i,6) = mean(ra1);
    summary_stats(i,7) = mean(rb1);
    summary_stats(i,8) = mean(ra3);
    summary_stats(i,9) = mean(rb3);
    
    i = i + 1;
    
end
    
    
    
    