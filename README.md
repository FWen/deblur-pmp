# Efficient Blind Image Deblurring Using Patch-Wise Minimal Pixels Regularization


This code is used to reproduce the results of the PMP based deblurring algortihm in the paper:  
F. Wen, R. Ying, Y. Liu, P. Liu and T.-K. Truong, "A Simple Local Minimal Intensity Prior and An Improved Algorithm for Blind Image Deblurring," IEEE Trans Circuits and Systems for Video Technology, vol. 31, no. 8, pp. 2923-2937, 2021.

This code is modified from that of Pan at http://vllab1.ucmerced.edu/∼jinshan/projects/dark-channel-deblur/. 
Note that, some codes of Pan, also some codes from Cho and Whyte, are directly reused here. We copy them here only for academic use purpose.

Moreover, for ease of use for interested readers who want to reproduce the result of our algorithm,
and only for academic use purpose,
we have copied here the blurred images from the following two datasets (see the 'BlurryImages' and 'Levin_data' folders):
(1) R. Kohler, M. Hirsch, B. J. Mohler, B. Scholkopf, and S. Harmeling, “Recording and playback of camera shake: Benchmarking blind deconvolution with a real-world database,” in Proc. Eur. Conf. Comput. Vis., 2012, pp. 27–40.
(2) A. Levin, Y. Weiss, F. Durand, and W. T. Freeman, “Understanding and evaluating blind deconvolution algorithms,” in Proc. IEEE Conf. Comput. Vis. Pattern Recognit., 2009, pp. 1964–1971.

By this, the results on these two datasets reported in the paper can be reproduced via directly running the 'demo_Levin.m' and ‘demo_eccv12.m’ files.


Meanwhile, some sample images form Pan are also used here, please see the 'sample_images' folder.

## (1) Results on the dataset of Kohler et al.:

**Quantitative evaluation results on the benchmark dataset of Kohler et al. (PSNR and SSIM comparison over 48 blurry images)**

<img src="https://github.com/FWen/deblur-pmp/blob/master/results_eccv12/Kohler_PSNR_SSIM.png" width="600" /> 

**Average PSNR and average SSIM on the dataset of Kohler et al.**

<img src="https://github.com/FWen/deblur-pmp/blob/master/results_eccv12/Kohler_PSNR_SSIM_table.png" width="300" />


## (2) Results on the dataset of Levin et al.:

**Quantitative evaluation results on the benchmark dataset of Levin et al. [2] (PSNR and SSIM comparison over 32 blurry images)**

<img src="https://github.com/FWen/deblur-pmp/blob/master/results_Levin/Levin_PSNR_SSIM.png?raw=true" width="500" />

**Average PSNR and average SSIM on the dataset of Levin et al.:**

<img src="https://github.com/FWen/deblur-pmp/blob/master/results_Levin/Levin_PSNR_SSIM_table.png?raw=true" width="300" />

## (3) Computational complexity:

<img src="https://github.com/FWen/deblur-pmp/blob/master/results_samples/comp/runtime.png" width="500" />


## Citation
@article{2021pmpDeblur,  
title={A Simple Local Minimal Intensity Prior and an Improved Algorithm for Blind Image Deblurring},  
author={Wen, Fei and Ying, Rendong and Liu, Yipeng and Liu, Peilin and Truong, Trieu-Kien},  
journal={IEEE Transactions on Circuits and Systems for Video Technology},  
volume={31},  
number={8},  
pages={2923--2937},  
year={2021},  
publisher={IEEE}  
}
