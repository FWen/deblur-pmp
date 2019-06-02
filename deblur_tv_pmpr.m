function S = deblur_tv_pmpr(Im, kernel, lambda, mu, opts)

%Deblurring based on L0-Total variation and PMP thresholding
S = Im;
alphamax = 1e5;
[M,N,D] = size(Im);
otfFh = psf2otf([1, -1], [M,N]);
otfFv = psf2otf([1; -1],[M,N]);
otfKER = psf2otf(kernel,[M,N]);

denKER  = abs(otfKER).^2;
denGrad = abs(otfFh).^2 + abs(otfFv ).^2;
Fk_FI = conj(otfKER).*fft2(Im);
alpha = 2.0*mu;

K=3;
kappa=2;

while alpha<alphamax

    for k=1:K
        [Z, Md] = find_min_pixels(S, opts.r);
        z = Z(Md>0);
        
        if opts.s<opts.scales/2
            lambdat = min(max(lambda,mean(abs(z))),0.1); 
            Z(abs(Z)<lambdat) = 0;
        else
            Z = sign(Z).*max(Z-lambda,0);
        end

        S = S.*(1-Md) + Z.*Md;

       % g  (Gradient) sub-problem 
        Gh = [diff(S,1,2), S(:,1,:) - S(:,end,:)]; % gh
        Gv = [diff(S,1,1); S(1,:,:) - S(end,:,:)]; % gv
        t = (Gh.^2 + Gv.^2) < mu/alpha;
        Gh(t)=0;    Gv(t)=0;
        
       % I subproblem
        gh = [Gh(:,end,:) - Gh(:, 1,:), -diff(Gh,1,2)];
        gv = [Gv(end,:,:) - Gv(1, :,:); -diff(Gv,1,1)];
        Fs = (Fk_FI + alpha*fft2(gh+gv))./(denKER + alpha*denGrad);
        S = real(ifft2(Fs));
    end
    alpha = alpha*kappa;
end
%    figure(12); imshow(S,[]);title('S');
end
