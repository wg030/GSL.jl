#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
#########################
# 14.1 LU Decomposition #
#########################
export gsl_linalg_LU_decomp, gsl_linalg_complex_LU_decomp, gsl_linalg_LU_solve,
       gsl_linalg_complex_LU_solve, gsl_linalg_LU_svx,
       gsl_linalg_complex_LU_svx, gsl_linalg_LU_refine,
       gsl_linalg_complex_LU_refine, gsl_linalg_LU_invert,
       gsl_linalg_complex_LU_invert, gsl_linalg_LU_det,
       gsl_linalg_complex_LU_det, gsl_linalg_LU_lndet,
       gsl_linalg_complex_LU_lndet, gsl_linalg_LU_sgndet,
       gsl_linalg_complex_LU_sgndet




# These functions factorize the square matrix A into the LU decomposition PA =
# LU.  On output the diagonal and upper triangular part of the input matrix A
# contain the matrix U. The lower triangular part of the input matrix
# (excluding the diagonal) contains L.  The diagonal elements of L are unity,
# and are not stored.          The permutation matrix P is encoded in the
# permutation p. The j-th column of the matrix P is given by the k-th column of
# the identity matrix, where k = p_j the j-th element of the permutation
# vector. The sign of the permutation is given by signum. It has the value
# (-1)^n, where n is the number of interchanges in the permutation.
# The algorithm used in the decomposition is Gaussian Elimination with partial
# pivoting (Golub & Van Loan, Matrix Computations, Algorithm 3.4.1).
# 
#   Returns: Cint
function gsl_linalg_LU_decomp()
    A = convert(Ptr{gsl_matrix}, Array(gsl_matrix, 1))
    p = convert(Ptr{gsl_permutation}, Array(gsl_permutation, 1))
    signum = convert(Ptr{Cint}, Array(Cint, 1))
    gsl_errno = ccall( (:gsl_linalg_LU_decomp, :libgsl), Cint,
        (Ptr{gsl_matrix}, Ptr{gsl_permutation}, Ptr{Cint}), A, p, signum )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(A) ,unsafe_ref(p) ,unsafe_ref(signum)
end


# These functions factorize the square matrix A into the LU decomposition PA =
# LU.  On output the diagonal and upper triangular part of the input matrix A
# contain the matrix U. The lower triangular part of the input matrix
# (excluding the diagonal) contains L.  The diagonal elements of L are unity,
# and are not stored.          The permutation matrix P is encoded in the
# permutation p. The j-th column of the matrix P is given by the k-th column of
# the identity matrix, where k = p_j the j-th element of the permutation
# vector. The sign of the permutation is given by signum. It has the value
# (-1)^n, where n is the number of interchanges in the permutation.
# The algorithm used in the decomposition is Gaussian Elimination with partial
# pivoting (Golub & Van Loan, Matrix Computations, Algorithm 3.4.1).
# 
#   Returns: Cint
#XXX Unknown input type A::Ptr{gsl_matrix_complex}
#XXX Coerced type for A::Ptr{Void}
function gsl_linalg_complex_LU_decomp(A::Ptr{Void})
    p = convert(Ptr{gsl_permutation}, Array(gsl_permutation, 1))
    signum = convert(Ptr{Cint}, Array(Cint, 1))
    gsl_errno = ccall( (:gsl_linalg_complex_LU_decomp, :libgsl), Cint,
        (Ptr{Void}, Ptr{gsl_permutation}, Ptr{Cint}), A, p, signum )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(p) ,unsafe_ref(signum)
end


# These functions solve the square system A x = b using the LU decomposition of
# A into (LU, p) given by gsl_linalg_LU_decomp or gsl_linalg_complex_LU_decomp
# as input.
# 
#   Returns: Cint
function gsl_linalg_LU_solve(LU::Ptr{gsl_matrix}, p::Ptr{gsl_permutation}, b::Ptr{gsl_vector})
    x = convert(Ptr{gsl_vector}, Array(gsl_vector, 1))
    gsl_errno = ccall( (:gsl_linalg_LU_solve, :libgsl), Cint,
        (Ptr{gsl_matrix}, Ptr{gsl_permutation}, Ptr{gsl_vector},
        Ptr{gsl_vector}), LU, p, b, x )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(x)
end


# These functions solve the square system A x = b using the LU decomposition of
# A into (LU, p) given by gsl_linalg_LU_decomp or gsl_linalg_complex_LU_decomp
# as input.
# 
#   Returns: Cint
#XXX Unknown input type LU::Ptr{gsl_matrix_complex}
#XXX Coerced type for LU::Ptr{Void}
#XXX Unknown input type b::Ptr{gsl_vector_complex}
#XXX Coerced type for b::Ptr{Void}
#XXX Unknown input type x::Ptr{gsl_vector_complex}
#XXX Coerced type for x::Ptr{Void}
function gsl_linalg_complex_LU_solve(LU::Ptr{Void}, p::Ptr{gsl_permutation}, b::Ptr{Void}, x::Ptr{Void})
    gsl_errno = ccall( (:gsl_linalg_complex_LU_solve, :libgsl), Cint,
        (Ptr{Void}, Ptr{gsl_permutation}, Ptr{Void}, Ptr{Void}), LU, p, b, x )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
