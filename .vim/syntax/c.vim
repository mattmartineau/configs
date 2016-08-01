" Improved highlighting
syn match cCustomParen "?=(" contains=cParen,cCppParen
syn match cCustomFunc "\w\+\s*(\@=" contains=cCustomParen
syn match cCustomScope "::"
syn match cCustomClass "\w\+\s*::" contains=cCustomScope
hi def link cCustomFunc Function
hi def link cCustomClass Function

" CUDA highlighting
syn keyword cType __global__ __host__ __device__ 
syn keyword cType __constant__ __shared__
syn match cCudaFuncStart "\w\+\s*<<<\@>" contains=cCustomParen
syn match cCudaFuncEnd ">>>\@>" contains=cCustomParen
hi def link cCudaFuncStart Function
hi def link cCudaFuncEnd Function

"OpenCL highlighting 
syn keyword cType __kernel__ __kernel
