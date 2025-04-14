char findTheDifference(char* s, char* t) {
    int counts[26] = {0};
    int answer = 0;

    for (int i = 0; s[i] != '\0'; i++) {
        counts[s[i] - 'a']++;
    }
    
    for (int j = 0; t[j] != '\0'; j++) {
        counts[t[j] - 'a']--;

        if (counts[t[j] - 'a'] < 0) {
            answer = t[j];
            break;
        }
    }

    return answer;
}