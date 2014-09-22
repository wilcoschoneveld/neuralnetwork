%% Create a random artificial neural network of given size
% author: Wilco Schoneveld

function network = createNetwork(varargin)
    % Create empty layers
    network.layers = cell(1, length(varargin)-1);
    network.update = network.layers;
    
    % Neuron activation functions
    network.activation = @(x)(1 ./ (exp(-x) + 1));
    network.activderiv = @(x)(exp(x) ./ (exp(x) + 1).^2);
    
    % Training settings
    network.alpha = 0.1; % learning rate
    network.beta = 0.95; % momentum constant
    network.delta = 0;
    
    % Assign random weights and thresholds (page 179)
    for i=1:length(varargin)-1
        weights = 2 * rand(varargin{i+1}, varargin{i}+1) - 1;
        network.layers{i} = weights * (2.4 / varargin{1});
        network.update{i} = 0;
    end
    
    % Network created
end