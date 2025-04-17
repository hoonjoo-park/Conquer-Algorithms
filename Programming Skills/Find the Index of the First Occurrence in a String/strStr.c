int strStr(char* haystack, char* needle) {
    int haystackLen = strlen(haystack);
    int needleLen = strlen(needle);

    for (int i = 0; i <= haystackLen - needleLen; i++) {
        // i ~ needleLen 범위만큼 비교
        // i가 증가하므로 비교 범위도 한칸씩 우측으로 이동
        if (strncmp(haystack + i, needle, needleLen) == 0) {
            return i;
        }
    }

    return -1;
}