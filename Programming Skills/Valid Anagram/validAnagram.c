bool isAnagram(char* s, char* t) {
    if (strlen(s) != strlen(t)) {
        return false;
    }

    int counts[26] = {0};

    for (int i = 0; s[i] != '\0'; i++) {
        counts[s[i] - 'a']++;
        counts[t[i] - 'a']--;
    }

    for (int k = 0; k < 26; k++) {
        if (counts[k] != 0) {
            return false;
        }
    }

    return true;
}