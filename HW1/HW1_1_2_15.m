% Define the coefficients matrix A and the constants vector B
A = [1 0 0 -1; 
     1 -1 0 0; 
     0 1 -1 0; 
     0 0 1 0];

B = [70; -430; 140; 890];

% Form the augmented matrix by appending B to A
augmented_matrix = [A, B];

% Perform manual RREF
disp('Manual RREF computation:');
[R_manual, jb_manual] = rref_manual(augmented_matrix);

% Display the manually computed RREF matrix
disp('Manually computed RREF matrix:');
disp(R_manual);

% Extract and display the solution vector
solution_manual = R_manual(:, end);
disp('The solution for the traffic flows is (manual):');
disp(['x1 = ', num2str(solution_manual(1))]);
disp(['x2 = ', num2str(solution_manual(2))]);
disp(['x3 = ', num2str(solution_manual(3))]);
disp(['x4 = ', num2str(solution_manual(4))]);

% Built-in MATLAB RREF for comparison
R_builtin = rref(augmented_matrix);
disp('MATLAB built-in RREF computation:');
disp(R_builtin);

% Extract and display the solution vector from the built-in RREF
solution_builtin = R_builtin(:, end);
disp('The solution for the traffic flows is (built-in):');
disp(['x1 = ', num2str(solution_builtin(1))]);
disp(['x2 = ', num2str(solution_builtin(2))]);
disp(['x3 = ', num2str(solution_builtin(3))]);
disp(['x4 = ', num2str(solution_builtin(4))]);

% Local function for manual RREF computation
function [R, jb] = rref_manual(A)
    [m, n] = size(A);
    R = A;
    jb = [];
    for i = 1:m
        % Find the pivot element
        [~, k] = max(abs(R(i:m,i)));
        k = k+i-1;
        if R(k,i) == 0
            error('Matrix is singular to working precision.');
        end
        % Swap the pivot row
        R([i k],:) = R([k i],:);
        jb = [jb, i];
        % Scale the pivot row
        R(i,:) = R(i,:) / R(i,i);
        % Eliminate the other rows
        for j = [1:i-1, i+1:m]
            R(j,:) = R(j,:) - R(i,:) * R(j,i);
        end
        % Display each step
        fprintf('Step %d:\n', i);
        disp(R);
    end
end
