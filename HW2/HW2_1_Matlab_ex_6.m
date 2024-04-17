% Main Script

% Clear the workspace and command window
clear; clc;

%% (a) Adjacency matrix for the graph
A = [
    0 1 0 1 0 0 0 0;
    1 0 1 0 1 0 0 0;
    0 1 0 0 0 1 0 0;
    1 0 0 0 0 0 1 0;
    0 1 0 0 0 0 0 1;
    0 0 1 0 0 0 1 0;
    0 0 0 1 0 1 0 1;
    0 0 0 0 1 0 1 0
];

% Display the adjacency matrix
disp('====================  [Matlab ex] ex. 6.  (a)  =====================');

disp('Adjacency matrix A:');
disp(A);

%% (b) Compute A^2 and determine the number of walks of length 2
A2 = A^2;
walks_2 = [
    A2(1,7); % Number of walks of length 2 from V1 to V7
    A2(4,8); % Number of walks of length 2 from V4 to V8
    A2(5,6); % Number of walks of length 2 from V5 to V6
    A2(8,3)  % Number of walks of length 2 from V8 to V3
];

% Display the results for part (b)
disp('====================  [Matlab ex] ex. 6.  (b)  =====================');

disp('Number of walks of length 2 for each pair of vertices:');
disp(walks_2);

%% (c) Compute A^4, A^6, and A^8
A4 = A^4;
A6 = A^6;
A8 = A^8;

% Determine the number of walks of length 4, 6, and 8
walks_4 = A4(1,7); % Number of walks of length 4 from V1 to V7
walks_6 = A6(1,7); % Number of walks of length 6 from V1 to V7
walks_8 = A8(1,7); % Number of walks of length 8 from V1 to V7

% Display the results for part (c)
disp('====================  [Matlab ex] ex. 6.  (c)  =====================');

disp('A^4:');
disp(A4);
disp('A^6:');
disp(A6);
disp('A^8:');
disp(A8);

%% (d) Compute A^3, A^5, and A^7
A3 = A^3;
A5 = A^5;
A7 = A^7;

% Display the results for part (d)
disp('====================  [Matlab ex] ex. 6.  (d)  =====================');

disp('A^3:');
disp(A3);
disp('A^5:');
disp(A5);
disp('A^7:');
disp(A7);

% Determine the number of walks of length 3, 5, and 7
walks_3 = A3(1,7); % Number of walks of length 3 from V1 to V7
walks_5 = A5(1,7); % Number of walks of length 5 from V1 to V7
walks_7 = A7(1,7); % Number of walks of length 7 from V1 to V7


% Display the results
disp('Number of walks of length 2:');
disp(walks_2);

disp('Number of walks of length 4:');
disp(walks_4);

disp('Number of walks of length 6:');
disp(walks_6);

disp('Number of walks of length 8:');
disp(walks_8);

disp('Number of walks of length 3:');
disp(walks_3);

disp('Number of walks of length 5:');
disp(walks_5);

disp('Number of walks of length 7:');
disp(walks_7);

% Conjecture
% Assuming the starting point for the conjecture is vertex V1 and the ending point is V7
conjecture_even = mod(walks_2 + walks_4 + walks_6 + walks_8, 2) == 0;
conjecture_odd = mod(walks_3 + walks_5 + walks_7, 2) == 1;

disp('Conjecture for walks of even length from V1 to V7:');
disp(conjecture_even);

disp('Conjecture for walks of odd length from V1 to V7:');
disp(conjecture_odd);
