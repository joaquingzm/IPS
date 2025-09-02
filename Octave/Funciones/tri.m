function h = tri(t)
  % TRI señal triángulo de base = 1, altura =1 y centrada en 0
  h = (t+1).*(t>=-1 & t<0) + (-t+1).*(t>=0 & t<=1);
end

