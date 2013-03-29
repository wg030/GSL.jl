#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
#################################
# 20.11 The Landau Distribution #
#################################
export gsl_ran_landau, gsl_ran_landau_pdf






# This function returns a random variate from the Landau distribution.  The
# probability distribution for Landau random variates is defined analytically
# by the complex integral,                 p(x) = (1/(2 \pi i))
# \int_{c-i\infty}^{c+i\infty} ds exp(s log(s) + x s)  For numerical purposes
# it is more convenient to use the following equivalent form of the integral,
# p(x) = (1/\pi) \int_0^\infty dt \exp(-t \log(t) - x t) \sin(\pi t).
# 
#   Returns: Cdouble
#XXX Unknown input type r::Ptr{gsl_rng}
#XXX Coerced type for r::Ptr{Void}
function gsl_ran_landau (r::Ptr{Void})
    ccall( (:gsl_ran_landau, "libgsl"), Cdouble, (Ptr{Void}, ), r )
end


# This function computes the probability density p(x) at x for the Landau
# distribution using an approximation to the formula given above.
# 
#   Returns: Cdouble
function gsl_ran_landau_pdf (x::Cdouble)
    ccall( (:gsl_ran_landau_pdf, "libgsl"), Cdouble, (Cdouble, ), x )
end
