%Description: This program enables to generates three random probabilities
%which add up to 1 that. Each element in set X has a corresponding
%probability to choose from.
function F = assignprob(P,X)
C = cumsum(P);
F = X(1+sum(C(end)*rand>C));
end

