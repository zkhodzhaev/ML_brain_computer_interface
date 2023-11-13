% Training data
train_shoulder = [0.9781 0.9260 0.9075 0.8910 0.8910 0.8350 0.8340 0.8068 0.8083]; 
train_elbow = [0.9400 0.8038 0.7566 0.7090 0.7090 0.6215 0.6161 0.5740 0.5737];

% Test data 
test_shoulder = [0.2607 0.7583 0.7872 0.7869 0.7869 0.7981 0.7981 0.8079 0.8139];
test_elbow = [-0.6840 0.4114 0.4767 0.5087 0.5087 0.4962 0.4968 0.4971 0.5074];

% Plot training and test curves
figure;
plot(1:length(train_shoulder), train_shoulder, 'b-', 'LineWidth', 2); 
hold on;
plot(1:length(train_elbow), train_elbow, 'b--', 'LineWidth', 2);

plot(1:length(test_shoulder), test_shoulder, 'r-', 'LineWidth', 2);
plot(1:length(test_elbow), test_elbow, 'r--', 'LineWidth', 2);

legend('Train Shoulder', 'Train Elbow', 'Test Shoulder', 'Test Elbow');
title('Training and Test Curves');
xlabel('Number of Folds');
ylabel('Fraction of Variance');
grid on;