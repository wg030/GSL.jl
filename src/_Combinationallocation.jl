#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
###############################
# 10.2 Combination allocation #
###############################
export gsl_combination_alloc, gsl_combination_calloc,
       gsl_combination_init_first, gsl_combination_init_last,
       gsl_combination_free, gsl_combination_memcpy


# This function allocates memory for a new combination with parameters n, k.
# The combination is not initialized and its elements are undefined.  Use the
# function gsl_combination_calloc if you want to create a combination which is
# initialized to the lexicographically first combination. A null pointer is
# returned if insufficient memory is available to create the combination.
# 
#   Returns: Ptr{gsl_combination}
function gsl_combination_alloc (n::Csize_t, k::Csize_t)
    ccall( (:gsl_combination_alloc, "libgsl"), Ptr{gsl_combination},
        (Csize_t, Csize_t), n, k )
end


# This function allocates memory for a new combination with parameters n, k and
# initializes it to the lexicographically first combination. A null pointer is
# returned if insufficient memory is available to create the combination.
# 
#   Returns: Ptr{gsl_combination}
function gsl_combination_calloc (n::Csize_t, k::Csize_t)
    ccall( (:gsl_combination_calloc, "libgsl"), Ptr{gsl_combination},
        (Csize_t, Csize_t), n, k )
end


# This function initializes the combination c to the lexicographically first
# combination, i.e.  (0,1,2,...,k-1).
# 
#   Returns: Void
function gsl_combination_init_first (c::Ptr{gsl_combination})
    ccall( (:gsl_combination_init_first, "libgsl"), Void,
        (Ptr{gsl_combination}, ), c )
end


# This function initializes the combination c to the lexicographically last
# combination, i.e.  (n-k,n-k+1,...,n-1).
# 
#   Returns: Void
function gsl_combination_init_last (c::Ptr{gsl_combination})
    ccall( (:gsl_combination_init_last, "libgsl"), Void,
        (Ptr{gsl_combination}, ), c )
end


# This function frees all the memory used by the combination c.
# 
#   Returns: Void
function gsl_combination_free (c::Ptr{gsl_combination})
    ccall( (:gsl_combination_free, "libgsl"), Void, (Ptr{gsl_combination},
        ), c )
end


# This function copies the elements of the combination src into the combination
# dest.  The two combinations must have the same size.
# 
#   Returns: Cint
function gsl_combination_memcpy (dest::Ptr{gsl_combination}, src::Ptr{gsl_combination})
    ccall( (:gsl_combination_memcpy, "libgsl"), Cint,
        (Ptr{gsl_combination}, Ptr{gsl_combination}), dest, src )
end