clear; close all; clc;

addpath(genpath('cho_code'));

kernel_sizes=[41    41    41    41    41    41    41   121   125   151    75    41;
              41    41    41    41    41    41    41   121   125   151    75    41;
              41    41    31    21    41    41    41   121   101   151    75    41;
              41    41    31    21    41    41    41   121   101   151    75    41];
          
opts.prescale = 1; % downsampling
opts.xk_iter = 5;  % the iterations
opts.k_thresh = 20;
opts.gamma_correct = 1.0;
        
for img=1:4
    for blur=1:12
        imgName = ['Blurry',num2str(img),'_',num2str(blur),'.png'];
        disp(['========================== ',imgName,' =========================='])

        filename = ['.\BlurryImages\', imgName];
        opts.kernel_size = kernel_sizes(img,blur);

        lambda = 0.1; lambda_grad = 4e-3;
        lambda_tv = 1e-3; lambda_l0 = 1e-3; weight_ring = 0; % lambda_tv, lambda_l0, weight_ring are not used in kernel estimation.

        if (blur==8) || (blur==10 && img==2) || (blur==11)
            lambda_l0 = 2e-4; weight_ring = 1;
        end

        y = imread(filename);
        yg = im2double(rgb2gray(y));

        tic;
        [kernel, interim_latent] = blind_deconv(yg, lambda, lambda_grad, opts);
        toc

        % Final Deblur: 1. TV-L2 denoising method
        y = im2double(y);
        Latent = ringing_artifacts_removal(y, kernel, lambda_tv, lambda_l0, weight_ring);

        k = kernel - min(kernel(:));
        k = k./max(k(:));

        imwrite(k,['results_eccv12\',  'tvmpr_',imgName(7:end-4), '_kernel','.png']);
        imwrite(Latent,['results_eccv12\', 'tvmpr_',imgName(7:end-4), '.png']);
    end
end
