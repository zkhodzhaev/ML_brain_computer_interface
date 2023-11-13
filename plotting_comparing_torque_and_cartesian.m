% Data for Torque and Cartesian experiments
torque_training = [0.9260, 0.8038];
torque_test = [0.7583, 0.4114];
cartesian_training = [0.8607, 0.8914];
cartesian_test = [0.4095, 0.2907];

% Create figure and axes for the plots
figure;

% Torque Training Plot
subplot(2, 2, 1); % This specifies a subplot in a 2x2 grid, position 1
bar(torque_training, 'b');
title('Torque Training Fraction of Variance');
ylim([0 1]);
ylabel('Variance Accounted For');
set(gca, 'XTickLabel', {'Shoulder', 'Elbow'});

% Torque Test Plot
subplot(2, 2, 2); % Position 2
bar(torque_test, 'r');
title('Torque Test Fraction of Variance');
ylim([0 1]);
set(gca, 'XTickLabel', {'Shoulder', 'Elbow'});

% Cartesian Training Plot
subplot(2, 2, 3); % Position 3
bar(cartesian_training, 'g');
title('Cartesian Training Fraction of Variance');
ylim([0 1]);
ylabel('Variance Accounted For');
set(gca, 'XTickLabel', {'X', 'Y'});

% Cartesian Test Plot
subplot(2, 2, 4); % Position 4
bar(cartesian_test, 'm');
title('Cartesian Test Fraction of Variance');
ylim([0 1]);
set(gca, 'XTickLabel', {'X', 'Y'});

% Adjust layout
sgtitle('Comparison of Training and Test Variance for Torque and Cartesian Data');
