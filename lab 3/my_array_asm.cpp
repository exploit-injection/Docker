#include <iostream>
#include <cstdlib>
#include <ctime>

using namespace std;

int main() {
	int size;
	// генерация случайного числа
	srand(time(NULL));
	size = rand() % 21;
	cout << "size = " << size << endl;
	if (size == 0) {
	cout << "В массиве нет значений" << endl;
	}
	else {
		int *arr = new int[size];
		int middle = size / 2 + (size & 1);
		int value = 1;

		for (int i = 0; i < middle; i++) {
		asm(
		"mov %[val], %%ebx\n\t" //из val значение записывается в регистр ebx
		"movl %%ebx, %[arr]\n\t" //затем это значение из ebx записывается в arr (которое соотносится
		// с array[i])
		"movl %%ebx, %[arr2]\n\t" //запись в arr2 которое соотносится с array[n-i-1])
		"addl $1, %[val]\n\t" //увеличиваем %[val] (которое соотносится c value) на 1
		:[arr]"=m"(arr[i]), [arr2]"=m"(arr[size-i-1])//то, что выходит из ассемблерной вставки и с++
		//из arr записывается значение в массив в позицию i, из arr2 записывается значение в массив
		//в позицию [n-1-i]
		:[val]"m"(value) //то, что входит из с++ в ассемблерную вставку
		:"%eax", "%ebx" //регистры, которые используются в ассемблерной вставке
		);
		}
		for (int i = 0; i < size; ++i) {
			cout << arr[i] << " ";
			}
		cout << endl;
		delete[] arr;
	}
		return 0;
}
