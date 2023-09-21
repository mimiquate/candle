#include "cuda_fp16.h"
#include<stdint.h>

template<typename T>
__device__ void fill_with(T *buf, T value, const size_t numel) {
    for (unsigned int i = blockIdx.x * blockDim.x + threadIdx.x; i < numel; i += blockDim.x * gridDim.x) {
        buf[i] = value;
    }
}
extern "C" __global__ void fill_u8(uint8_t *buf, uint8_t value, const size_t numel) { fill_with(buf, value, numel); }
extern "C" __global__ void fill_f16(__half *buf, __half value, const size_t numel) { fill_with(buf, value, numel); }
extern "C" __global__ void fill_f32(float *buf, float value, const size_t numel) { fill_with(buf, value, numel); }
extern "C" __global__ void fill_f64(double *buf, double value, const size_t numel) { fill_with(buf, value, numel); }
