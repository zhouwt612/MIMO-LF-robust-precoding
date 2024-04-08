function PMMSE = RMMSE_MIMOforK(H,pow,gamma)
[M,N,K] = size(H);
sigma2 = M/pow;
Hdedicated = [];
for idx1 = 1:1:K
    Hdedicated = [Hdedicated H(:,:,idx1)];
end
H = Hdedicated;
P = inv(M*(1-M*gamma/(M-N))*(H*H')+K*M*N*gamma/(M-N)*eye(M)+sigma2*eye(K*N))*H;
PMMSE = zeros(M,N,K);
for idx = 1:1:K
    precoder = P(:,(idx-1)*N+1:N*idx);
    precoder = Hbasis(precoder);
    PMMSE(:,:,idx) = sqrt(pow/K/trace(precoder*precoder'))*precoder;
end