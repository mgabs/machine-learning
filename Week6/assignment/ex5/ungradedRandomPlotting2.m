%% Plotting learning curves with randomly selected examples
% In practice, especially for small training sets, when you plot learning curves
% to debug your algorithms, it is often helpful to average across multiple sets
% of randomly selected examples to determine the training error and cross
% validation error.

% For this optional (ungraded) exercise, you should implement the above
% strategy for computing the learning curves. For reference, figure 10 shows the
% learning curve we obtained for polynomial regression with λ = 0.01. Your
% figure may differ slightly due to the random selection of examples.

function ungradedRandomPlotting(X, y ,Xval, yval, lambda, loops)

  % We'll check the cross validation set against the training set, hence the training set is all what we need.

	% you need these values later
	m = size(X,1)     % the number of training examples
	r = size(Xval,1)  % the number of validation examples


  % vectors for storing training and cross-validation errors
  error_train = zeros(m,1);
  error_val = zeros(m,1);

	% Initialize Theta
	% initial_theta = zeros(m, 1);

	for i = 1:m
  	% Concretely, to determine the training error and cross validation error for i examples, you should first randomly select i examples from the training set and i examples from the cross validation set. You will then learn the parameters θ using the randomly chosen training set and evaluate the parameters θ on the randomly chosen training set and cross validation set.
  	% The above steps should then be repeated multiple times (say 50) and the averaged error should be used to determine the training error and cross validation error for i examples.

		% create two empty vectors for the Jtrain and Jcv values
		J_train = zeros(m,1);
		J_cv = zeros(r, 1);

		% j = number of training examples
		for j = 1:loops

			% use 'm' to select 'i' random examples from the training set
			% test set
	    % (:1a:) randomly select i rows
	    sel = randperm(m);
	    sel = sel(1:i);
			% create a matrix
			X_tsel = X(sel,:);
			y_tsel = y(sel, :);





			% compute theta
	    % (:2:) learn parameters theta using the randomly chose training set
	    theta = trainLinearReg(X_sel, y_sel, lambda);

			% compute Jtrain and Jcv and save the values
	    % (:3a:) evaluate the parameters theta on the randomly chosen training set
			[J, grad] = linearRegCostFunction(X_tsel, y_tsel, theta, 0);

			% accumulate errors for i-training examples
			error_train(i) =  J;

			% cross validation set
			% (:1b:) ... and i examples from the cross validation set

			% use 'r' to select 'i' random examples from the validation set
			sel = randperm(r);
			sel = sel(1:i);
			X_selcv = Xval(sel, :);
			y_selcv = yval(sel,:);

			% (:3b:) .. and cross validation error
			[J, grad_val] = linearRegCostFunction(X_selcv, y_selcv, theta, 0);

			error_val(i) =  J;
		end

		% compute the mean of the Jtrain vector and save it in error_train(i)
	  % compute the mean of the Jcv vector and save it in error_val(i)

	end

	% finding the average
	error_train = error_train ./ loops;
	error_val = error_val ./ loops;

	% last, do some plotting to visualize
	plot(1:m, error_train, 1:m, error_val);
	set(get(gca,'XLabel'),'String','Number of training examples');
	set(get(gca,'YLabel'),'String','Error');
	axis([0 13 0 100]);
	legend('Train', 'Cross Validation');
end
