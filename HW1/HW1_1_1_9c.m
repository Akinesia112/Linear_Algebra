function HW1_1_1_9c(m1, m2, b1, b2)
    % Create a new figure window
    figure;
    
    % Define the range of x1 values for the plot
    x1 = linspace(-10, 10, 400);
    
    % Calculate x2 values based on the equations of the lines
    x2_line1 = m1*x1 + b1;
    x2_line2 = m2*x1 + b2;
    
    % Plot the lines
    plot(x1, x2_line1, 'r', 'LineWidth', 2); hold on;
    plot(x1, x2_line2, 'b', 'LineWidth', 2);
    xlabel('x1');
    ylabel('x2');
    title('Plot of the System of Equations');
    legend({'-m1*x1 + x2 = b1', '-m2*x1 + x2 = b2'}, 'Location', 'best');
    grid on;
    
    % Check if lines intersect (m1 != m2) or are identical (m1 = m2 & b1 = b2)
    if m1 ~= m2
        % Calculate intersection point
        A = [-m1 1; -m2 1];
        b = [b1; b2];
        solution = A\b;
        scatter(solution(1), solution(2), 'filled', 'MarkerEdgeColor','k', 'MarkerFaceColor', 'g');
        legend({'-m1*x1 + x2 = b1', '-m2*x1 + x2 = b2', 'Intersection Point'}, 'Location', 'best');
        % Save the plot as a PNG file
        saveas(gcf, 'm1 ~= m2_system_plot.png');
    elseif b1 == b2
        % Highlight that the lines overlap
        legend({'Identical Lines: -m1*x1 + x2 = b1 = b2'}, 'Location', 'best');
        % Save the plot as a PNG file
        saveas(gcf, 'b1 == b2_system_plot.png');
    end
end


