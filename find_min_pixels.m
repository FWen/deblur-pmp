function [J, Mask] = find_min_pixels(I, patch_size)

[M, N] = size(I);
Mp = ceil(M/patch_size);
Np = ceil(N/patch_size);
J = zeros(M, N);  
Mask = zeros(M, N);

for m = 1:Mp
    for n = 1:Np
        idx1 = [1,patch_size]+(m-1)*patch_size;
        idx2 = [1,patch_size]+(n-1)*patch_size;
        patch = I(idx1(1):min(idx1(2),M), idx2(1):min(idx2(2),N));
        
        [val,idx] = min(patch(:));
        cur_patch = zeros(size(patch));
        
        cur_patch(idx) = val;
        
        J(idx1(1):min(idx1(2),M), idx2(1):min(idx2(2),N)) = cur_patch;
        
        patch = zeros(min(idx1(2),M)-idx1(1)+1, min(idx2(2),N)-idx2(1)+1);
        patch(idx) = 1;
        Mask(idx1(1):min(idx1(2),M), idx2(1):min(idx2(2),N)) = patch;
    end
end

end
