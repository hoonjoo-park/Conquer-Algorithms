void moveZeroes(int* nums, int numsSize) {
    int i = 0;
    int nonZeroCount = 0;

    // nonZeroCount를 통해, 0이 아닌 숫자들을 세고, 해당 숫자들을 차례대로 nums에 쌓는다.
    while (i < numsSize) {
        if (nums[i] != 0) {
            nums[nonZeroCount] = nums[i];
            nonZeroCount++;
        }

        i++;
    }

    // nonZeroCount를 통해, 지금까지 쌓은 0이 아닌 숫자들 뒤를 0으로 채워 넣는다.
    while (nonZeroCount < numsSize) {
        nums[nonZeroCount] = 0;
        nonZeroCount++;
    }
}