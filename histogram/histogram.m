%%

img = imread('gm.bmp');

[H,W,~] = size(img);
img2 = zeros(H, W);
figure;
imshow(img);

%% 정규화 되지않은 히스토그램 
figure;
imhist(img);

%% binarization
threshold = 120;

for i=1:H
    for j=1:W
        if(img(i,j) < threshold)
        img2(i,j) = 0;
        else
        img2(i,j) = 255;
        end
    end
end

figure;
imshow(uint8(img2));

%% create histogram(정규화)

hist = zeros(1,256);
numofpixels = H*W;
for i=1:H
    for j=1:W %모든 화소에 대해 처리하기 위해 일반적으로 for 문의 중첩을 사용함
            k = img(i,j) + 1; %1을 추가시켜줘야함
            hist(k) = hist(k) + 1;
    end
end

hist = hist/numofpixels;
figure;
plot(hist);

%% cumulative 누적 히스토그램
cumulhist = zeros(1,256);
sum = 0;

for i = 1:256
    sum = sum + hist(i);
    cumulhist(i) = sum;
end

figure;
plot(cumulhist);

%% histogram equalization 히스토그램 평활화
hist = zeros(1,256);
numofpixels = H*W; %정규화
cumulhist = zeros(1,256);
equalhist = zeros(1,256);
sum = 0;

for i=1:H
    for j=1:W %모든 화소에 대해 처리하기 위해 일반적으로 for 문의 중첩을 사용함
            k = img(i,j) + 1; %1을 추가시켜줘야함
            hist(k) = hist(k) + 1;
    end
end

hist = hist/numofpixels;
%정규화 시킨 다음에 누적시킴! 
for i = 1:256
    sum = sum + hist(i);
    cumulhist(i) = sum;
end

equalhist = cumulhist * 255; %룩업테이블
for i=1:H
    for j=1:W %모든 화소에 대해 처리하기 위해 일반적으로 for 문의 중첩을 사용함
          k = img(i,j);
          img2(i,j)=equalhist(k+1);
    end
end
figure;
imshow(uint8(img2));
%% create histogram(정규화)

hist2 = zeros(1,256);
numofpixels = H*W;
img2 = uint8(img2);
for i=1:H
    for j=1:W %모든 화소에 대해 처리하기 위해 일반적으로 for 문의 중첩을 사용함
            k = img2(i,j) + 1; %1을 추가시켜줘야함
            hist2(k) = hist2(k) + 1;
    end
end

hist2 = hist2/numofpixels;
figure;
plot(hist2);

%% cumulative 누적 히스토그램
cumulhist2 = zeros(1,256);
sum = 0;

for i = 1:256
    sum = sum + hist2(i);
    cumulhist2(i) = sum;
end

figure;
plot(cumulhist2);

