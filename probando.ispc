
#include "params.h"

#include "probando_ispc.h"

#include <assert.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

//  = -logf(rand() / (float)RAND_MAX); 
export void imprimiralgo() {
    RNGState rngstate;
    seed_rng(&rngstate, programIndex);
    int r;
    print(" %d",-logf(rdrand(&r)/ (float)2147483647);
 );
    print("\n soy r--> %d \n",r);
    // float theta = sqrt(frandom(&rngstate));
        print(" yo soy programIndex=%d",programIndex);
        // print(" yo soy programIndex=%f",theta);
}
    

    
    
    
    
    

    
    