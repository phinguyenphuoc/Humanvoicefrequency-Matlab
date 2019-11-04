[ip fs] = audioread('Khanha.wav'); 
frame_len = (301000)fs; % d? d�i frame ?ng v?i 30ms
F2=134.86; % t?n s? do th? c�ng ? b�i 2
[L1,L2] = findframe(ip);
array_y = []; s = 0;
for i=L1500L2
    range = i(i+frame_len); 
    frame = ip(range); %g�n frame b?ng c�c do?n t�n hi?u nh? c� d? d�i 30ms
    subplot(3,1,1);
    plot(ip);
    title('Tin hieu giong noi goc');
    xlabel('Sample');
    ylabel('Magnitude');
    subplot(3,1,2);
    plot(frame);
    title('Tin hieu phan tich');
    xlabel('Sample');
    ylabel('Magnitude');
    [acf lag] = xcorr(frame, frame); %s? d?ng h�m t? tuong quan cho frame
    max_value_acf = max(abs(acf));
    acf = acfmax_value_acf; %chu?n h�a s? li?u
    first_peak_loc = length(frame); %v? tr� d?nh c?a d? th? t? tuong quan
    [max_val second_peak_loc] = findsample(acf,first_peak_loc);
    %===Ph�n bi?t t�n hi?u tu?n ho�n v� kh�ng tu?n ho�n==
    if max_val  0.4 
        fundamental_frequency = findfre(second_peak_loc,first_peak_loc,fs);
        subplot(3,1,3);
        plot(lag, acf,'r');
        title(['Tu tuong quan  Fo=', num2str(fundamental_frequency), 'Hz']);
        xlabel('Lag Position');
        ylabel('Magnitude');
        array_y = [array_y,fundamental_frequency]; % luu gi� tr? t?n s? F0 v?a                                   t�nh du?c v�o m?ng 
        s = s + fundamental_frequency; % t�nh t?ng t?t c? c�c F0 trong m?ng
    else 
        subplot(3,1,3);
        plot(lag, acf,'r');
        title('Tu tuong quan  Tin hieu khong tuan hoan');
        xlabel('Lag Position');
        ylabel('Magnitude');
    end
    %=====================================================    
end
Fo=slength(array_y); % K?t qu? t?n s? F0 thu du?c
RMSE = findrmse(array_y,F2); % Gi� tr? RMSE
