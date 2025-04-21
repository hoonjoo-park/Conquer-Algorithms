/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int* plusOne(int* digits, int digitsSize, int* returnSize) {
    int i = digitsSize - 1;

    while (i >= 0) {
        // 현재 자리가 9보다 작으면 그냥 1을 더해주고 종료
        if (digits[i] < 9) {
            digits[i] += 1;
            *returnSize = digitsSize;
            return digits;
        }

        // 현재 자리가 9이면 0으로 변경하고 다음 자리로 넘어감
        digits[i] = 0;
        i--;
    }

    // 자릿수가 증가하는 케이스 (ex. 999 -> 1000)
    *returnSize = digitsSize + 1;
    int* answer = (int*)malloc(*returnSize * sizeof(int));
    answer[0] = 1;

    for (int j = 0; j < digitsSize; j++) {
        answer[j + 1] = digits[j];
    }

    return answer;
}