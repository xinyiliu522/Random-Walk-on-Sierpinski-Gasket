%Description: This program is a function which codes the word in a random
%walk in Sierpinski Gasket so that the digits of the word swaps in the
%right as the walk goes to one of its neighbor. It works for every level.
function [ newnum ] = generalswap( num )
dignum = numel(num2str(abs(num)));
newnum = 0;
for n = 1:dignum
    Dig(n) = fix(mod(num,10^n)/10^(n-1));                   % record every digit of the integer
end

i = 0;
for n = 1:(dignum-1)                                        % Check how many digits are the same in a roll from the unit digit
    if Dig(n) == Dig(n+1) 
        i = i+1;
    else
        break
    end
end 
restsum = 0;
if dignum - (i+2) > 0
    for n = 1:(dignum - (i+2))                               % Sum up the same digits of the original number
        newnum = newnum + Dig(dignum-n+1)*10^(dignum-n);
    end
    switch1 = Dig(1)* 10^(dignum-n-1);                       % switch the last digit of the original number to the place where the repetition starts
 
    while dignum-n-2 >= 0                                    % let the digit before the repetition in the orig to repete.
        restsum = restsum + Dig(i+2)*10^(dignum-n-2);
        n = n+1;
    end
    newnum = newnum + switch1 + restsum;  
else
    n = 0;
    switch1 = Dig(1)*10^(dignum-1);
    while dignum -2-n >= 0
        newnum = newnum + Dig(dignum)*10^(dignum-n-2);
        n = n+1;
    end
    newnum = switch1+newnum;
end
end
              