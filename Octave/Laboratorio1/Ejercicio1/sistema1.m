function y = sistema1(x)
  x_shift=[0 x(1:end-1)];
  y = 0.5*x + 0.5 * x_shift;
end


