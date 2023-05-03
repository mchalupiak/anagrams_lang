#include <stdio.h>
#include <string.h>
#include <stdlib.h>
// #include "linkedlist.c"

//long arr_index = 0;
//long exec_count = 0;

// struct node* head;

void completeAnagrams(char* start, char* end)//, struct node* ll) //char** arr, int arg_len)
{
	int len_end = strlen(end);
	int len_start = strlen(start);
	if (len_end >= 1)
	{
		for (int i = 1; i < len_end; i++)
		{
			char* new_start = malloc(sizeof(char)*(len_start + 2));
			strcpy(new_start, start);
			strncat(new_start, end + i-1, 1);
			// printf("%s\n", new_start);
/*
			char* first_end = malloc(i);
			strncpy(first_end, end, i-1);
			char* second_end = malloc(len_end-i);
			strncpy(second_end, end+i, len_end-i);
*/
			//printf("%s\n", first_end);
			char* new_end = malloc(sizeof(char)*len_end);
			strcpy(new_end, "");
			strncat(new_end, end, i-1);
			//TODO same bytes copied here: find way to fix
			strncat(new_end, end + i, len_end-i);/*
			free(first_end);
			free(second_end);*/
			//printf("%d\n", exec_count);

			// printf("%s\n", new_end);
			// printf("%s %s : input %s %s\n", new_start, new_end, start, end);
			
			completeAnagrams(new_start, new_end);//, arr, arg_len);
			free(new_start);
			free(new_end);
		}
			char* new_start = malloc(sizeof(char)*(len_start + 2));
			strcpy(new_start, start);
			strncat(new_start, end + len_end-1, 1);
			// printf("%s\n", new_start);
			char* new_end = malloc(sizeof(char)*len_end);
			strcpy(new_end, "");
			strncat(new_end, end, len_end-1);
			//TODO same bytes copied here: find way to fix
			// strncat(new_end, end + i, len_end-i);/	}
			// printf("%s %s\n",new_start,new_end);
			completeAnagrams(new_start, new_end);//, arr, arg_len);
			free(new_start);
			free(new_end);
	}
	else
	{
	/*
		char* anagram = malloc(arg_len + 1);
		strcat(anagram + arr_index, start);
		strcat(anagram + arr_index, end);
		strcpy(arr[arr_index], anagram);
		arr_index++;
		*/
//		printf("%s%s\n", start, end);
        //printf("%s\n", start);
	}
}
/*
int factorial(int num)
{
	if (num > 1)
		return factorial(num - 1) * num;
	else
		return 1;
}
*/
int main(int argc, char** argv)
{
/*	int arg_len = strlen("word");
	char anagrams[factorial(arg_len)][arg_len + 1];*/
	// struct node *begin = NULL;
	completeAnagrams("", argv[1]);//, anagrams, arg_len);
	return 0;
}
