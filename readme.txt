
Please run the main_1.m function to see the results.

code structure: 

main_1.m
The main function.


support functions: 
5x5mean.m
Function 5x5mean.m takes an image as input and applies a 5x5 neighborhood mean filter to it. The output image will be the image after 5x5mean filter. This function does not call any other function.

alpha_trim.m
Function alpha_trim.m takes an image and parameter alpha as input and applies an 5x5 alpha-trimmed mean filter to it. The output image will be the image after the alpha-trimmed filter. This function does not call any other function.

sigma_filter.m
Function sigma_filter.m takes an image as input and applies sigma filter to it. The output image will be the image after sigma_filter. This function does not call any other function. 

symmetry_NNMF.m
Function symmetry_NNMF.m takes an image as input, and applies symmetric nearest neighbor mean filter to it. The output image will be the image after symmetric nearest neighbor mean filter. This function does not call any other function.

Anisotropic_Diffusion_exp.m
Function Anisotropic_Diffusion_exp.m takes an image, parameter t, and parameter k as the inputs. Parameter t refers to the number of iterations, and k refers to the parameter in g(∙). The function      g(∙) in this function is the exponential form. The outputs are the images after the 0th, 20th, 50th, and 100th iteration. This function does not call any other function. 

Anisotropic_Diffusion_rev.m
Function Anisotropic_Diffusion_rev.m is the same as function Anisotropic_Diffusion_exp.m except g(∙). The g(∙) in this function is the inverse quadratic form. 
