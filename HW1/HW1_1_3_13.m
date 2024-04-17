% Define the RREF matrix
RREF = [1 2 0 3 1 -2; 
        0 0 1 2 4 5; 
        0 0 0 0 0 0; 
        0 0 0 0 0 0];

% Identify the number of free variables
% These are the columns without leading 1s
num_free_vars = sum(all(RREF(:, 1:end-1) == 0, 1));

% Initialize free variables s, t, and u
syms s t u real;

% Express x1, x2, x3, x4, x5 in terms of free variables s, t, u
x2 = s;
x4 = t;
x5 = u;
x1 = -2 - 2*x2 - 3*x4 - x5;
x3 = 5 - 2*x4 - 4*x5;

% General solution vector
general_solution = [x1; x2; x3; x4; x5];

% Display the general solution
disp('General solution of the system:');
disp(general_solution);

% Determine b based on a1 and a3
% Since a1 corresponds to x1 and a3 corresponds to x3
% and using the values from the RREF matrix
b = zeros(5, 1);
b(1) = RREF(1, end); % The entry from the first row, last column of RREF
b(3) = RREF(2, end); % The entry from the second row, last column of RREF

% Display b
disp('Vector b based on columns a1 and a3:');
disp(b);
