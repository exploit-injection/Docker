#include <iostream>
#include <ctime>
#include <cstdlib>

using namespace std;


int main()
 {
	int size;
	// генерация случайного числа
        srand(time(NULL));
	size = rand() % 21;
	cout << "size = " << size << endl;
	if (size == 0)
	{
		cout << "В массиве нет значений" << endl;
	}
	else {

	int *arr = new int[size];
	int middle = size / 2 + (size & 1);

        for (int i = 0; i < middle; ++i ) {

		arr[i] = arr[size - i - 1] = i + 1;
	}

        for (int i = 0; i < size; ++i) {

		cout << arr[i] << " ";
	}

	cout << endl;

	delete [] arr;
	}
	return 0;
 }
