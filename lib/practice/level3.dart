import 'dart:math';

import 'package:flutter/material.dart';
import 'package:new_project/common/message.dart';

class Level3 {

  static Message message = Message();

  static int findSecondSmallest(List<int> numbers, BuildContext context) {
    if (numbers.length < 2) {
      message.showErrorMessage(context, 'List must contain at least two numbers');
      return -1;
    }
    int smallest = numbers[0];
    int secondSmallest = numbers[0];
    for (int i = 1; i < numbers.length; i++) {
      if (numbers[i] < smallest) {
        secondSmallest = smallest;
        smallest = numbers[i];
      } else if (numbers[i] < secondSmallest && numbers[i] != smallest) {
        secondSmallest = numbers[i];
      }
    }
    return secondSmallest;
  }

  static int findMaxDifference(List<int> numbers, BuildContext context) {
    if (numbers.length < 2) {
      message.showErrorMessage(context, 'List must contain at least two numbers');
      return -1;
    }
    int max = numbers[0];
    int min = numbers[0];
    for (int i = 1; i < numbers.length; i++) {
      if (numbers[i] > max) {
        max = numbers[i];
      } else if (numbers[i] < min) {
        min = numbers[i];
      }
    }
    return max - min;
  }

  static List<int> findLongestIncreasingSubsequence(List<int> numbers) {
    if (numbers.isEmpty) return [];
    List<int> lis = List.filled(numbers.length, 1);
    for (int i = 1; i < numbers.length; i++) {
      for (int j = 0; j < i; j++) {
        if (numbers[i] > numbers[j] && lis[i] < lis[j] + 1) {
          lis[i] = lis[j] + 1;
        }
      }
    }
    int maxLength = lis.reduce((a, b) => a > b ? a : b);
    List<int> longestSubsequence = [];
    for (int i = numbers.length - 1; i >= 0; i--) {
      if (lis[i] == maxLength) {
        longestSubsequence.add(numbers[i]);
        maxLength--;
      }
    }
    return longestSubsequence.reversed.toList();
  }

  static int overlap(String a, String b) {
    Set<String> setA = a.split('').toSet();
    Set<String> setB = b.split('').toSet();
    return setA.intersection(setB).length;
  }

  static List<String> findLargestOverlap(List<String> strings, BuildContext context) {
    if (strings.length < 2) {
      message.showErrorMessage(context, 'List must contain at least two strings');
      return [];
    }
    String str1 = strings[0];
    String str2 = strings[1];
    int maxOverlap = overlap(str1, str2);
    for (int i = 0; i < strings.length; i++) {
      for (int j = i + 1; j < strings.length; j++) {
        int currentOverlap = overlap(strings[i], strings[j]);
        if (currentOverlap > maxOverlap) {
          maxOverlap = currentOverlap;
          str1 = strings[i];
          str2 = strings[j];
        }
      }
    }
    return [str1, str2];
  }

  static int findSmallestPositiveInteger(List<int> numbers) {
    numbers.sort();
    int smallestPositive = 1;
    for (int number in numbers) {
      if (number > smallestPositive) {
        break;
      }
      smallestPositive += number;
    }
    return smallestPositive;
  }

  static double findMedian(List<int> numbers) {
    numbers.sort();
    int n = numbers.length;
    if (n % 2 == 0) {
      return (numbers[n ~/ 2 - 1] + numbers[n ~/ 2]) / 2.0;
    } else {
      return numbers[n ~/ 2].toDouble();
    }
  }

  static int longestPalindromeLength(String s) {
    Map<String, int> charCount = {};
    for (int i = 0; i < s.length; i++) {
      String char = s[i].toLowerCase();
      if (char != ' ') {
        charCount[char] = (charCount[char] ?? 0) + 1;
      }
    }
    int length = 0;
    bool hasOddCount = false;
    charCount.forEach((key, value) {
      if (value % 2 == 0) {
        length += value;
      } else {
        length += value - 1;
        hasOddCount = true;
      }
    });
    return hasOddCount ? length + 1 : length;
  }

  static int countPairs(List<int> numbers, int target) {
    Set<int> seen = {};
    Set<String> pairs = {};
    for (int number in numbers) {
      int complement = target - number;
      if (seen.contains(complement)) {
        String pair =
            '${number < complement ? number : complement}, ${number < complement ? complement : number}';
        pairs.add(pair);
      }
      seen.add(number);
    }
    return pairs.length;
  }

  static int maxSumNonAdjacent(List<int> arr) {
    if (arr.isEmpty) return 0;
    if (arr.length == 1) return arr[0];
    int prevPrev = 0;
    int prev = arr[0];
    for (int i = 1; i < arr.length; i++) {
      int current = max(prev, prevPrev + arr[i]);
      prevPrev = prev;
      prev = current;
    }
    return prev;
  }

  static List<String> sortByDistinctChars(List<String> arr) {
    arr.sort((a, b) {
      int distinctA = a.split('').toSet().length;
      int distinctB = b.split('').toSet().length;
      if (distinctA == distinctB) {
        return a.length.compareTo(b.length);
      }
      return distinctA.compareTo(distinctB);
    });
    return arr;
  }
}
