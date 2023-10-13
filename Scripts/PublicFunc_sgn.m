%% sgn(x)向量函数
% 这里的input默认是n * 1的列向量
function output =  PublicFunc_sgn(input)
output = zeros(size(input,1),1);
for i = 1:size(input,1)
    output(i) = sign(input(i));
end
end