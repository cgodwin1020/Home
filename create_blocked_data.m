function [blocked_data] = create_blocked_data(b, block, tap_count_all_cell, promptRESP_RFA, env_promptRESP_RFA, fm_promptRESP_RFA, timing_file_4sec)

    block_idx = block == b;
    
    blocked_data = horzcat(tap_count_all_cell(block_idx), promptRESP_RFA(block_idx), env_promptRESP_RFA(block_idx), fm_promptRESP_RFA(block_idx), timing_file_4sec(block_idx));
        