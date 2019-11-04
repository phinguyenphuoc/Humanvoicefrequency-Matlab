function [max_val second_peak_loc] = findsample(acf,first_peak_loc)
    seq = acf; 
    l = round(length(seq)/2); 
    half_min = 177;
    seq(first_peak_loc-half_min: first_peak_loc+half_min) = 0; 
    seq(1:(l-551))=0;
    seq((l+551):length(seq))=0;
    [max_val second_peak_loc] = max(seq);