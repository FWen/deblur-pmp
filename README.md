# Deblur-PMP: Efficient Blind Image Deblurring Using Patch-Wise Minimal Pixels Regularization


This code is used to reproduce the results of the PMP based deblurring algortihm in the paper: 
F. Wen, R. Ying, Y. Liu, P. Liu and T.-K. Truong, "A Simple Local Minimal Intensity Prior and An Improved Algorithm for Blind Image Deblurring," IEEE Transactions on Circuits and Systems for Video Technology, 2020.

This code is modified from that of Pan at http://vllab1.ucmerced.edu/∼jinshan/projects/dark-channel-deblur/, 
details please see the paper "J. Pan, D. Sun, H. Pfister, and M.-H. Yang, Blind image deblurring using dark channel prior, CVPR, 2016". 

Note that, some codes of Pan, also some codes from Cho and Whyte, are directly reused here. We copy them here only for academic use purpose to demonstrate the result of our algorithm reported in our paper.

Moreover, for ease of use for interested readers who want to reproduce the result of our algorithm,
and only for academic use purpose,
we have copied here the blurred images from the following two datasets (see the 'BlurryImages' and 'Levin_data' folders):
(1) R. Kohler, M. Hirsch, B. J. Mohler, B. Scholkopf, and S. Harmeling, “Recording and playback of camera shake: Benchmarking blind deconvolution with a real-world database,” in Proc. Eur. Conf. Comput. Vis., 2012, pp. 27–40.
(2) A. Levin, Y. Weiss, F. Durand, and W. T. Freeman, “Understanding and evaluating blind deconvolution algorithms,” in Proc. IEEE Conf. Comput. Vis. Pattern Recognit., 2009, pp. 1964–1971.

By this, the results on these two datasets reported in the paper can be reproduced via directly running the 'demo_Levin.m' and ‘demo_eccv12.m’ files.


Meanwhile, some sample images form Pan are also used here, please see the 'sample_images' folder.

## (1) Results on the dataset of Kohler et al.:

**Average PSNR results:**

<img src="https://github.com/FWen/deblur-pmp/blob/master/results_eccv12/PSNR.png" width="500" />
<img src="https://github.com/FWen/deblur-pmp/blob/master/results_eccv12/Kohler_PSNR_SSIM.png" width="600" />
<img src="https://github.com/FWen/deblur-pmp/blob/master/results_eccv12/Kohler_PSNR_SSIM_table.png" width="300" />

%**PSNR results on the 48 blurred images (4*12):**

   im1: 36.0522   36.2223   37.9037   35.7582   34.7966   34.5660   33.8855   27.8220   27.3885   27.2955   26.7668   33.2083
   
   im2: 29.3671   30.4053   29.9556   29.4717   28.6813   27.8232   29.0712   22.1998   20.3863   20.7281   24.5929   27.9082
   
   im3: 36.4917   35.8153   34.8811   35.3276   35.9102   34.1285   35.4537   28.0253   23.6046   28.1864   26.1097   34.0165
   
   im4: 32.5411   31.9556   30.9590   32.2564   33.9447   28.8540   29.9345   21.5454   21.1881   24.4648   23.1017   28.2262

## (2) Results on the dataset of Levin et al.:

**Success Rate versus Error Ratio:**

<img src="https://github.com/FWen/deblur-pmp/blob/master/results_Levin/Success%20Rate.png" width="500" />

**Estimated kernels:**

<img src="https://github.com/FWen/deblur-pmp/blob/master/results_Levin/Kernels.png?raw=true" width="500" />

## (3) Samples of deblurring comparison:

<img src="https://github.com/FWen/deblur-pmp/blob/master/results_samples/comp/face_comp.jpg" width="1500" />

<img src="https://github.com/FWen/deblur-pmp/blob/master/results_samples/comp/natural_comp.jpg" width="1500" />

<img src="https://github.com/FWen/deblur-pmp/blob/master/results_samples/comp/text_comp.jpg" width="1500" />

## (4) Computaional complexity:

<img src="https://github.com/FWen/deblur-pmp/blob/master/results_samples/comp/runtime.png" width="500" />
