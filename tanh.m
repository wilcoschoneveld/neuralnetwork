function result = tanh(value)
    result = exp(value) - exp(-value) ./ (exp(value) + exp(-value));
end
