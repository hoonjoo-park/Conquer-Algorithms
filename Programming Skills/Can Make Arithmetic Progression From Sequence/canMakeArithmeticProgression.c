int compare(const void* a, const void* b) {
    return (*(int*)a - *(int*)b);
}

bool canMakeArithmeticProgression(int* arr, int arrSize) {
    // 1. qsort를 사용해서 배열을 내림차순으로 정렬
    qsort(arr, arrSize, sizeof(int), compare);

    // 2. 0번 인덱스부터 차례대로 점검하며 한 번이라도 차가 다르면 return false
    int diff = arr[0] - arr[1];

    for (int i = 1; i < arrSize - 1; i++) {
        if (arr[i] - arr[i+1] != diff) {
            return false;
        }
    }

    return true;
}