function HW1_1_1_9ab(m1, m2, b1, b2)
    % Coefficient matrix A
    A = [-m1 1; -m2 1];
    
    % Right-hand side vector b
    b = [b1; b2];
    
    % Calculate the determinant of A
    detA = det(A);
    
    % Check for the uniqueness of the solution (m1 != m2)
    if detA ~= 0
        fprintf('The system has a unique solution since m1 != m2 (det(A) = %f).\n', detA);
    else
        % If m1 = m2, check for consistency (b1 = b2)
        if b1 == b2
            fprintf('The system is consistent (has infinitely many solutions) since m1 = m2 and b1 = b2.\n');
        else
            fprintf('The system is inconsistent (no solution) since m1 = m2 but b1 != b2.\n');
        end
    end
end
