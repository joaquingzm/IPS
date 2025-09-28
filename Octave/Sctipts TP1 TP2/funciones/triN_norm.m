function h = triN_norm(n,N)
    % Triángulo discreto de N puntos de amplitud en el centro normalizado.
    if (N>0)
        h = (1/N).*(N - abs(n)).*(n > -N & n < N);
    else
        h = 0;
    end
end