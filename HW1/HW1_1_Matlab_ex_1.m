% Generate random 5x5 matrices A and B
A = round(10 * rand(5));
B = round(10 * rand(5));

% Part (a)
A1 = A * B;
A2 = B * A;
A3 = (A' * B')';
A4 = (B' * A')';

% Check for equality by computing the difference
difference_a1_a2 = A1 - A2;
difference_a1_a3 = A1 - A3;
difference_a1_a4 = A1 - A4;

% Display the differences for part (a)
disp('Differences for part (a):');
disp('A1 - A2: ');
disp(difference_a1_a2);
disp('A1 - A3: ');
disp(difference_a1_a3);
disp('A1 - A4: ');
disp(difference_a1_a4);

% Part (b)
A1 = A .* B;
A2 = A' .* B';
A3 = (B .* A')';
A4 = (B' .* A);

% Check for equality by computing the difference
difference_b1_b2 = A1 - A2;
difference_b1_b3 = A1 - A3;
difference_b1_b4 = A1 - A4;

% Display the differences for part (b)
disp('Differences for part (b):');
disp('A1 - A2: ');
disp(difference_b1_b2);
disp('A1 - A3: ');
disp(difference_b1_b3);
disp('A1 - A4: ');
disp(difference_b1_b4);
