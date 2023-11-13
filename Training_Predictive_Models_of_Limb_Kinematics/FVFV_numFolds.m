%FVAF as a function of the number of folds

% Preallocate arrays to store FVAF values
num_folds = 1:9;
train_off_shoulder = zeros(1, length(num_folds));
test_off_shoulder = zeros(1, length(num_folds));
train_on_shoulder = zeros(1, length(num_folds));
test_on_shoulder = zeros(1, length(num_folds));

train_off_elbow = zeros(1, length(num_folds));
test_off_elbow = zeros(1, length(num_folds));
train_on_elbow = zeros(1, length(num_folds));
test_on_elbow = zeros(1, length(num_folds));

% Loop over the number of folds
for i = 1:length(num_folds)
    folds = 1:i; % Folds to use for training
    
    % Proprioception OFF
    set_proprioceptive(0);
    set_train(folds);
    [Etr_off, Ete_off] = train();
    train_off_shoulder(i) = Etr_off(1);
    test_off_shoulder(i) = Ete_off(1);
    train_off_elbow(i) = Etr_off(2);
    test_off_elbow(i) = Ete_off(2);
    
    % Proprioception ON
    set_proprioceptive(1);
    set_train(folds);
    [Etr_on, Ete_on] = train();
    train_on_shoulder(i) = Etr_on(1);
    test_on_shoulder(i) = Ete_on(1);
    train_on_elbow(i) = Etr_on(2);
    test_on_elbow(i) = Ete_on(2);
end

% Plot for Shoulder
% ... [rest of your script] ...

% Plot for Shoulder
figure;
plot(num_folds, train_off_shoulder, 'b-', 'LineWidth', 2); hold on;
plot(num_folds, test_off_shoulder, 'b--', 'LineWidth', 2);
plot(num_folds, train_on_shoulder, 'r-', 'LineWidth', 2);
plot(num_folds, test_on_shoulder, 'r--', 'LineWidth', 2);
xlabel('Number of Folds');
ylabel('FVAF');
title('Shoulder FVAF with/without Proprioception as Function of Number of Folds');
legend('Train w/o Proprioception', 'Test w/o Proprioception', 'Train w/ Proprioception', 'Test w/ Proprioception');
grid on;
hold off;

% Plot for Elbow
figure;
plot(num_folds, train_off_elbow, 'b-', 'LineWidth', 2); hold on;
plot(num_folds, test_off_elbow, 'b--', 'LineWidth', 2);
plot(num_folds, train_on_elbow, 'r-', 'LineWidth', 2);
plot(num_folds, test_on_elbow, 'r--', 'LineWidth', 2);
xlabel('Number of Folds');
ylabel('FVAF');
title('Elbow FVAF with/without Proprioception as Function of Number of Folds');
legend('Train w/o Proprioception', 'Test w/o Proprioception', 'Train w/ Proprioception', 'Test w/ Proprioception');
grid on;
hold off;

% ... [rest of your script] ...

