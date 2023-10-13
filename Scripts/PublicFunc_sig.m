function output = PublicFunc_sig(para,input)
    output = zeros(size(input));
    for i = 1:size(input,1)
        output(i) = sign(input(i)) * (abs(input(i))^para);
    end 
end