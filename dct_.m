function X=dct_(I,row,coln,flag)
U = dct(eye(8));
Ut = U';
dct_mat = zeros(row,coln,3);
for i=1:3
    for i1=[1:8:row]
        for i2=[1:8:coln]
            Z=I(i1:i1+7,i2:i2+7,i);
            if flag == 0
                W1=U*Z*Ut;
            else
                W1=Ut*Z*U;
            end
            dct_mat(i1:i1+7,i2:i2+7,i)=W1;
        end
    end
end
X = dct_mat;
end

