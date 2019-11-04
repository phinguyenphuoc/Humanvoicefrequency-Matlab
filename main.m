[ip fs] = audioread('Khanha.wav'); 
frame_len = (301000)fs; % d? dài frame ?ng v?i 30ms
F2=134.86; % t?n s? do th? công ? bài 2
[L1,L2] = findframe(ip);
array_y = []; s = 0;
for i=L1500L2
    range = i(i+frame_len); 
    frame = ip(range); %gán frame b?ng các do?n tín hi?u nh? có d? dài 30ms
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
    [acf lag] = xcorr(frame, frame); %s? d?ng hàm t? tuong quan cho frame
    max_value_acf = max(abs(acf));
    acf = acfmax_value_acf; %chu?n hóa s? li?u
    first_peak_loc = length(frame); %v? trí d?nh c?a d? th? t? tuong quan
    [max_val second_peak_loc] = findsample(acf,first_peak_loc);
    %===Phân bi?t tín hi?u tu?n hoàn và không tu?n hoàn==
    if max_val  0.4 
        fundamental_frequency = findfre(second_peak_loc,first_peak_loc,fs);
        subplot(3,1,3);
        plot(lag, acf,'r');
        title(['Tu tuong quan  Fo=', num2str(fundamental_frequency), 'Hz']);
        xlabel('Lag Position');
        ylabel('Magnitude');
        array_y = [array_y,fundamental_frequency]; % luu giá tr? t?n s? F0 v?a                                   tính du?c vào m?ng 
        s = s + fundamental_frequency; % tính t?ng t?t c? các F0 trong m?ng
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
RMSE = findrmse(array_y,F2); % Giá tr? RMSE
