import 'dart:math';

import 'package:flutter/material.dart';
import 'package:new_project/common/message.dart';

class Level2 {

  static Message message = Message();

  static int findSecondLargest(List<int> numbers, BuildContext context) {
    if (numbers.length < 2) {
      message.showErrorMessage(context, 'List must contain at least two numbers');
      return -1;
    }
    int largest = numbers[0];
    int secondLargest = numbers[0];
    for (int i = 1; i < numbers.length; i++) {
      if (numbers[i] > largest) {
        secondLargest = largest;
        largest = numbers[i];
      } else if (numbers[i] > secondLargest && numbers[i] != largest) {
        secondLargest = numbers[i];
      }
    }
    return secondLargest;
  }

  static String findLongestWord(List<String> words) {
    String longestWord = '';
    for (String word in words) {
      if (word.length > longestWord.length) {
        longestWord = word;
      }
    }
    return longestWord;
  }

  static String longestCommonSubsequence(String str1, String str2) {
    int m = str1.length;
    int n = str2.length;
    List<List<int>> dp = List.generate(m + 1, (i) => List.filled(n + 1, 0));
    for (int i = 1; i <= m; i++) {
      for (int j = 1; j <= n; j++) {
        if (str1[i - 1] == str2[j - 1]) {
          dp[i][j] = dp[i - 1][j - 1] + 1;
        } else {
          dp[i][j] = max(dp[i - 1][j], dp[i][j - 1]);
        }
      }
    }
    String lcs = '';
    int i = m, j = n;
    while (i > 0 && j > 0) {
      if (str1[i - 1] == str2[j - 1]) {
        lcs = str1[i - 1] + lcs;
        i--;
        j--;
      } else if (dp[i - 1][j] > dp[i][j - 1]) {
        i--;
      } else {
        j--;
      }
    }
    return lcs;
  }

  static int sumOfDivisibleNumbers(List<int> numbers) {
    int sum = 0;
    for (int number in numbers) {
      if (isDivisibleBy3And5(number)) {
        sum += number;
      }
    }
    return sum;
  }

  static bool isDivisibleBy3And5(int number) {
    return number % 3 == 0 && number % 5 == 0;
  }

  static int maxSum(List<int> nums) {
    int maxSum = nums[0];
    int currentSum = nums[0];

    for (int i = 1; i < nums.length; i++) {
      currentSum =
          (currentSum + nums[i] > nums[i]) ? currentSum + nums[i] : nums[i];
      maxSum = (currentSum > maxSum) ? currentSum : maxSum;
    }
    return maxSum;
  }
}
