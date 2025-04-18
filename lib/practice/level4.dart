class Level4 {
  static int bubbleSortMoves(List<int> arr) {
    int moves = 0;
    for (int i = 0; i < arr.length - 1; i++) {
      for (int j = 0; j < arr.length - i - 1; j++) {
        if (arr[j] > arr[j + 1]) {
          int temp = arr[j];
          arr[j] = arr[j + 1];
          arr[j + 1] = temp;
          moves++;
        }
      }
    }
    return moves;
  }

  static int countDistinctSubsequences(List<int> arr, int target) {
    int n = arr.length;
    List<List<int>> dp =
        List.generate(n + 1, (_) => List.filled(target + 1, 0));
    dp[0][0] = 1; // Base case: one way to make sum 0 with empty subsequence
    for (int i = 1; i <= n; i++) {
      for (int j = 0; j <= target; j++) {
        dp[i][j] = dp[i - 1][j]; // Exclude current element
        if (j >= arr[i - 1]) {
          dp[i][j] += dp[i - 1][j - arr[i - 1]]; // Include current element
        }
      }
    }
    return dp[n][target];
  }

  static int longestSubstring(List<String> arr) {
    if (arr.isEmpty) return 0;
    String first = arr[0];
    int maxLength = 0;
    for (int i = 0; i < first.length; i++) {
      for (int j = i + 1; j <= first.length; j++) {
        String substring = first.substring(i, j);
        bool foundInAll = true;
        for (int k = 1; k < arr.length; k++) {
          if (!arr[k].contains(substring)) {
            foundInAll = false;
            break;
          }
        }
        if (foundInAll) {
          maxLength =
              maxLength > substring.length ? maxLength : substring.length;
        }
      }
    }
    return maxLength;
  }

  static int maxNonConsecutiveSubarraySum(List<int> nums) {
    if (nums.isEmpty) return 0;
    if (nums.length == 1) return nums[0];
    int prevMax = 0; // Maximum sum excluding the previous element
    int currMax = nums[0]; // Maximum sum including the previous element
    for (int i = 1; i < nums.length; i++) {
      int newMax = prevMax + nums[i]; // Include current element
      prevMax = currMax; // Update prevMax to the previous currMax
      currMax = currMax > newMax ? currMax : newMax; // Take the maximum
    }
    return currMax;
  }

  static int longestCommonSubstring(List<String> arr) {
    if (arr.isEmpty) return 0;
    String first = arr[0];
    int maxLength = 0;
    for (int i = 0; i < first.length; i++) {
      for (int j = i + 1; j <= first.length; j++) {
        String substring = first.substring(i, j);
        bool foundInAll = true;
        for (int k = 1; k < arr.length; k++) {
          if (!arr[k].contains(substring)) {
            foundInAll = false;
            break;
          }
        }
        if (foundInAll) {
          maxLength =
              maxLength > substring.length ? maxLength : substring.length;
        }
      }
    }
    return maxLength;
  }

  static int maxProductOfThree(List<int> arr) {
    if (arr.length < 3) return 0; // Not enough elements
    arr.sort();
    int n = arr.length;
    // Maximum product can be either from the three largest or two smallest and one largest
    return arr[n - 1] * arr[n - 2] * arr[n - 3] > arr[0] * arr[1] * arr[n - 1]
        ? arr[n - 1] * arr[n - 2] * arr[n - 3]
        : arr[0] * arr[1] * arr[n - 1];
  }

  static List<String> sortByDistinctWords(List<String> arr) {
    arr.sort((a, b) {
      int distinctA = a.split(' ').toSet().length;
      int distinctB = b.split(' ').toSet().length;
      if (distinctA == distinctB) {
        return b.length.compareTo(a.length);
      }
      return distinctB.compareTo(distinctA);
    });
    return arr;
  }

  static int findSmallestPositiveInteger(List<int> arr) {
    arr.sort();
    int smallestPositive = 1;
    for (int num in arr) {
      if (num >= smallestPositive) {
        if (num > smallestPositive + 1) {
          break;
        }
        smallestPositive += num;
      }
    }
    return smallestPositive;
  }

  static int longestIncreasingSubsequence(List<int> arr) {
    List<int> dp = List.filled(arr.length, 1);
    for (int i = 1; i < arr.length; i++) {
      for (int j = 0; j < i; j++) {
        if (arr[i] > arr[j] && (arr[i] - arr[j]).abs() <= 1) {
          dp[i] = dp[i] > dp[j] + 1 ? dp[i] : dp[j] + 1;
        }
      }
    }
    return dp.reduce((a, b) => a > b ? a : b);
  }

  static int longestOverlap(String str1, String str2, int k) {
    int maxLength = 0;
    for (int i = 0; i <= str1.length - k; i++) {
      for (int j = 0; j <= str2.length - k; j++) {
        if (str1.substring(i, i + k) == str2.substring(j, j + k)) {
          int length = k;
          while (i + length < str1.length &&
              j + length < str2.length &&
              str1[i + length] == str2[j + length]) {
            length++;
          }
          maxLength = maxLength > length ? maxLength : length;
        }
      }
    }
    return maxLength;
  }

  static List<String> findLargestOverlap(List<String> arr, int k) {
    String str1 = '';
    String str2 = '';
    int maxOverlap = 0;
    for (int i = 0; i < arr.length; i++) {
      for (int j = i + 1; j < arr.length; j++) {
        int overlap = longestOverlap(arr[i], arr[j], k);
        if (overlap > maxOverlap) {
          maxOverlap = overlap;
          str1 = arr[i];
          str2 = arr[j];
        }
      }
    }
    return [str1, str2];
  }
}