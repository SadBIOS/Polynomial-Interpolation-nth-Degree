%Nth Polyreg By Kashem
close all
clear all
clc

%Variable Setup
x = [ ]; %x array
y = [ ]; %y array
m = ; %degree of polynomial to be generated

%Main Function
k = m + 1; %matrix dimension
n = length(x);

%AMat
matA = zeros(k);
for i = 1:k
    for j = 1:k
        if i == 1 & j == 1
            matA(i,j) = n;
        else
            if i == 1
                for l = 2:k
                    matA(1,l) = sum(x.^(l - 1));
                end
            end
        end
        
    end
    if i > 1
        q = i - 1;
        for j = 1:k;
            matA(i,j) =  sum(x.^q);
            q = q + 1;
        end
    end
end

%BMat
matB = zeros(k,1);
r = 0;
for i = 1:k
    matB(i,1) = sum((x.^r).*y);
    r = r + 1;
end

%mat equiv
matC = inv(matA)*matB;

%output formatting
for j = 0:m
    fprintf('a%d = %0.4f\n',j,matC((j+1),1))
end

%generate the polynomial equation
p = [];
for j = 1:k
    p = [p matC(j,1)];
end
p = flip(p);