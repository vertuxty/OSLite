#include "stdio.h"
float ch(float x) {
//	printf("%f\n", x);
        int N = 600000000;
        float ans = 1;
        float prev = 1;
        for (int i = 1; i < N; i++) {
//		printf("IN");
                prev *= (x * x / (2*i - 1) / (2*i));
//		printf("%f \n", prev);                
		ans += prev;
        }
//	printf("Ans between: %f \n", ans);
	return ans;
}


int main(int argc, char** argv) {
	//printf("HEY!");
//	printf("%s", argv[1]);
        float x = atoi(argv[1]);
        float ans = ch(x);
//	printf("Answer: %f", ans);        
	return 0;
}


