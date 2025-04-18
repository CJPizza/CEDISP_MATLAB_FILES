function a = gaussian_func(fc, variance, f)
    a = exp((-(log2(f)-log2(fc)).^2)/(2*(variance)));
end
