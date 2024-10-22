#include <iostream>
#include <random>
#include <cstdlib>

int main()
{
    //Task 1: create a random number between 2 and 3

    //Task 2: create a random number between 2 and 3 using C++11 random library

    /////////////////////Approximate PI////////////////////////

    //Task 3: Create a variable to store the trials and one to create the hits.

    double hit{0};
    double trials{0};

    for(int i{0}; i < 10000; ++i){
        double x{(std::rand() / (RAND_MAX + 1.0)) - 1};
        double y{(std::rand() / (RAND_MAX + 1.0)) - 1};
        if( x*x + y*y <1){
            hit++;
        }
        trials++;
        
    }

    double pi = 4*trials/hit;
    printf("%f",pi);
    //Task 4: Randomly generate points in the square from -1 to 1.
    //        If the point is inside the circle, increment the hits.
    //        Compute the ratio of hits to trials and multiply by 4 to get an approximation of PI.

    return 0;
}