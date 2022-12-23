%Read accompanying PDFs to understand what's going on

%%
% Question 1 - Predicting Weather Patterns
%Viterbi Algorithm Complexity - K^2 T
%(K -> Number of states, T -> Number of time steps)

%E (Emission probability)-> probability that a particular state corresponds to a particular
%observation e.g. probability that it is sunny if I had gone for a walk.

clc
clear all

S = ["rainy" "sunny"];
P = [0.2 0.8; 0.4 0.6];
PD = [0.43 0.57];
E = [0.2 0.4 0.4; 0.3 0.25 0.45];
Y=[1 1 2 1 3]; %say

%intialisation
for i=1:size(S,2)
    viterbi_prob(i,1)=PD(i)*E(i,Y(1)); %E(i,1) because first observation is fixed
    viterbi_path(i,1)=0;
end

%computing viterbi path
for j=2:size(Y,2)
    for i=1:size(S,2)
        [viterbi_prob(i,j), viterbi_path(i,j)] = max(E(i, Y(j)).*P(:, i).*viterbi_prob(:, j-1));  
    end
end

[useless, Z(size(Y,2))]= max(viterbi_prob(:,size(Y,2)));
X(size(Y,2)) = S(Z(size(Y,2)));
%Retracking the most likely path X

for j=size(Y,2):-1:2
    Z(j-1)=viterbi_path(Z(j),j);
    X(j-1)=S(Z(j-1));
end

viterbi_path
viterbi_prob
X
Z
%% Predicting Control Laws from Pitch data for aircraft

%Viterbi Algorithm Complexit - K^2 T
%(K -> Number of states, T -> Number of time steps)

%E (Emission probability)-> probability that a particular state corresponds to a particular

clc
clear all

S = ["normal" "alternate" "direct"];
P = [0.7 0.1 0.2; 0.4 0.5 0.1; 0.2 0.3 0.5];
PD = [0.8 0.1 0.1];
E = [0.6 0.4; 0.3 0.7; 0.2 0.8];
Y=[1 2 2 2 2 1 1 2 2 2 2]; 

%intialisation
for i=1:size(S,2)
    viterbi_prob(i,1)=PD(i)*E(i,Y(1)); %E(i,1) because first observation is fixed
    viterbi_path(i,1)=0;
end

%computing viterbi path
for j=2:size(Y,2)
    for i=1:size(S,2)
        [viterbi_prob(i,j), viterbi_path(i,j)] = max(E(i, Y(j)).*P(:, i).*viterbi_prob(:, j-1));  
    end
end

[useless, Z(size(Y,2))]= max(viterbi_prob(:,size(Y,2)));
X(size(Y,2)) = S(Z(size(Y,2)));

%Retracking the most likely path X
for j=size(Y,2):-1:2
    Z(j-1)=viterbi_path(Z(j),j);
    X(j-1)=S(Z(j-1));
end

format shortE
viterbi_prob
viterbi_path
X
Z