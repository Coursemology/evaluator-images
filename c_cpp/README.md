# C++ Images

These images are designed for evaluating submissions using specific C++ standards (e.g. C++11 or C++17), and includes the necessary tools and libraries for evaluation. As part of the images, these are included:

- [Boost C++ Libraries](https://www.boost.org)
- [GoogleTest](https://github.com/google/googletest) framework, used to evaluate submissions and output JUnit XML results, which are expected by the evaluation process.


Note: These libraries are pre-compiled and stored on the image to save time during submission evaluation.
It is expected that this takes some time (`c_cpp:11` image took 40 minutes and `c_cpp:17` took 10 minutes).

## Environment Variables

The `CXX_STD` environment variable is exported to show the C++ standard being used, which matches the name 
of the image (e.g., `c++17` for the C++17 image). The student submission and libraries listed above are all 
compiled using this C++ standard.
