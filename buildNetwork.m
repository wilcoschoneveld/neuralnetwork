%% Create and train an artificial neural network from given data
% author: Wilco Schoneveld

function network = buildNetwork(inputs, targets, iterations)    
    % Determine the amount of hidden neurons
    nhidden = round((size(inputs, 1) + size(targets, 1)) * 2 / 3);
    
    % Create a neural network with given in
    network = createNetwork(size(inputs, 1), nhidden, size(targets, 1));
    
    % Iteration variables
    n = 1; network.sumsqrerr = [];

    % Train network until max iterations
    while n <= iterations
        network.sumsqrerr(n) = 0;
        
        % Training epoch
        for i=1:size(inputs, 2)
            % Train network with inputs and target value
            network = trainNetwork(network, inputs(:,i), targets(:,i));
            
            % Update sum squared error
            network.sumsqrerr(n) = network.sumsqrerr(n) + sumsqr(network.error);
        end

        % Display training information
        disp(['Iteration: ', num2str(n), ' / ', ...
              'Error: ', num2str(network.sumsqrerr(n) / size(inputs, 2))]);
          
        % Update iteration number
        n = n + 1;
    end
end