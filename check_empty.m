function [timing_row] = check_empty(row)

        if isempty(row)
            row = 999999;
        else
            row = sort(row);
        end
        
        timing_row = row;
