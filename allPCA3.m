% Preallocate arrays to store FVAF for training and testing, for shoulder and elbow
num_components = [1:50, 100:50:960];
train_shoulder_fvaf = zeros(1, length(num_components));
test_shoulder_fvaf = zeros(1, length(num_components));
train_elbow_fvaf = zeros(1, length(num_components));
test_elbow_fvaf = zeros(1, length(num_components));

% Loop over the number of components
for i = 1:length(num_components)
    % Set the number of PCA components
    set_pca(num_components(i));
    
    % Perform training
    [Etr, Ete] = train();
    
    % Store the FVAF values
    train_shoulder_fvaf(i) = Etr(1); % Assuming the first value is for the shoulder
    train_elbow_fvaf(i) = Etr(2); % Assuming the second value is for the elbow
    test_shoulder_fvaf(i) = Ete(1); % Ditto for test FVAF
    test_elbow_fvaf(i) = Ete(2);
end

% Plot the results
figure;
plot(num_components, train_shoulder_fvaf, 'b-', 'LineWidth', 2); hold on;
plot(num_components, test_shoulder_fvaf, 'b--', 'LineWidth', 2);
plot(num_components, train_elbow_fvaf, 'r-', 'LineWidth', 2);
plot(num_components, test_elbow_fvaf, 'r--', 'LineWidth', 2);

% xlim([1 50]);

xlabel('Number of PCA Components');
ylabel('FVAF');
title('FVAF as a Function of Number of PCA Components');
legend('Train Shoulder', 'Test Shoulder', 'Train Elbow', 'Test Elbow');
grid on;
hold off;
