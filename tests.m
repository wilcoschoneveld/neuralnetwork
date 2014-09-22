%% Unit tests for the artificial network functions
% author: Wilco Schoneveld

clear all; % NEW TEST

% Starting weights and thresholds (page 183)
network = createNetwork(2, 2, 1);
network.layers{1} = [  4.7621, 4.7618, 7.3061; ...
                       6.3917, 6.3917, 2.8441];
network.layers{2} = [-10.3788, 9.7691, 4.5589];

% Check if the network evaluates as expected
sumsqrerror = sumsqr([evalNetwork(network, [1;1]) - 0, ...
                      evalNetwork(network, [0;1]) - 1, ...
                      evalNetwork(network, [1;0]) - 1, ...
                      evalNetwork(network, [0;0]) - 0]);
                  
assert(sumsqrerror < 0.001, 'Test 1 failed!');


clear all; % NEW TEST

% Starting weights and thresholds (page 181)
network = createNetwork(2, 2, 1);
network.layers{1} = [ 0.5, 0.4,  0.8; ...
                      0.9, 1.0, -0.1];
network.layers{2} = [-1.2, 1.1,  0.3];
network.alpha = 0.1;

% Train with inputs: 1,1 and desired output: 0
network = trainNetwork(network, [1; 1], 0);

% Check if the training updated the network properly
expected{1} = [ 0.5038, 0.4038,  0.7962; ...
                0.8985, 0.9985, -0.0985];
expected{2} = [-1.2067, 1.0888,  0.3127];

assert(sumsqr(network.layers{1} - expected{1}) < 0.0001, 'Test 2 failed!');
assert(sumsqr(network.layers{2} - expected{2}) < 0.0001, 'Test 2 failed!');

disp('Tests succeeded!');