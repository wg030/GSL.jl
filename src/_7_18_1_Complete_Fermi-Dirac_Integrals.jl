#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
#########################################
# 7.18.1 Complete Fermi-Dirac Integrals #
#########################################
export gsl_sf_fermi_dirac_m1, gsl_sf_fermi_dirac_m1_e, gsl_sf_fermi_dirac_0,
       gsl_sf_fermi_dirac_0_e, gsl_sf_fermi_dirac_1, gsl_sf_fermi_dirac_1_e,
       gsl_sf_fermi_dirac_2, gsl_sf_fermi_dirac_2_e, gsl_sf_fermi_dirac_int,
       gsl_sf_fermi_dirac_int_e, gsl_sf_fermi_dirac_mhalf,
       gsl_sf_fermi_dirac_mhalf_e, gsl_sf_fermi_dirac_half,
       gsl_sf_fermi_dirac_half_e, gsl_sf_fermi_dirac_3half,
       gsl_sf_fermi_dirac_3half_e




# These routines compute the complete Fermi-Dirac integral with an index of -1.
# This integral is given by  F_{-1}(x) = e^x / (1 + e^x).
# 
#   Returns: Cdouble
function gsl_sf_fermi_dirac_m1(x::Cdouble)
    ccall( (:gsl_sf_fermi_dirac_m1, :libgsl), Cdouble, (Cdouble, ), x )
end


# These routines compute the complete Fermi-Dirac integral with an index of -1.
# This integral is given by  F_{-1}(x) = e^x / (1 + e^x).
# 
#   Returns: Cint
function gsl_sf_fermi_dirac_m1_e(x::Cdouble)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_fermi_dirac_m1_e, :libgsl), Cint, (Cdouble,
        Ptr{gsl_sf_result}), x, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)
end


# These routines compute the complete Fermi-Dirac integral with an index of 0.
# This integral is given by F_0(x) = \ln(1 + e^x).
# 
#   Returns: Cdouble
function gsl_sf_fermi_dirac_0(x::Cdouble)
    ccall( (:gsl_sf_fermi_dirac_0, :libgsl), Cdouble, (Cdouble, ), x )
end


# These routines compute the complete Fermi-Dirac integral with an index of 0.
# This integral is given by F_0(x) = \ln(1 + e^x).
# 
#   Returns: Cint
function gsl_sf_fermi_dirac_0_e(x::Cdouble)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_fermi_dirac_0_e, :libgsl), Cint, (Cdouble,
        Ptr{gsl_sf_result}), x, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)
end


# These routines compute the complete Fermi-Dirac integral with an index of 1,
# F_1(x) = \int_0^\infty dt (t /(\exp(t-x)+1)).
# 
#   Returns: Cdouble
function gsl_sf_fermi_dirac_1(x::Cdouble)
    ccall( (:gsl_sf_fermi_dirac_1, :libgsl), Cdouble, (Cdouble, ), x )
end


# These routines compute the complete Fermi-Dirac integral with an index of 1,
# F_1(x) = \int_0^\infty dt (t /(\exp(t-x)+1)).
# 
#   Returns: Cint
function gsl_sf_fermi_dirac_1_e(x::Cdouble)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_fermi_dirac_1_e, :libgsl), Cint, (Cdouble,
        Ptr{gsl_sf_result}), x, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)
end


# These routines compute the complete Fermi-Dirac integral with an index of 2,
# F_2(x) = (1/2) \int_0^\infty dt (t^2 /(\exp(t-x)+1)).
# 
#   Returns: Cdouble
function gsl_sf_fermi_dirac_2(x::Cdouble)
    ccall( (:gsl_sf_fermi_dirac_2, :libgsl), Cdouble, (Cdouble, ), x )
end


# These routines compute the complete Fermi-Dirac integral with an index of 2,
# F_2(x) = (1/2) \int_0^\infty dt (t^2 /(\exp(t-x)+1)).
# 
#   Returns: Cint
function gsl_sf_fermi_dirac_2_e(x::Cdouble)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_fermi_dirac_2_e, :libgsl), Cint, (Cdouble,
        Ptr{gsl_sf_result}), x, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)
end


# These routines compute the complete Fermi-Dirac integral with an integer
# index of j, F_j(x) = (1/\Gamma(j+1)) \int_0^\infty dt (t^j /(\exp(t-x)+1)).
# 
#   Returns: Cdouble
function gsl_sf_fermi_dirac_int{gsl_int<:Integer}(j::gsl_int, x::Cdouble)
    ccall( (:gsl_sf_fermi_dirac_int, :libgsl), Cdouble, (Cint, Cdouble), j,
        x )
end


# These routines compute the complete Fermi-Dirac integral with an integer
# index of j, F_j(x) = (1/\Gamma(j+1)) \int_0^\infty dt (t^j /(\exp(t-x)+1)).
# 
#   Returns: Cint
function gsl_sf_fermi_dirac_int_e{gsl_int<:Integer}(j::gsl_int, x::Cdouble)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_fermi_dirac_int_e, :libgsl), Cint, (Cint,
        Cdouble, Ptr{gsl_sf_result}), j, x, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)
end


# These routines compute the complete Fermi-Dirac integral  F_{-1/2}(x).
# 
#   Returns: Cdouble
function gsl_sf_fermi_dirac_mhalf(x::Cdouble)
    ccall( (:gsl_sf_fermi_dirac_mhalf, :libgsl), Cdouble, (Cdouble, ), x )
end


# These routines compute the complete Fermi-Dirac integral  F_{-1/2}(x).
# 
#   Returns: Cint
function gsl_sf_fermi_dirac_mhalf_e(x::Cdouble)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_fermi_dirac_mhalf_e, :libgsl), Cint,
        (Cdouble, Ptr{gsl_sf_result}), x, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)
end


# These routines compute the complete Fermi-Dirac integral  F_{1/2}(x).
# 
#   Returns: Cdouble
function gsl_sf_fermi_dirac_half(x::Cdouble)
    ccall( (:gsl_sf_fermi_dirac_half, :libgsl), Cdouble, (Cdouble, ), x )
end


# These routines compute the complete Fermi-Dirac integral  F_{1/2}(x).
# 
#   Returns: Cint
function gsl_sf_fermi_dirac_half_e(x::Cdouble)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_fermi_dirac_half_e, :libgsl), Cint,
        (Cdouble, Ptr{gsl_sf_result}), x, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)
end


# These routines compute the complete Fermi-Dirac integral  F_{3/2}(x).
# 
#   Returns: Cdouble
function gsl_sf_fermi_dirac_3half(x::Cdouble)
    ccall( (:gsl_sf_fermi_dirac_3half, :libgsl), Cdouble, (Cdouble, ), x )
end


# These routines compute the complete Fermi-Dirac integral  F_{3/2}(x).
# 
#   Returns: Cint
function gsl_sf_fermi_dirac_3half_e(x::Cdouble)
    result = convert(Ptr{gsl_sf_result}, Array(gsl_sf_result, 1))
    gsl_errno = ccall( (:gsl_sf_fermi_dirac_3half_e, :libgsl), Cint,
        (Cdouble, Ptr{gsl_sf_result}), x, result )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(result)
end
