function h = triN(n,N)
    % Triángulo discreto de N puntos de amplitud en el centro.
    if (N>0)
        h = (N - abs(n)).*(n > -N & n < N);
    else
        h = 0;
    end
end