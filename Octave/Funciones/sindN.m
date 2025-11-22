function h = sindN(t)
  h = sin((2*N+1)*pi*t)./sin(pi*t);
  h(mod(t,1) == 0) = 2*N+1;
end
