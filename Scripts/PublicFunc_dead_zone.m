%% 文件名：PublicFunc_dead_zone
function output = PublicFunc_dead_zone(input)
output = zeros(size(input,1)-2,1);
for i = 3:(size(input,1))
    if abs(input(i)) < input(1)
        output(i-2) = 0;
    elseif abs(input(i)) >= input(2)
        output(i-2) = sign(input(i)) * input(2);
    else
        output(i-2) = input(i);
    end
end
end