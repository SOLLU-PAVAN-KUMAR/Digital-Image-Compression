function Quant=Quantization(DCT,QX,row,coln)
for i=1:3
    for i1=[1:8:row]
        for i2=[1:8:coln]
            win1 = DCT(i1:i1+7,i2:i2+7,i);
            win2=round(win1./QX);
            dct_quantized(i1:i1+7,i2:i2+7,i)=win2;
        end
    end
end
Quant=dct_quantized;
end
