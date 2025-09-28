function h = triN(n,N)
    % Tri�ngulo discreto de N puntos de amplitud en el centro.
    if (N>0)
        h = (N - abs(n)).*(n > -N & n < N);
    else
        h = 0;
    end
end