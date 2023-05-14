#include "select.h"
#include "main.h"

int selectCategory()
{
	printf("Please select a category below by typing the number:\n");
	printCategories();
	int num_entered = -2;
	while(num_entered < -1 || num_entered > SELECTION_MAX)
	{
		printf("Select category (#): ");
		scanf("%d",&num_entered);
		if(num_entered < -1 || num_entered > SELECTION_MAX)
		{
			printf("That number (%d) is not a valid selection!\n",num_entered);
		}
	}
	return num_entered;
}

void printCategories()
{
	printf("A\tB\tC\nD\tE\tF\nG\tH\tI\n");
}