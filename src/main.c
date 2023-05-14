#include "main.h"
#include "calculators.h"
#include "select.h"

int main()
{
	printf("Welcome to the Physics Calculator!\n");
	int selected_category;
	int (*category_functions[])() =
	{
		categoryBasic,
		categoryElectric,
		categoryParallelPlate,
		categoryTrigonometry,
		categoryNewtonian,
		categoryCircuits,
		categoryMagnetic,
		categoryEMInduction,
		categoryOptics,
		categoryEMWaves,
		categoryWaveInterference,
		categoryRelativity,
		categoryWaveParticleDuality,
		categoryAtoms,
		categoryNuclear
	};

	while( (selected_category = selectCategory()) >= 0 )
	{
		// to call: (*a[i])();
		(*category_functions[selected_category])();
	}

	return EXIT_SUCCESS;
}