#include <stdio.h>
#include <stdlib.h>


int main(int argc, char** argv) {
	FILE* in = fopen(argv[1], "a+");
	int sz = 1800000;
	int val;	
	for (int i = 0; i < sz; i++) {
		fscanf(in, "%i", &val);
		int res = val;
		res *= 2;
		fprintf(in, "%i\n", res);
		//fflush(in);
	}
	fclose(in);
	//fclose(out);
	return 0;
}
