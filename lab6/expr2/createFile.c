#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv) {
	char* name = argv[1];
	FILE* file = fopen(name, "w");
	int N = 1800000;
	for (int i = 0; i < N; i++) {
		fprintf(file, "%i\n", 1);
	}		
	fclose(file);
}
