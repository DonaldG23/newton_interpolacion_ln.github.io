function [resultado, error_porcentual] = newton_interp_ln()
    % Valores conocidos
    x = [1, 4];
    y = log(x);

    % Valor que queremos estimar
    x_eval = 2;
    ln_real = log(x_eval);

    % Calcular diferencias divididas
    n = length(x);
    coef = y;
    for j = 2:n
        for i = n:-1:j
            coef(i) = (coef(i) - coef(i-1)) / (x(i) - x(i-j+1));
        end
    end

    % Evaluar el polinomio de Newton en x_eval
    resultado = coef(n);
    for i = n-1:-1:1
        resultado = resultado * (x_eval - x(i)) + coef(i);
    end

    % Calcular el error porcentual
    error_porcentual = abs((ln_real - resultado) / ln_real) * 100;

    % Mostrar resultados
    fprintf('Estimación de ln(2) = %.6f\n', resultado);
    fprintf('Valor real ln(2) = %.6f\n', ln_real);
    fprintf('Error porcentual = %.4f%%\n', error_porcentual);
end
