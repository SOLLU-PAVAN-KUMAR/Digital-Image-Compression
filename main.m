
clc;
clear all;
Im = imread("image.jpg");
[row coln]=size(Im);
coln=coln/3;
r=ceil(row/8);
c=ceil(coln/8);
I=zeros((r*8),(c*8),3);
I(1:row,1:coln,1:3)=Im;
I= double(I);
I = I - 128;
quality = input('What quality of compression you require - ');
Q50 = [ 16 11 10 16 24 40 51 61;
     12 12 14 19 26 58 60 55;
     14 13 16 24 40 57 69 56;
     14 17 22 29 51 87 80 62; 
     18 22 37 56 68 109 103 77;
     24 35 55 64 81 104 113 92;
     49 64 78 87 103 121 120 101;
     72 92 95 98 112 100 103 99];
 
if quality > 50
    QX = round(Q50.*(ones(8)*((100-quality)/50)));
    QX = uint8(QX);
elseif quality < 50
    QX = round(Q50.*(ones(8)*(50/quality)));
    QX = uint8(QX);
elseif quality == 50
    QX = Q50;
end
QX = double(QX);
DCT=dct_(I,row,coln,0);
Quant=Quantization(DCT,QX,row,coln);
De_Quant=De_Quantization(Quant,QX,row,coln);
Inv_Dct=dct_(De_Quant,row,coln,1);
I2=mat2gray(Inv_Dct);
imwrite(I2,"flower.jpeg");
figure(1);imshow(Im);title('original image');
figure(2);imshow(I2);title('restored image from dct');
