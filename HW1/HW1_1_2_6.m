% System (a)
A_a = [2 1; 7 6];
b_a = [1; 1];
x_a = gauss_jordan_elimination(A_a, b_a);

% System (b)
A_b = [1 1 -1 1; 2 -1 1 -1; 3 1 -2 1];
b_b = [6; -3; 9];
x_b = gauss_jordan_elimination(A_b, b_b);

% System (c)
A_c = [1 -10 5; 1 1 1];
b_c = [-4; 1];
x_c = gauss_jordan_elimination(A_c, b_c);

% System (d)
A_d = [1 -2 3 1; 2 1 -1 1; 1 3 1 1];
b_d = [4; 1; 3];
x_d = gauss_jordan_elimination(A_d, b_d);

% Display the results
disp('Solution for system (a):');
disp(x_a);

disp('Solution for system (b):');
disp(x_b);

disp('Solution for system (c):');
disp(x_c);

disp('Solution for system (d):');
disp(x_d);

% Gauss-Jordan elimination
function x = gauss_jordan_elimination(A, b)
    % Form the augmented matrix
    aug = [A b];
    
    % Number of equations
    n = size(aug, 1);
    
    % Forward elimination to get upper triangular matrix
    for i = 1:n
        % Make the diagonal element 1
        aug(i,:) = aug(i,:) / aug(i,i);
        
        % Make the off-diagonal elements in column i zero
        for j = 1:n
            if i ~= j
                aug(j,:) = aug(j,:) - aug(i,:) * aug(j,i);
            end
        end
    end
    
    % Extract the solution
    x = aug(:, end);
end
