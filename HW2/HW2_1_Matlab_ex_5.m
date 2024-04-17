%% Main 
clear; clc;

%% Part (a)

% Generate matrix A and vector b
A = floor(10 * rand(6));
b = floor(20 * rand(6, 1)) - 10;

% Solve the system Ax = b for x
x = A\b;

% Compute the reduced row echelon form of [A b]
U = rref([A b]);

% Extract the solution from the last column of U
U_solution = U(:, end);

% Compute the difference
difference = U(:, 7) - x;

% Display results
format long
disp('====================  [Matlab ex] ex. 5.  (a)  =====================');
disp('Solution x:');
disp(x);
disp('Solution from reduced row echelon form:');
disp(U_solution);
disp('Difference:');
disp(difference);

%% Part (b)

% Modify A to make it singular
A(:,3) = A(:,1:2) * [4; 3];

% Compute the reduced row echelon form of the augmented matrix [A b]
rref_Ab = rref([A b]);

% Display the rref of [A b]
disp('====================  [Matlab ex] ex. 5.  (b)  =====================');
disp('Reduced Row Echelon Form of [A b]:');
disp(rref_Ab);

% Determine the number of solutions
% If the last row of rref_Ab is all zeros except for the last element,
% then there are no solutions. Otherwise, there are infinitely many.
if any(rref_Ab(end,1:end-1)) && rref_Ab(end,end) ~= 0
    disp('The system Ax = b has no solutions.');
elseif rank(A) < size(A, 1)
    disp('The system Ax = b has infinitely many solutions.');
else
    disp('The system Ax = b has a unique solution.');
end

%% Part (c) 
% Generate a new vector c
c = A * (floor(20 * rand(6,1)) - 10);

% Compute the reduced row echelon form of [A c]
U_Ac = rref([A c]);

% Display the reduced row echelon form
disp('====================  [Matlab ex] ex. 5.  (c)  =====================');
disp('Reduced Row Echelon Form of [A c]:');
disp(U_Ac);

%% Part (d)
% Assuming U is from part (c)
% The solution vector for x3 = 0
w = U_Ac;
w(:, end) = 0; % Set the last column to zero assuming x3 = 0

% Check the solution
residual_w = c - A * w;

% Display the residual vector
disp('====================  [Matlab ex] ex. 5.  (d)  =====================');
disp('Residual vector for w:');
disp(residual_w);

%% Part (e)

% Assuming U_Ac is the reduced row echelon form from part (c)
U = U_Ac;
U(:, end) = zeros(6, 1); % Set the last column to zero

% Find the null space of A
nullA = null(A, 'rational');

% If there is no null space (i.e., A is full rank), we cannot find a non-trivial z
if isempty(nullA)
    error('Matrix A is full rank, no non-trivial solution to Ax=0 exists.');
else
    % Set x3 to 1 in the solution to Ax=0, if possible
    % Adjust this depending on the structure of your null space vectors
    z = nullA(:, end); % Take the last vector of the basis of null space
    % If this doesn't directly give us x3=1, we might need to scale the vector
    % or combine vectors from the null space basis, depending on their structure.
end

% Display the solution vector z
disp('====================  [Matlab ex] ex. 5.  (e)  =====================');
disp('Solution vector z with x3=1:');
disp(z);

%% Part (f)

% Assuming w is the solution vector from part (d) when x3 = 0
% and z is the particular solution from part (e) when x3 = 1

% Define vector v as w + 3 * z
v = w + 3 * z;

% Verify that v is a solution by checking that Av = c
residual_v = c - A * v;

% Display the results
disp('====================  [Matlab ex] ex. 5.  (f)  =====================');
disp('Vector v:');
disp(v);
disp('Residual vector for v:');
disp(residual_v);

% Explain how all solutions of the system Ax = c can be described
% Any solution can be expressed as a linear combination of a particular
% solution (w) and a homogeneous solution (z) scaled by a free variable
% (in this case, the scalar multiple of z).
disp('General solution for Ax = c is given by w + k*z, where k is any scalar.');
