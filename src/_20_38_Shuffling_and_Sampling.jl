#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
################################
# 20.38 Shuffling and Sampling #
################################
export gsl_ran_shuffle, gsl_ran_choose, gsl_ran_sample






# This function randomly shuffles the order of n objects, each of size size,
# stored in the array base[0..n-1].  The output of the random number generator
# r is used to produce the permutation.  The algorithm generates all possible
# n!  permutations with equal probability, assuming a perfect source of random
# numbers.          The following code shows how to shuffle the numbers from 0
# to 51,                 int a[52];                      for (i = 0; i < 52;
# i++)             {               a[i] = i;             }
# gsl_ran_shuffle (r, a, 52, sizeof (int));
# 
#   Returns: Void
#XXX Unknown input type r::Ptr{gsl_rng}
#XXX Coerced type for r::Ptr{Void}
function gsl_ran_shuffle{gsl_int<:Integer}(r::Ptr{Void}, base::Ptr{Void}, n::gsl_int, size::gsl_int)
    ccall( (:gsl_ran_shuffle, :libgsl), Void, (Ptr{Void}, Ptr{Void},
        Csize_t, Csize_t), r, base, n, size )
end


# This function fills the array dest[k] with k objects taken randomly from the
# n elements of the array src[0..n-1].  The objects are each of size size.  The
# output of the random number generator r is used to make the selection.  The
# algorithm ensures all possible samples are equally likely, assuming a perfect
# source of randomness.          The objects are sampled without replacement,
# thus each object can only appear once in dest[k].  It is required that k be
# less than or equal to n.  The objects in dest will be in the same relative
# order as those in src.  You will need to call gsl_ran_shuffle(r, dest, n,
# size) if you want to randomize the order.          The following code shows
# how to select a random sample of three unique numbers from the set 0 to 99,
# double a[3], b[100];                      for (i = 0; i < 100; i++)
# {               b[i] = (double) i;             }
# gsl_ran_choose (r, a, 3, b, 100, sizeof (double));
# 
#   Returns: Cint
#XXX Unknown input type r::Ptr{gsl_rng}
#XXX Coerced type for r::Ptr{Void}
function gsl_ran_choose{gsl_int<:Integer}(r::Ptr{Void}, dest::Ptr{Void}, k::gsl_int, src::Ptr{Void}, n::gsl_int, size::gsl_int)
    gsl_errno = ccall( (:gsl_ran_choose, :libgsl), Cint, (Ptr{Void},
        Ptr{Void}, Csize_t, Ptr{Void}, Csize_t, Csize_t), r, dest, k, src, n,
        size )
    if gsl_errno!= 0 throw(GSL_ERROR(gsl_errno)) end
end


# This function is like gsl_ran_choose but samples k items from the original
# array of n items src with replacement, so the same object can appear more
# than once in the output sequence dest.  There is no requirement that k be
# less than n in this case.
# 
#   Returns: Void
#XXX Unknown input type r::Ptr{gsl_rng}
#XXX Coerced type for r::Ptr{Void}
function gsl_ran_sample{gsl_int<:Integer}(r::Ptr{Void}, dest::Ptr{Void}, k::gsl_int, src::Ptr{Void}, n::gsl_int, size::gsl_int)
    ccall( (:gsl_ran_sample, :libgsl), Void, (Ptr{Void}, Ptr{Void},
        Csize_t, Ptr{Void}, Csize_t, Csize_t), r, dest, k, src, n, size )
end
