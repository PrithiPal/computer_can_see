function FINAL=euclidean_distance(fv1,fv2)
% feature vectors are of dimension [1,n]

    n = size(fv1,2);
    SUM = 0;
    for i=(1:n)
        x1 = fv1(1,i);
        x2 = fv2(1,i);
        comp = (x1-x2).^2;
        SUM = SUM + comp;
    end
    FINAL = sqrt(SUM);

end