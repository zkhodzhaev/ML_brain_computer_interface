% Initialize parameters
num_delays = 1:20;
train_shoulder_fvaf = zeros(1, length(num_delays));
test_shoulder_fvaf = zeros(1, length(num_delays));
train_elbow_fvaf = zeros(1, length(num_delays));
test_elbow_fvaf = zeros(1, length(num_delays));

% Set prediction mode, PCA, training, and test folds
set_type('torque');
set_pca(0);
set_train([1,2]);
set_test(10);

max_test_shoulder_fvaf = -inf;
max_test_shoulder_delay = 0;
max_test_elbow_fvaf = -inf;
max_test_elbow_delay = 0;

% Loop over delays
for i = num_delays
    % Set the delay
    set_delays(1:i);
    
    % Perform training
    [Etr, Ete] = train();
    
    % Store the FVAF values
    train_shoulder_fvaf(i) = Etr(1); % Assuming the first value is for the shoulder
    train_elbow_fvaf(i) = Etr(2); % Assuming the second value is for the elbow
    test_shoulder_fvaf(i) = Ete(1); % Ditto for test FVAF
    test_elbow_fvaf(i) = Ete(2);
        % Update maxima if the current FVAF is greater than the previous maxima
    if test_shoulder_fvaf(i) > max_test_shoulder_fvaf
        max_test_shoulder_fvaf = test_shoulder_fvaf(i);
        max_test_shoulder_delay = i;
    end

    if test_elbow_fvaf(i) > max_test_elbow_fvaf

        max_test_elbow_fvaf = test_elbow_fvaf(i);
        max_test_elbow_delay = i;
    end
end


% Plot the results as a function of delay
figure;
plot(num_delays, train_shoulder_fvaf, 'b-', 'LineWidth', 2); hold on;
plot(num_delays, test_shoulder_fvaf, 'b--', 'LineWidth', 2);
plot(num_delays, train_elbow_fvaf, 'r-', 'LineWidth', 2);
plot(num_delays, test_elbow_fvaf, 'r--', 'LineWidth', 2);

% Annotate the maxima points on the plot
plot(max_test_shoulder_delay, max_test_shoulder_fvaf, 'bp', 'MarkerSize', 10, 'MarkerFaceColor', 'b');
plot(max_test_elbow_delay, max_test_elbow_fvaf, 'rp', 'MarkerSize', 10, 'MarkerFaceColor', 'r');

% Add annotations with text to the plot
text(max_test_shoulder_delay, max_test_shoulder_fvaf, ...
    [' Max Shoulder Test: ', num2str(max_test_shoulder_fvaf), ...
    ' at delay ', num2str(max_test_shoulder_delay)], ...
    'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
text(max_test_elbow_delay, max_test_elbow_fvaf, ...
    [' Max Elbow Test: ', num2str(max_test_elbow_fvaf), ...
    ' at delay ', num2str(max_test_elbow_delay)], ...
    'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');

hold off;

% Plot the results as a function of delay
figure;
plot(num_delays, train_shoulder_fvaf, 'b-', 'LineWidth', 2); hold on;
plot(num_delays, test_shoulder_fvaf, 'b--', 'LineWidth', 2);
plot(num_delays, train_elbow_fvaf, 'r-', 'LineWidth', 2);
plot(num_delays, test_elbow_fvaf, 'r--', 'LineWidth', 2);
hold off;

% Add plot labels, legend, and title
xlabel('Delay');
ylabel('FVAF');
title('FVAF as a Function of Delay');
legend('Train Shoulder', 'Test Shoulder', 'Train Elbow', 'Test Elbow');
grid on;

% Adjust the plot settings according to Figure 1 template as needed
