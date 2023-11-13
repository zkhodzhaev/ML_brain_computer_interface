% Preallocate arrays 
num_components = [1:50, 100:50:960];
train_shoulder_fvaf = zeros(1, length(num_components));  
test_shoulder_fvaf = zeros(1, length(num_components));
train_elbow_fvaf = zeros(1, length(num_components));   
test_elbow_fvaf = zeros(1, length(num_components));

% Loop over components
for i = 1:length(num_components)
  set_pca(num_components(i));
  [Etr, Ete] = train();
  
  train_shoulder_fvaf(i) = Etr(1);
  train_elbow_fvaf(i) = Etr(2); 
  test_shoulder_fvaf(i) = Ete(1);
  test_elbow_fvaf(i) = Ete(2); 
end

% Find maxima 
[max_perf_shoulder, idx_shoulder] = max(test_shoulder_fvaf);
[max_perf_elbow, idx_elbow] = max(test_elbow_fvaf);

% Print results
fprintf('Max test shoulder perf: %.2f at %d components\n', max_perf_shoulder, num_components(idx_shoulder)); 
fprintf('Max test elbow perf: %.2f at %d components\n', max_perf_elbow, num_components(idx_elbow));