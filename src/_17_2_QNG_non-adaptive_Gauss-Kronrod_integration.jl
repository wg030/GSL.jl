#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
###################################################
# 17.2 QNG non-adaptive Gauss-Kronrod integration #
###################################################
export integration_qng


# This function applies the Gauss-Kronrod 10-point, 21-point, 43-point and
# 87-point integration rules in succession until an estimate of the integral of
# f over (a,b) is achieved within the desired absolute and relative error
# limits, epsabs and epsrel.  The function returns the final approximation,
# result, an estimate of the absolute error, abserr and the number of function
# evaluations used, neval.  The Gauss-Kronrod rules are designed in such a way
# that each rule uses all the results of its predecessors, in order to minimize
# the total number of function evaluations.
# 
#   Returns: Cint
function integration_qng(f::Ref{gsl_function}, a::Real, b::Real, epsabs::Real, epsrel::Real)
    result = Ref{Cdouble}()
    abserr = Ref{Cdouble}()
    neval = Ref{Csize_t}()
    errno = ccall( (:gsl_integration_qng, libgsl), Cint,
        (Ref{gsl_function}, Cdouble, Cdouble, Cdouble, Cdouble, Ref{Cdouble},
        Ref{Cdouble}, Ref{Csize_t}), f, a, b, epsabs, epsrel, result, abserr,
        neval )
    if errno!= 0 throw(GSL_ERROR(errno)) end
    return result[], abserr[], neval[]
end
