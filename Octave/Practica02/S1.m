function h = S1(x,a,R)
  %Sistema S1 y[n] = x[n] + a.x[n-1]
  h = x + a .* [zeros(1,R), x(1:length(x)-R)];
end
