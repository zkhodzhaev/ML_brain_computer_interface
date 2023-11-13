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
end

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
