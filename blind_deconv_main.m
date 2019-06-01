function [k, lambda, lambda_grad, S] = blind_deconv_main(blur_B, k, ...
                                    lambda, lambda_grad, threshold, opts)
% Do single-scale blind deconvolution using the input initializations
%% Input:
% @blur_B: input blurred image 
% @k: blur kernel
% @lambda: the weight for the L0 regularization on intensity
% @lambda_grad: the weight for the L0 regularization on gradient
%
% Ouput:
% @k: estimated blur kernel 
% @S: intermediate latent image
%
% The Code is created based on the method described in the following paper 
%   [1] Jinshan Pan, Deqing Sun, Hanspteter Pfister, and Ming-Hsuan Yang,
%        Blind Image Deblurring Using Dark Channel Prior, CVPR, 2016. 
%   [2] Jinshan Pan, Zhe Hu, Zhixun Su, and Ming-Hsuan Yang,
%        Deblurring Text Images via L0-Regularized Intensity and Gradient
%        Prior, CVPR, 2014. 
%
%   Author: Jinshan Pan (sdluran@gmail.com)
%   Date  : 03/22/2016

% derivative filters
dx = [-1 1; 0 0];
dy = [-1 0; 1 0];
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 2013-08-11
H = size(blur_B,1);    W = size(blur_B,2);
blur_B_w = wrap_boundary_liu(blur_B, opt_fft_size([H W]+size(k)-1));
blur_B_tmp = blur_B_w(1:H,1:W,:);
Bx = conv2(blur_B_tmp, dx, 'valid');
By = conv2(blur_B_tmp, dy, 'valid');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
for iter = 1:opts.xk_iter   
   if lambda~=0
       S = deblur_tv_pmpr(blur_B_w, k, lambda, lambda_grad, opts);      
       S = S(1:H,1:W,:);
   else % L0 deblurring
       S = L0Restoration(blur_B, k, lambda_grad, 2.0);
   end

  [latent_x, latent_y, threshold]= threshold_pxpy_v1(S,max(size(k)),threshold); 

  k_prev = k;
  %
  k = estimate_psf(Bx, By, latent_x, latent_y, 2, size(k_prev));
  %%

  CC = bwconncomp(k,8);
  for ii=1:CC.NumObjects
      currsum=sum(k(CC.PixelIdxList{ii}));
      if currsum<.1 
          k(CC.PixelIdxList{ii}) = 0;
      end
  end
  k(k<0) = 0;
  k=k/sum(k(:));
  %%%%%%%%%%%%%%%%%%%%%%%%%%
  %% Parameter updating
  if lambda~=0;
      lambda = max(lambda/1.1, 1e-2);
  else
      lambda = 0;
  end
  
  if lambda_grad~=0;
      lambda_grad = max(lambda_grad/1.1, 1e-4);
  else
      lambda_grad = 0;
  end
  
  
%     if ~opts.quiet
%       figure(1); 
%       S(S<0) = 0;
%       S(S>1) = 1;
%       subplot(1,3,1); imshow(blur_B,[]); title('Blurred image');
%       subplot(1,3,2); imshow(S,[]);title('Interim latent image');
%       subplot(1,3,3); imshow(k,[]);title('Estimated kernel');
%       drawnow;
%     end

end;
k(k<0) = 0;  
k = k ./ sum(k(:));
