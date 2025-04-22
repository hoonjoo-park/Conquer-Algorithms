int arraySign(int* nums, int numsSize) {
    int negativeCount = 0;

    // * 정수의 연산 범위를 초과하는 경우 오버플로우가 발생할 수 있음
    // * 따라서, 굳이 곱셈을 모두 하지 않고 음수의 개수만 카운트 후 판별
    for (int i = 0; i < numsSize; i++) {
        // * 0이 하나라도 있으면 모든 곱은 0
        if (nums[i] == 0) {
            return 0;
        }

        // * 음수의 개수를 카운트
        if (nums[i] < 0) {
            negativeCount++;
        }
    }

    // * 음수의 개수가 짝수면 1, 홀수면 -1
    return negativeCount % 2 == 0 ? 1 : -1;
}