#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
#############################################################
# 14.6 Tridiagonal Decomposition of Real Symmetric Matrices #
#############################################################
export gsl_linalg_symmtd_decomp, gsl_linalg_symmtd_unpack,
       gsl_linalg_symmtd_unpack_T




# This function factorizes the symmetric square matrix A into the symmetric
# tridiagonal decomposition Q T Q^T.  On output the diagonal and subdiagonal
# part of the input matrix A contain the tridiagonal matrix T.  The remaining
# lower triangular part of the input matrix contains the Householder vectors
# which, together with the Householder coefficients tau, encode the orthogonal
# matrix Q. This storage scheme is the same as used by lapack.  The upper
# triangular part of A is not referenced.
# 
#   Returns: Cint
function gsl_linalg_symmtd_decomp()
    A = convert(Ptr{gsl_matrix}, Array(gsl_matrix, 1))
    tau = convert(Ptr{gsl_vector}, Array(gsl_vector, 1))
    gsl_errno = ccall( (:gsl_linalg_symmtd_decomp, :libgsl), Cint,
        (Ptr{gsl_matrix}, Ptr{gsl_vector}), A, tau )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(A) ,unsafe_ref(tau)
end


# This function unpacks the encoded symmetric tridiagonal decomposition (A,
# tau) obtained from gsl_linalg_symmtd_decomp into the orthogonal matrix Q, the
# vector of diagonal elements diag and the vector of subdiagonal elements
# subdiag.
# 
#   Returns: Cint
function gsl_linalg_symmtd_unpack(A::Ptr{gsl_matrix}, tau::Ptr{gsl_vector})
    Q = convert(Ptr{gsl_matrix}, Array(gsl_matrix, 1))
    diag = convert(Ptr{gsl_vector}, Array(gsl_vector, 1))
    subdiag = convert(Ptr{gsl_vector}, Array(gsl_vector, 1))
    gsl_errno = ccall( (:gsl_linalg_symmtd_unpack, :libgsl), Cint,
        (Ptr{gsl_matrix}, Ptr{gsl_vector}, Ptr{gsl_matrix}, Ptr{gsl_vector},
        Ptr{gsl_vector}), A, tau, Q, diag, subdiag )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(Q) ,unsafe_ref(diag) ,unsafe_ref(subdiag)
end


# This function unpacks the diagonal and subdiagonal of the encoded symmetric
# tridiagonal decomposition (A, tau) obtained from gsl_linalg_symmtd_decomp
# into the vectors diag and subdiag.
# 
#   Returns: Cint
function gsl_linalg_symmtd_unpack_T(A::Ptr{gsl_matrix})
    diag = convert(Ptr{gsl_vector}, Array(gsl_vector, 1))
    subdiag = convert(Ptr{gsl_vector}, Array(gsl_vector, 1))
    gsl_errno = ccall( (:gsl_linalg_symmtd_unpack_T, :libgsl), Cint,
        (Ptr{gsl_matrix}, Ptr{gsl_vector}, Ptr{gsl_vector}), A, diag, subdiag )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(diag) ,unsafe_ref(subdiag)
end
