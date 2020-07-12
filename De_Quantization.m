function De_Quant=De_Quantization(Quant,QX,row,coln)
for i=1:3
    for i1=[1:8:row]
        for i2=[1:8:coln]
            win2 = Quant(i1:i1+7,i2:i2+7,i);
            win3 = win2.*QX;
            dct_dequantized(i1:i1+7,i2:i2+7,i) = win3;
        end
    end
end
    De_Quant=dct_dequantized;
end