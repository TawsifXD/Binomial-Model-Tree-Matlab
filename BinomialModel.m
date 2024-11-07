 % Author: Mozahid Islam
 % Asian University of Bangladesh
function B = binomial_model(initial_value, steps, rate_of_change)
    % Define dimensions of the binomial tree matrix
    total_columns = steps + 1;
    total_rows = 2 * steps + 1;

    % Initialize the binomial tree matrix B with zeros
    B = zeros(total_rows, total_columns);

    % Find the middle row in the matrix to place the initial value
    middle_row = steps + 1;
    B(middle_row, 1) = initial_value;

    % Build the binomial tree and display each step without clearing console
    for i = 1:steps
        % For each time step `i`, calculate the upward and downward movements
        for j = 0:i
            % Up movement
            B(middle_row - j, i + 1) = B(middle_row - j + 1, i) * exp(rate_of_change);
            % Down movement
            B(middle_row + j, i + 1) = B(middle_row + j - 1, i) * exp(-rate_of_change);
        end

        % Display the current state of the binomial tree in the console
        disp(['Binomial Model Tree at Step ', num2str(i), ':']);
        disp(B);

        % Force the output to display immediately
        drawnow;

        % Pause for 0.05 seconds to simulate real-time updates
        pause(0.05);
    end

    % Display the final completed binomial tree matrix B in the console
    disp('Final Binomial Model Tree:');
    disp(B);
end

% Example usage
B = binomial_model(10, 10, 0.15);
