#include <stdio.h>
#include <string.h>
#include <stdlib.h>

//long arr_index = 0;
//long exec_count = 0;

void completeAnagrams(char* start, char* end) //char** arr, int arg_len)
{
	int len_end = strlen(end);
	int len_start = strlen(start);
	if (len_end >= 1)
	{
		for (int i = 1; i < len_end; i++)
		{
			char* new_start = malloc(len_start + 1);
			strcpy(new_start, start);
			strncat(new_start, end + i-1, 1);
/*
			char* first_end = malloc(i);
			strncpy(first_end, end, i-1);
			char* second_end = malloc(len_end-i);
			strncpy(second_end, end+i, len_end-i);
*/
			//printf("%s\n", first_end);
			char* new_end = malloc(len_end);
			strncat(new_end, end, i-1);
			strncat(new_end, end, len_end-i);/*
			free(first_end);
			free(second_end);*/
			exec_count++;
			//printf("%d\n", exec_count);

			printf("%s\n", new_end);
			completeAnagrams(new_start, new_end)//, arr, arg_len);
			free(new_start);
			free(new_end);
		}
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
	completeAnagrams("", "word")//, anagrams, arg_len);
	return 0;
}