end


# These functions solve the square system A x = b in-place using the
# precomputed LU decomposition of A into (LU,p). On input x should contain the
# right-hand side b, which is replaced by the solution on output.
# 
#   Returns: Cint
function gsl_linalg_LU_svx(LU::Ptr{gsl_matrix}, p::Ptr{gsl_permutation})
    x = convert(Ptr{gsl_vector}, Array(gsl_vector, 1))
    gsl_errno = ccall( (:gsl_linalg_LU_svx, :libgsl), Cint,
        (Ptr{gsl_matrix}, Ptr{gsl_permutation}, Ptr{gsl_vector}), LU, p, x )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(x)
end


# These functions solve the square system A x = b in-place using the
# precomputed LU decomposition of A into (LU,p). On input x should contain the
# right-hand side b, which is replaced by the solution on output.
# 
#   Returns: Cint
#XXX Unknown input type LU::Ptr{gsl_matrix_complex}
#XXX Coerced type for LU::Ptr{Void}
#XXX Unknown input type x::Ptr{gsl_vector_complex}
#XXX Coerced type for x::Ptr{Void}
function gsl_linalg_complex_LU_svx(LU::Ptr{Void}, p::Ptr{gsl_permutation}, x::Ptr{Void})
    gsl_errno = ccall( (:gsl_linalg_complex_LU_svx, :libgsl), Cint,
        (Ptr{Void}, Ptr{gsl_permutation}, Ptr{Void}), LU, p, x )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
end


# These functions apply an iterative improvement to x, the solution of A x = b,
# from the precomputed LU decomposition of A into (LU,p). The initial residual
# r = A x - b is also computed and stored in residual.
# 
#   Returns: Cint
function gsl_linalg_LU_refine(A::Ptr{gsl_matrix}, LU::Ptr{gsl_matrix}, p::Ptr{gsl_permutation}, b::Ptr{gsl_vector})
    x = convert(Ptr{gsl_vector}, Array(gsl_vector, 1))
    residual = convert(Ptr{gsl_vector}, Array(gsl_vector, 1))
    gsl_errno = ccall( (:gsl_linalg_LU_refine, :libgsl), Cint,
        (Ptr{gsl_matrix}, Ptr{gsl_matrix}, Ptr{gsl_permutation},
        Ptr{gsl_vector}, Ptr{gsl_vector}, Ptr{gsl_vector}), A, LU, p, b, x,
        residual )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(x) ,unsafe_ref(residual)
end


# These functions apply an iterative improvement to x, the solution of A x = b,
# from the precomputed LU decomposition of A into (LU,p). The initial residual
# r = A x - b is also computed and stored in residual.
# 
#   Returns: Cint
#XXX Unknown input type A::Ptr{gsl_matrix_complex}
#XXX Coerced type for A::Ptr{Void}
#XXX Unknown input type LU::Ptr{gsl_matrix_complex}
#XXX Coerced type for LU::Ptr{Void}
#XXX Unknown input type b::Ptr{gsl_vector_complex}
#XXX Coerced type for b::Ptr{Void}
#XXX Unknown input type x::Ptr{gsl_vector_complex}
#XXX Coerced type for x::Ptr{Void}
#XXX Unknown input type residual::Ptr{gsl_vector_complex}
#XXX Coerced type for residual::Ptr{Void}
function gsl_linalg_complex_LU_refine(A::Ptr{Void}, LU::Ptr{Void}, p::Ptr{gsl_permutation}, b::Ptr{Void}, x::Ptr{Void}, residual::Ptr{Void})
    gsl_errno = ccall( (:gsl_linalg_complex_LU_refine, :libgsl), Cint,
        (Ptr{Void}, Ptr{Void}, Ptr{gsl_permutation}, Ptr{Void}, Ptr{Void},
        Ptr{Void}), A, LU, p, b, x, residual )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
end


# These functions compute the inverse of a matrix A from its LU decomposition
# (LU,p), storing the result in the matrix inverse. The inverse is computed by
# solving the system A x = b for each column of the identity matrix.  It is
# preferable to avoid direct use of the inverse whenever possible, as the
# linear solver functions can obtain the same result more efficiently and
# reliably (consult any introductory textbook on numerical linear algebra for
# details).
# 
#   Returns: Cint
function gsl_linalg_LU_invert(LU::Ptr{gsl_matrix}, p::Ptr{gsl_permutation})
    inverse = convert(Ptr{gsl_matrix}, Array(gsl_matrix, 1))
    gsl_errno = ccall( (:gsl_linalg_LU_invert, :libgsl), Cint,
        (Ptr{gsl_matrix}, Ptr{gsl_permutation}, Ptr{gsl_matrix}), LU, p,
        inverse )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(inverse)
