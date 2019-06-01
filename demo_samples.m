clear;close all;clc;

addpath(genpath('whyte_code'));
addpath(genpath('cho_code'));
opts.prescale = 1; %%downsampling
opts.xk_iter = 5; %% the iterations
opts.k_thresh = 20;

%% Note:
%% lambda_tv, lambda_l0, weight_ring are non-necessary, they are not used in kernel estimation.

for ki=1:30
    opts.gamma_correct = 1.0;    
    switch ki
    case 1
        filename = 'sample_images\flower.jpg'; opts.kernel_size = 35;  saturation = 0;
        lambda = 0.1; lambda_grad = 4e-3; 
        lambda_tv = 0.001; lambda_l0 = 1e-3; weight_ring = 1;
    case 2
        filename = 'sample_images\summerhouse.jpg'; opts.kernel_size = 95;  saturation = 0;
        lambda = 0.1; lambda_grad = 4e-3; 
        lambda_tv = 0.001; lambda_l0 = 1e-3; weight_ring = 1;
    case 3    
        filename = 'sample_images\26.blurred.jpg'; opts.kernel_size = 45;  saturation = 0;
        lambda = 0.1; lambda_grad = 4e-3; opts.gamma_correct = 1.0;
        lambda_tv = 0.001; lambda_l0 = 5e-4; weight_ring = 1;
    case 4   
        filename = 'sample_images\Blurry2_8.png'; opts.kernel_size = 125;  saturation = 0;
        lambda = 0.15; lambda_grad = 4e-3;opts.gamma_correct = 1.0;
        lambda_tv = 0.001; lambda_l0 = 2e-3; weight_ring = 0;
    case 5
        filename = 'sample_images\postcard.png'; opts.kernel_size = 91;  saturation =0;
        lambda = 0.1; lambda_grad = 2e-3;opts.gamma_correct = 2.2;
        lambda_tv = 0.0005; lambda_l0 = 5e-4; weight_ring = 1;
    case 6 
        filename = 'sample_images\boat.jpg'; opts.kernel_size = 35;  saturation = 0;
        lambda = 0.1; lambda_grad = 4e-3;opts.gamma_correct = 2.2;
        lambda_tv = 0.0005; lambda_l0 = 5e-4; weight_ring = 1;
    case 7 
        filename = 'sample_images\flower_blurred.png'; opts.kernel_size = 55;  saturation = 0;
        lambda = 0.1; lambda_grad = 4e-3;opts.gamma_correct = 2.2;
        lambda_tv = 0.001; lambda_l0 = 2e-3; weight_ring = 1;
    case 8 
        filename = 'sample_images\wall.png'; opts.kernel_size = 65;  saturation = 0;
        lambda = 0.1; lambda_grad = 4e-3;opts.gamma_correct = 1.0;
        lambda_tv = 0.0001; lambda_l0 = 2e-3; weight_ring = 0;
     case 9
        filename = 'sample_images\real_blur_img3.png'; opts.kernel_size = 35;  saturation = 0;
        lambda = 0.1; lambda_grad = 4e-3;opts.gamma_correct = 1.0;
        lambda_tv = 0.001; lambda_l0 = 5e-4; weight_ring = 1;
     case 10
        filename = 'sample_images\real_img2.png'; opts.kernel_size = 25;  saturation = 0;
        lambda = 0.1; lambda_grad = 4e-3;opts.gamma_correct = 1.0;
        lambda_tv = 0.003; lambda_l0 = 5e-4; weight_ring = 1;  
     case 11
        filename = 'sample_images\7_patch_use.png'; opts.kernel_size = 85;  saturation = 0;
        lambda = 0.1; lambda_grad = 4e-3;
        lambda_tv = 0.01; lambda_l0 = 2e-3; weight_ring = 1;
    case 12 
        filename = 'sample_images\Blurry4_9.png'; opts.kernel_size = 99;  saturation = 0;
        lambda = 0.1; lambda_grad = 4e-3; opts.gamma_correct = 1.0;
        lambda_tv = 0.002; lambda_l0 = 1e-3; weight_ring = 0;
    case 13 
        filename = 'sample_images\Blurry4_6.png'; opts.kernel_size = 41;  saturation = 0;
        lambda = 0.1; lambda_grad = 4e-3; opts.gamma_correct = 1.0;
        lambda_tv = 0.002; lambda_l0 = 1e-3; weight_ring = 0;
    case 14 
        filename = 'sample_images\toy.png'; opts.kernel_size = 101;  saturation = 0;
        lambda = 0.1; lambda_grad = 1e-3;opts.gamma_correct = 1.0;
        lambda_tv = 0.001; lambda_l0 = 5e-4; weight_ring = 1;
    case 15
        filename = 'sample_images\real_disney.jpg'; opts.kernel_size = 30;  saturation = 0;
        lambda = 0.1; lambda_grad = 4e-3;opts.gamma_correct = 1.0;
        lambda_tv = 0.001; lambda_l0 = 5e-4; weight_ring = 0;           
    case 16 
        filename = 'sample_images\im05_ker04_blur.png'; opts.kernel_size = 27;  saturation = 0;
        lambda = 0.1; lambda_grad = 4e-3;opts.gamma_correct = 1.0;
        lambda_tv = 0.001; lambda_l0 = 5e-4; weight_ring = 1;
    case 17 
        filename = 'sample_images\IMG_1240_blur.png'; opts.kernel_size = 45;  saturation = 0;
        lambda = 0.1; lambda_grad = 4e-3;opts.gamma_correct = 1.0;
        lambda_tv = 0.001; lambda_l0 = 5e-4; weight_ring = 1;
    case 18 
        filename = 'sample_images\real_leaf.png'; opts.kernel_size = 45;  saturation = 0;
        lambda = 0.1; lambda_grad = 4e-3;opts.gamma_correct = 2.2;
        lambda_tv = 0.001; lambda_l0 = 5e-4; weight_ring = 1;
    case 19 
        filename = 'sample_images\IMG_4548_small.png'; opts.kernel_size = 35;  saturation = 1;
        lambda = 0.1; lambda_grad = 4e-3;opts.gamma_correct = 1.0;
        lambda_tv = 0.001; lambda_l0 = 5e-4; weight_ring = 1;
    case 20
        filename = 'sample_images\26.png'; opts.kernel_size = 65;  saturation = 1;
        lambda = 0.1; lambda_grad = 4e-3;opts.gamma_correct = 2.2;
    case 21 
        filename = 'sample_images\roma.png'; opts.kernel_size = 45;  saturation = 0;
        lambda = 0.1; lambda_grad = 2e-3;opts.gamma_correct = 1.0;
        lambda_tv = 0.001; lambda_l0 = 5e-4; weight_ring = 1;
    case 22
        filename = 'sample_images\IMG_0650_small_patch.png'; opts.kernel_size = 75;  saturation = 1;
        lambda = 0.1; lambda_grad = 4e-3;opts.gamma_correct = 1.0;
        lambda_tv = 0.001; lambda_l0 = 5e-4; weight_ring = 1;
    case 23 
        filename = 'sample_images\building.jpg'; opts.kernel_size = 33;  saturation = 0;
        lambda = 0.1; lambda_grad = 4e-3;opts.gamma_correct = 1.0;
        lambda_tv = 0.003; lambda_l0 = 5e-4; weight_ring = 0;
    case 24 
        filename = 'sample_images\my_test_car6.png'; opts.kernel_size = 95;  saturation = 1;
        lambda = 0.1; lambda_grad = 4e-3;opts.gamma_correct = 2.2;
    case 25
        filename = 'sample_images\blurry_7.png'; opts.kernel_size = 55;  saturation = 1;
        lambda = 0.1; lambda_grad = 4e-3;%opts.gamma_correct = 2.2;
    case 26
        filename = 'sample_images\blurry_2_small.png'; opts.kernel_size = 35;  saturation = 1;
        lambda = 0.1; lambda_grad = 4e-3;
    case 27
        filename = 'sample_images\IMG_0664_small_patch.png'; opts.kernel_size = 65;  saturation = 1;
        lambda = 0.1; lambda_grad = 4e-3;opts.gamma_correct = 1.0;
        lambda_tv = 0.001; lambda_l0 = 5e-4; weight_ring = 1;
    case 28
        filename = 'sample_images\IMG_4355_small.png'; opts.kernel_size = 45;  saturation = 0;
        lambda = 0.1; lambda_grad = 4e-3;
        lambda_tv = 0.002; lambda_l0 = 2e-4; weight_ring = 1;
    case 29
        filename = 'sample_images\las_vegas_saturated.png'; opts.kernel_size = 99;  saturation = 0;
        lambda = 0.1; lambda_grad = 4e-3;opts.gamma_correct = 1.0;
        lambda_tv = 0.001; lambda_l0 = 5e-4; weight_ring = 1;
    case 30
        filename = 'sample_images\IMG_4561.JPG'; opts.kernel_size = 65;  saturation = 1;
        lambda = 0.1; lambda_grad = 4e-3;opts.gamma_correct = 1.0;
        lambda_tv = 0.001; lambda_l0 = 5e-4; weight_ring = 1;
    otherwise
        continue;
    end   

    y = imread(filename);
    if size(y,3)==3
        yg = im2double(rgb2gray(y));
    else
        yg = im2double(y);
    end

    opts.quiet = 0;

    tic;
    [kernel, interim_latent] = blind_deconv(yg, lambda, lambda_grad, opts);
    toc

    %% ============Non-blind deconvolution ((Just use text deblurring methods))====================%%
    y = im2double(y);
    %% Final Deblur: 

    if ~saturation
        %% 1. TV-L2 denoising method
        Latent = ringing_artifacts_removal(y, kernel, lambda_tv, lambda_l0, weight_ring);
    else
        %% 2. Whyte's deconvolution method (For saturated images)
        Latent = whyte_deconv(y, kernel);
    end

    if ~opts.quiet
        figure; imshow(Latent)
    end

    k = kernel - min(kernel(:));
    k = k./max(k(:));

    if lambda==0 % without using pmpr
        imwrite(k,['results_samples_wo\',  filename(14:end-4), '_kernel.png']);
        imwrite(Latent,['results_samples_wo\', filename(14:end-4), '_deblurred.png']);
        imwrite(interim_latent,['results_samples_wo\', filename(14:end-4), '_interim_result.png']);
    else
        imwrite(k,['results_samples\',  filename(14:end-4), '_kernel.png']);
        imwrite(Latent,['results_samples\', filename(14:end-4), '_deblurred.png']);
        imwrite(interim_latent,['results_samples\', filename(14:end-4), '_interim_result.png']);
    end
end
