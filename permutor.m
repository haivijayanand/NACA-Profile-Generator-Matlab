function combinations = permutor(para)
%this code generates all the combinations for any amount of parameters
%The input format should be 1D arrays in a cell, i.e.
%para = {[1 2],[-0.5 0.5],[0.1 0.2]};
%ouput = permutor(para);
n = length(para);
for i = 1:n , len(i) = length(para{i}); end
op = ''; %output
for j = 1:n
    fi = '1'; %first part of repetition array
    se = '1'; %second part of repetition array
    for i = j+1:n , fi = [fi '*len(' int2str(i) ')']; end
    for i = 1:j-1 , se = [se '*len(' int2str(i) ')']; end
    sn = int2str(j); %current number as string
    eval(['temp{' sn '} = repmat(para{' sn '},' fi ',' se ');']);
    op = [op 'temp{' sn '}(:) '];
end
op = ['combinations = [' op '];'];
eval(op);