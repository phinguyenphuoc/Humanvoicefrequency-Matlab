% tim
function [fundamental_frequency] = findfre(second_peak_loc,first_peak_loc,fs)
     period_in_samples =  abs(second_peak_loc - first_peak_loc); 
     period = period_in_samples*(1/fs); 
     fundamental_frequency = 1/period; 