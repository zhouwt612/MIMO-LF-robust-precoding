function PZF = ZF_MIMOforK(H,pow)
% ZF for MU-MIMO with perfect CSI (normal format)
[M,N,K] = size(H);
Hdedicated = [];
for idx1 = 1:1:K
    Hdedicated = [Hdedicated H(:,:,idx1)];
end
H = Hdedicated;
P = inv(M*H*H')*H;
PZF = zeros(M,N,K);
for idx2 = 1:1:K
    precoder = P(:,(idx2-1)*N+1:N*idx2);
    precoder = Hbasis(precoder);
    PZF(:,:,idx2) = sqrt(pow/K/trace(precoder'*precoder))*precoder;
end