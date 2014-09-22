clear all; close all;

% Read features and targets from data files
features =        dlmread('data/features.txt')';
targets = ind2vec(dlmread('data/targets.txt')');

% Create and train a neural network from data
network = buildNetwork(features, targets, 20);

% Plot the sum squared error per epoch
semilogy(network.sumsqrerr);
title('Sum squared network error');

% Read a testset with solution from data files
testset =          dlmread('data/unknown.txt')';
solution = ind2vec(dlmread('data/solution.txt')');

% Evaluate the testset with the neural network
output = zeros(7, size(testset,2));

for i = 1:size(testset, 2)
    output(:,i) = evalNetwork(network, testset(:,i));
end

% Plot the confusion matrix
figure; plotconfusion(solution, output);