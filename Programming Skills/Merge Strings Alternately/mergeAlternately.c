char * mergeAlternately(char * word1, char * word2) {
    int len1 = strlen(word1);
    int len2 = strlen(word2);
    int maxLen = len1 + len2;

    char * answer = (char *)malloc(maxLen + 1);
    
    int i = 0, j = 0, k = 0;

    // while의 조건이 false일 때까지 반복
    while (i < len1 || j < len2) {
        if (i < len1) answer[k++] = word1[i++];
        if (j < len2) answer[k++] = word2[j++];
    }
    answer[k] = '\0';
    
    return answer;
}