% Data for Training and Test experiments
training_data = [0.9260, 0.8607, 0.8885, 0.8361; 0.8038, 0.8914, 0.9097, 0.8785];
test_data = [0.7583, 0.4095, 0.5497, 0.4992; 0.4114, 0.2907, 0.6560, 0.5302];

% Categories for the grouped bar chart
categories = {'Torque', 'Cartesian', 'Velocity', 'Acceleration'};

% Combine training and test data for shoulder and elbow
combined_data = [training_data; test_data];

% Create figure
figure;

% Grouped Bar Chart
hb = bar(combined_data, 'grouped');

% Set the colors (optional, can be omitted for default colors)
colors = [0 0 1; 0 1 0; 1 0 0; 1 1 0]; % Blue, Green, Red, Yellow
for k = 1:length(hb)
    hb(k).FaceColor = colors(k,:);
end

% Add legend and labels
legend(categories, 'Location', 'NorthEastOutside');
set(gca, 'XTickLabel', {'Train Shoulder', 'Test Shoulder', 'Train Elbow', 'Test Elbow'});
ylabel('Fraction of Variance Accounted For (FVAF)');

% Title
title('Combined Training and Test Variance for Different Experiments');

% Adjust layout to prevent label clipping
set(gcf, 'Position', [100, 100, 740, 560]); % Modify the size as needed
