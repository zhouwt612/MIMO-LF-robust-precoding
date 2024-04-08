function C_mimo = RVQ_MIMO_QRforK(M,N,B,K)
% C: codebook for K users
% D: M dimension
% B: feedback bits
% K: the number of users

len = 2^B;
C_mimo = zeros(M,N,len,K);
for idx1 = 1:1:K
    for idx2 = 1:1:len
        C = randn(M,N)+1i*randn(M,N);
        [Q, R] = qr(C);
        C_mimo(:,:,idx2,idx1) = Q(1:N,:)';
    end
end