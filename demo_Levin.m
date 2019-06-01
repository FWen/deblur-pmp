clear all; close all; clc;

addpath(genpath('cho_code'));

opts.prescale = 1; % downsampling
opts.k_thresh = 20;
opts.xk_iter = 6;  % the iterations
opts.gamma_correct = 0.8;
kernel_size = [25, 25, 25, 31, 25, 25, 25, 25]; % the used kernel size for the 8 different kernels

lambda = 0.1; lambda_grad = 5e-3;
lambda_tv = 1e-3; lambda_l0 = 2e-4; 
% Note:lambda_tv, lambda_l0, weight_ring  are not used in kernel estimation.
        
for img=1:4
    for blur=1:8
        imgName = ['im0',num2str(img),'_ker0',num2str(blur)];
        disp(['========================== ',imgName,' =========================='])

        load(['.\Levin_data\', imgName]);

        weight_ring = 0;
        if blur==4 || blur==8
            weight_ring = 1;
        end

        opts.kernel_size = kernel_size(blur);  
        [kernel, interim_latent] = blind_deconv(y, lambda, lambda_grad, opts,5);

        % Final Deblur: 1. TV-L2 denoising method
        Latent = ringing_artifacts_removal(y, kernel, lambda_tv, lambda_l0, weight_ring);
        ssde(img,blur) = comp_upto_shift(Latent,x)

        k = kernel - min(kernel(:));
        k = k./max(k(:));

        imwrite(k,['results_Levin\',  'tvmpr_',imgName, '_kernel','.png']);
        imwrite(Latent,['results_Levin\', 'tvmpr_',imgName, '.png']);
    end
end

%% compute the success rate (normalized by the deconvolution result using the ground truth kernel)
% SSD error corresponding to deconvolution results using the ground truth kernel
ssde_gt = [33.2452   37.8673   26.1407   48.3362   21.0029   15.8103   20.6043   26.1233;
           48.3678   51.6701   42.9596   72.8446   27.9074   20.3612   39.6822   40.9937;
           31.8456   36.5485   18.6523   39.4669   14.8198   10.0371   13.1905   23.4166;
           30.0886   44.1580   15.3129   39.8219   15.4713   17.9402   14.8388   23.1270];

errLr = ssde./ssde_gt;

thrv=[1.5,2,2.5,3];
for i=1:length(thrv)
    cerrL(i)=sum(sum( errLr<=thrv(i)))/32;
end
figure(4);plot(thrv, 100*cerrL,'LineWidth',2);grid on;
ylabel('Success Rate (%)');xlabel('Error Ratios');

100*cerrL
    