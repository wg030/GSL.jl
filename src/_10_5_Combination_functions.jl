#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
##############################
# 10.5 Combination functions #
##############################
export gsl_combination_next, gsl_combination_prev


# This function advances the combination c to the next combination in
# lexicographic order and returns GSL_SUCCESS.  If no further combinations are
# available it returns GSL_FAILURE and leaves c unmodified.  Starting with the
# first combination and repeatedly applying this function will iterate through
# all possible combinations of a given order.
# 
#   Returns: Cint
function gsl_combination_next(c::Ptr{gsl_combination})
    gsl_errno = ccall( (:gsl_combination_next, :libgsl), Cint,
        (Ptr{gsl_combination}, ), c )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
end


# This function steps backwards from the combination c to the previous
# combination in lexicographic order, returning GSL_SUCCESS.  If no previous
# combination is available it returns GSL_FAILURE and leaves c unmodified.
# 
#   Returns: Cint
function gsl_combination_prev()
    c = convert(Ptr{gsl_combination}, Array(gsl_combination, 1))
    gsl_errno = ccall( (:gsl_combination_prev, :libgsl), Cint,
        (Ptr{gsl_combination}, ), c )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
    return unsafe_ref(c)
end