end


# These functions compute the inverse of a matrix A from its LU decomposition
# (LU,p), storing the result in the matrix inverse. The inverse is computed by
# solving the system A x = b for each column of the identity matrix.  It is
# preferable to avoid direct use of the inverse whenever possible, as the
# linear solver functions can obtain the same result more efficiently and
# reliably (consult any introductory textbook on numerical linear algebra for
# details).
# 
#   Returns: Cint
#XXX Unknown input type LU::Ptr{gsl_matrix_complex}
#XXX Coerced type for LU::Ptr{Void}
#XXX Unknown input type inverse::Ptr{gsl_matrix_complex}
#XXX Coerced type for inverse::Ptr{Void}
function gsl_linalg_complex_LU_invert(LU::Ptr{Void}, p::Ptr{gsl_permutation}, inverse::Ptr{Void})
    gsl_errno = ccall( (:gsl_linalg_complex_LU_invert, :libgsl), Cint,
        (Ptr{Void}, Ptr{gsl_permutation}, Ptr{Void}), LU, p, inverse )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
end


# These functions compute the determinant of a matrix A from its LU
# decomposition, LU. The determinant is computed as the product of the diagonal
# elements of U and the sign of the row permutation signum.
# 
#   Returns: Cdouble
function gsl_linalg_LU_det{gsl_int<:Integer}(LU::Ptr{gsl_matrix}, signum::gsl_int)
    ccall( (:gsl_linalg_LU_det, :libgsl), Cdouble, (Ptr{gsl_matrix}, Cint),
        LU, signum )
end


# These functions compute the determinant of a matrix A from its LU
# decomposition, LU. The determinant is computed as the product of the diagonal
# elements of U and the sign of the row permutation signum.
# 
#   Returns: gsl_complex
#XXX Unknown input type LU::Ptr{gsl_matrix_complex}
#XXX Coerced type for LU::Ptr{Void}
function gsl_linalg_complex_LU_det{gsl_int<:Integer}(LU::Ptr{Void}, signum::gsl_int)
    ccall( (:gsl_linalg_complex_LU_det, :libgsl), gsl_complex, (Ptr{Void},
        Cint), LU, signum )
end


# These functions compute the logarithm of the absolute value of the
# determinant of a matrix A, \ln|\det(A)|, from its LU decomposition, LU.  This
# function may be useful if the direct computation of the determinant would
# overflow or underflow.
# 
#   Returns: Cdouble
function gsl_linalg_LU_lndet(LU::Ptr{gsl_matrix})
    ccall( (:gsl_linalg_LU_lndet, :libgsl), Cdouble, (Ptr{gsl_matrix}, ),
        LU )
end


# These functions compute the logarithm of the absolute value of the
# determinant of a matrix A, \ln|\det(A)|, from its LU decomposition, LU.  This
# function may be useful if the direct computation of the determinant would
# overflow or underflow.
# 
#   Returns: Cdouble
#XXX Unknown input type LU::Ptr{gsl_matrix_complex}
#XXX Coerced type for LU::Ptr{Void}
function gsl_linalg_complex_LU_lndet(LU::Ptr{Void})
    ccall( (:gsl_linalg_complex_LU_lndet, :libgsl), Cdouble, (Ptr{Void}, ),
        LU )
end


# These functions compute the sign or phase factor of the determinant of a
# matrix A, \det(A)/|\det(A)|, from its LU decomposition, LU.
# 
#   Returns: Cint
function gsl_linalg_LU_sgndet{gsl_int<:Integer}(signum::gsl_int)
    LU = convert(Ptr{gsl_matrix}, Array(gsl_matrix, 1))
    gsl_errno = ccall( (:gsl_linalg_LU_sgndet, :libgsl), Cint,
        (Ptr{gsl_matrix}, Cint), LU, signum )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(LU)
end


# These functions compute the sign or phase factor of the determinant of a
# matrix A, \det(A)/|\det(A)|, from its LU decomposition, LU.
# 
#   Returns: gsl_complex
#XXX Unknown input type LU::Ptr{gsl_matrix_complex}
#XXX Coerced type for LU::Ptr{Void}
function gsl_linalg_complex_LU_sgndet{gsl_int<:Integer}(LU::Ptr{Void}, signum::gsl_int)
    ccall( (:gsl_linalg_complex_LU_sgndet, :libgsl), gsl_complex,
        (Ptr{Void}, Cint), LU, signum )
end