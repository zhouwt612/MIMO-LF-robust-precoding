function Dbar = QuanErrBound(M,N,B)
% Dbar: quantization error bound
% M: the number of transmit antenna
% N: the number of receive antenna
% B: the number of feedback bits

T = N*(M-N);
Cmn = 1;
for idx = 1:1:N
    Cmn = Cmn*(factorial(M-idx)/factorial(N-idx));
end
Cmn = 1/factorial(T)*Cmn;
Dbar = gamma(1/T)/T*(Cmn)^(-1/T)*2^(-B/T);