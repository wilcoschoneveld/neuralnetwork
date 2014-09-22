%% Train an artificial neural network with back-propagation
% author: Wilco Schoneveld

function network = trainNetwork(network, input, desired_result)
    % Count the number of layers for iterating purposes
    num_layers = length(network.layers);
    
    % Create storage for the intermediate evaluation results
    results = cell(1, num_layers + 1);
    results{1} = input;
    resultsderiv = results;
    
    % Propogate the input through the network and store results
    for i = 1:num_layers
        weighted_sum = network.layers{i} * [results{i}; -1];
        results{i+1} = network.activation(weighted_sum);
        resultsderiv{i+1} = network.activderiv(weighted_sum);
    end
    
    % Calculate the error between desired and actual output
    network.error = desired_result - results{num_layers + 1};
    
    % Use back-propagation to train network
    for i = num_layers:-1:1
        if i == num_layers
            % Output layer gradient based on output error
            gradient = resultsderiv{i+1} .* network.error;
        else
            % Hidden layer gradient is based on previous gradient
            sub = network.layers{i+1}' * gradient;
            gradient = resultsderiv{i+1} .* sub(1:end-1,:);
        end
        
        % Update the weight and threshold values in the layer
        network.update{i} = network.beta * network.update{i} + ...
                            network.alpha .* gradient * [results{i}', -1];
        network.layers{i} = network.layers{i} + network.update{i};
    end
    
    % Network trained
end