function PMMSE = MMSE_MIMOforK(H,pow)
[M,N,K] = size(H);
sigma2 = M/pow;
Hdedicated = [];
for idx1 = 1:1:K
    Hdedicated = [Hdedicated H(:,:,idx1)];
end
H = Hdedicated;
P= inv(M*H*H'+sigma2*eye(K*N))*H;
PMMSE = zeros(M,N,K);
for idx = 1:1:K
    precoder = P(:,(idx-1)*N+1:N*idx);
    precoder = Hbasis(precoder);
    PMMSE(:,:,idx) = sqrt(pow/K/trace(precoder*precoder'))*precoder;
end