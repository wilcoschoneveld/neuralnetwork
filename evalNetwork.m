%% Evaluate an artificial neural network
% author: Wilco Schoneveld

function result = evalNetwork(network, input)
    % First intermediate result is the input
    result = input;
    
    % Iterate over all the layers
    for i=1:length(network.layers)
        % Evaluate layer and store result
        result = network.activation(network.layers{i} * [result; -1]);
    end
    
    % Network evaluated
end