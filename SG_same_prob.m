%Description: This program generates the hitting probabilities to three
%vertices of Sierpinski Gasket with transient probability of 1/3 of going to one of 
%its neighbor in each step. 
%The output of the program is an animated graph showing three average hitting
%probabilities converging to the limit as the the number of walk
%increases. This result corresponds to what in the paper
p = 1/3;
level = 5;                                  %You can edit the level here
i = 1;
top = 0;
left = 0;
right = 0;
rept1 = 1;
rept2 = 2;
rept3 = 3;
n = level - 1;
for j = 1:n   
    rept1 = 1*(10^(j)) + rept1;
    rept2 = 2*(10^(j)) + rept2;
    rept3 = 3*(10^(j)) + rept3;
end
for m = 1:5000
    word(m,:) = 12222;          %you can edit the starting word here
    i(m,:) = 1;
    while word(m,:) ~= rept1 && word(m,:) ~= rept2 && word(m,:) ~= rept3
        dig = fix(mod(word(m,:),10));
        if dig == 1
            word1(m,:) = word(m,:) + 1;
            word2(m,:) = word(m,:) + 2;
            word3(m,:) = generalswap(word(m,:));
        elseif dig == 2
            word1(m,:) = word(m,:) + 1;
            word2(m,:) = word(m,:) - 1;
            word3(m,:) = generalswap(word(m,:));
        else
            word1(m,:) = word(m,:) - 1;
            word2(m,:) = word(m) - 2;
            word3(m,:) = generalswap(word(m,:));
        end
        mylist = [1,2,3];
        c = mylist(randi(numel(mylist)));
        if c == mylist(1)
            word(m,:) = word1(m,:);
        elseif c == mylist(2)
            word(m,:) = word2(m,:);
        else
            word(m,:) = word3(m,:);
        end
        i(m,:) = i(m,:)+1;
    end
    if word(m,:) == rept1
        top = top + 1;
    elseif word(m,:) == rept2
        left = left + 1;
    else
        right = right + 1;
    end
    alpha(m) = top/m;
    beta(m) = left/m;
    theta(m) = right/m;
    t(m) = m;
    plot(t,alpha);
    hold on
    plot(t,beta);
    hold on
    plot(t,theta);
    drawnow()
    grid
end
toc
            