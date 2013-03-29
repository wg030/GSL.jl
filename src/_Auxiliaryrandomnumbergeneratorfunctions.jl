#!/usr/bin/env julia
#GSL Julia wrapper
#(c) 2013 Jiahao Chen <jiahao@mit.edu>
####################################################
# 18.5 Auxiliary random number generator functions #
####################################################
export gsl_rng_name, gsl_rng_max, gsl_rng_min, gsl_rng_state, gsl_rng_size,
       gsl_rng_types_setup








# This function returns a pointer to the name of the generator.  For example,
# printf ("r is a '%s' generator\n",                   gsl_rng_name (r));
# would print something like r is a 'taus' generator.
# 
#   Returns: Ptr{Cchar}
#XXX Unknown input type r::Ptr{gsl_rng}
#XXX Coerced type for r::Ptr{Void}
function gsl_rng_name (r::Ptr{Void})
    ccall( (:gsl_rng_name, "libgsl"), Ptr{Cchar}, (Ptr{Void}, ), r )
end


# gsl_rng_max returns the largest value that gsl_rng_get can return.
# 
#   Returns: Culong
#XXX Unknown input type r::Ptr{gsl_rng}
#XXX Coerced type for r::Ptr{Void}
function gsl_rng_max (r::Ptr{Void})
    ccall( (:gsl_rng_max, "libgsl"), Culong, (Ptr{Void}, ), r )
end


# gsl_rng_min returns the smallest value that gsl_rng_get can return.  Usually
# this value is zero.  There are some generators with algorithms that cannot
# return zero, and for these generators the minimum value is 1.
# 
#   Returns: Culong
#XXX Unknown input type r::Ptr{gsl_rng}
#XXX Coerced type for r::Ptr{Void}
function gsl_rng_min (r::Ptr{Void})
    ccall( (:gsl_rng_min, "libgsl"), Culong, (Ptr{Void}, ), r )
end


# These functions return a pointer to the state of generator r and its size.
# You can use this information to access the state directly.  For example, the
# following code will write the state of a generator to a stream,
# void * state = gsl_rng_state (r);           size_t n = gsl_rng_size (r);
# fwrite (state, n, 1, stream);
# 
#   Returns: Ptr{Void}
#XXX Unknown input type r::Ptr{gsl_rng}
#XXX Coerced type for r::Ptr{Void}
function gsl_rng_state (r::Ptr{Void})
    ccall( (:gsl_rng_state, "libgsl"), Ptr{Void}, (Ptr{Void}, ), r )
end


# These functions return a pointer to the state of generator r and its size.
# You can use this information to access the state directly.  For example, the
# following code will write the state of a generator to a stream,
# void * state = gsl_rng_state (r);           size_t n = gsl_rng_size (r);
# fwrite (state, n, 1, stream);
# 
#   Returns: Csize_t
#XXX Unknown input type r::Ptr{gsl_rng}
#XXX Coerced type for r::Ptr{Void}
function gsl_rng_size (r::Ptr{Void})
    ccall( (:gsl_rng_size, "libgsl"), Csize_t, (Ptr{Void}, ), r )
end


# This function returns a pointer to an array of all the available generator
# types, terminated by a null pointer. The function should be called once at
# the start of the program, if needed.  The following code fragment shows how
# to iterate over the array of generator types to print the names of the
# available algorithms,                 const gsl_rng_type **t, **t0;
# t0 = gsl_rng_types_setup ();                      printf ("Available
# generators:\n");                      for (t = t0; *t != 0; t++)
# {               printf ("%s\n", (*t)->name);             }
# 
#   Returns: Ptr{Ptr{Void}}
#XXX Unknown output type Ptr{Ptr{gsl_rng_type}}
#XXX Coerced type for output Ptr{Ptr{Void}}
function gsl_rng_types_setup ()
    ccall( (:gsl_rng_types_setup, "libgsl"), Ptr{Ptr{Void}}, () )
end
