
img = imread('gm.bmp');

[H,W,~] = size(img);
img2 = zeros(H, W);
figure;
imshow(img);

%%
imhist(img);

%% 명암대비스트레칭
low = 30;
high = 200;

for i=1:H
    for j=1:W
    k = double(img(i,j))-low; %계산할때 실수로 바꿔줌
    k = k * 255 / (high - low);
    img2(i,j) = k;
    
    end
end
img2 = uint8(img2);
figure; imshow(img2);

%%
figure;
imhist(img2);