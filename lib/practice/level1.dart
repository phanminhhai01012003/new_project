import 'dart:math';

class Level1 {
  static int sumCalulator(int a, int b) => a + b;
  static int stringLength(String str) => str.length;
  static int square(int number) => pow(number, 2).toInt();
  static int largestNumber(List<int> numbers) {
    if (numbers.isEmpty) {
      throw ArgumentError('The list cannot be empty');
    }
    int largestNumber = numbers[0];
    for (int number in numbers) {
      if (number > largestNumber) {
        largestNumber = number;
      }
    }
    return largestNumber;
  }

  static String shortestString(List<String> strings) {
    String shortest = strings[0];
    for (String str in strings) {
      if (str.length < shortest.length) {
        shortest = str;
      }
    }
    return shortest;
  }

  static List<int> sortNumber(List<int> numbers) {
    List<int> sortedNumbers = List.from(numbers);
    sortedNumbers.sort();
    return sortedNumbers;
  }

  static List<String> sortString(List<String> strings) {
    List<String> sortedStrings = List.from(strings);
    sortedStrings.sort();
    return sortedStrings;
  }

  static double median(List<int> numbers) {
    List<int> sortedNumbers = List.from(numbers);
    sortedNumbers.sort();
    int length = sortedNumbers.length;
    if (length % 2 == 0) {
      return (sortedNumbers[length ~/ 2 - 1] + sortedNumbers[length ~/ 2]) /
          2.0;
    } else {
      return sortedNumbers[length ~/ 2].toDouble();
    }
  }

  static int countWords(String str) {
    List<String> words = str.split(RegExp(r'\s+'));
    return words.length;
  }

  static int countWordsWithA(List<String> words) {
    int count = 0;
    for (String word in words) {
      if (word.contains('a')) {
        count++;
      }
    }
    return count;
  }
}
