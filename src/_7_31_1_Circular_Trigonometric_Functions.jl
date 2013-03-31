#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
###########################################
# 7.31.1 Circular Trigonometric Functions #
###########################################
export gsl_sf_sin, gsl_sf_sin_e, gsl_sf_cos, gsl_sf_cos_e, gsl_sf_hypot,
       gsl_sf_hypot_e, gsl_sf_sinc, gsl_sf_sinc_e


# These routines compute the sine function \sin(x).
# 
#   Returns: Cdouble
function gsl_sf_sin(x::Cdouble)
    ccall( (:gsl_sf_sin, :libgsl), Cdouble, (Cdouble, ), x )
end


# These routines compute the sine function \sin(x).
# 
#   Returns: Cint
function gsl_sf_sin_e(x::Cdouble)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_sin_e, :libgsl), Cint, (Cdouble,
        Ptr{gsl_sf_result}), x, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)
end


# These routines compute the cosine function \cos(x).
# 
#   Returns: Cdouble
function gsl_sf_cos(x::Cdouble)
    ccall( (:gsl_sf_cos, :libgsl), Cdouble, (Cdouble, ), x )
end


# These routines compute the cosine function \cos(x).
# 
#   Returns: Cint
function gsl_sf_cos_e(x::Cdouble)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_cos_e, :libgsl), Cint, (Cdouble,
        Ptr{gsl_sf_result}), x, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)
end


# These routines compute the hypotenuse function  \sqrt{x^2 + y^2} avoiding
# overflow and underflow.
# 
#   Returns: Cdouble
function gsl_sf_hypot(x::Cdouble, y::Cdouble)
    ccall( (:gsl_sf_hypot, :libgsl), Cdouble, (Cdouble, Cdouble), x, y )
end


# These routines compute the hypotenuse function  \sqrt{x^2 + y^2} avoiding
# overflow and underflow.
# 
#   Returns: Cint
function gsl_sf_hypot_e(x::Cdouble, y::Cdouble)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_hypot_e, :libgsl), Cint, (Cdouble, Cdouble,
        Ptr{gsl_sf_result}), x, y, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)
end


# These routines compute \sinc(x) = \sin(\pi x) / (\pi x) for any value of x.
# 
#   Returns: Cdouble
function gsl_sf_sinc(x::Cdouble)
    ccall( (:gsl_sf_sinc, :libgsl), Cdouble, (Cdouble, ), x )
end


# These routines compute \sinc(x) = \sin(\pi x) / (\pi x) for any value of x.
# 
#   Returns: Cint
function gsl_sf_sinc_e(x::Cdouble)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_sinc_e, :libgsl), Cint, (Cdouble,
        Ptr{gsl_sf_result}), x, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)
end
