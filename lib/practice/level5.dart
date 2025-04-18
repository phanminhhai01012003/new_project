import 'dart:io';

class Level5 {

  static List<int> reverses(List<int> arr) {
    List<int> reversed = [];
    for (var element in arr) {
      reversed.insert(0, element);
    }
    return reversed;
  }

  static List<List<String>> chunk(List<String> arr, int size) {
    List<List<String>> chunks = [];
    for (int i = 0; i < arr.length; i += size) {
      chunks.add(arr.sublist(i, i + size > arr.length ? arr.length : i + size));
    }
    return chunks;
  }

  static List<int> uniq(List<int> arr) {
    List<int> unique = [];
    for (var element in arr) {
      if (!unique.contains(element)) {
        unique.add(element);
      }
    }
    return unique;
  }

  static List<Map<String, int>> uniqArrayObject(List<Map<String, int>> arr) {
    List<Map<String, int>> result = [];
    for (var obj in arr) {
      if (!result.any((e) => _areMapsEqual(e, obj))) {
        result.add(obj);
      }
    }
    return result;
  }

  static bool _areMapsEqual(Map<String, int> m1, Map<String, int> m2) {
    if (m1.length != m2.length) return false;
    for (var key in m1.keys) {
      if (!m2.containsKey(key) || m1[key] != m2[key]) {
        return false;
      }
    }
    return true;
  }

  static Map<String, List<Map<String, dynamic>>> groupBy(
      List<Map<String, dynamic>> arr, String field) {
    Map<String, List<Map<String, dynamic>>> grouped = {};
    for (var obj in arr) {
      String key = obj[field].toString();
      if (!grouped.containsKey(key)) {
        grouped[key] = [];
      }
      grouped[key]!.add(obj);
    }
    return grouped;
  }

  static trimAll(String str) {
    str = str.trim();
    str = str.replaceAll(RegExp(r'\s+'), ' ');
    return str;
  }

  static List<Map<String, dynamic>> mapKey(
      List<String> keys, List<Map<String, dynamic>> arr) {
    return arr.map((obj) {
      Map<String, dynamic> newObj = {};
      for (var key in keys) {
        if (obj.containsKey(key)) {
          newObj[key] = obj[key];
        }
      }
      return newObj;
    }).toList();
  }

  static List<Map<String, dynamic>> switchOrder(
      int id, int newOrder, List<Map<String, dynamic>> arr) {
    Map<String, dynamic>? objToMove =
        arr.firstWhere((obj) => obj['id'] == id, orElse: () => {});
    arr.remove(objToMove);
    objToMove['order'] = newOrder;
    for (var obj in arr) {
      if (obj['order'] >= newOrder) {
        obj['order']++;
      }
    }
    arr.insert(newOrder, objToMove);
    for (int i = 0; i < arr.length; i++) {
      arr[i]['order'] = i;
    }
    return arr;
  }

  static Map<String, int> sumAll(List<Map<String, dynamic>> arr) {
    Map<String, int> result = {};
    for (var obj in arr) {
      obj.forEach((key, value) {
        if (result.containsKey(key)) {
          result[key] = result[key]! + (value is int ? value : 0);
        } else {
          result[key] = value is int ? value : 0;
        }
      });
    }
    return result;
  }

  static void templateString(String templateFilePath, String outputFilePath,
      Map<String, String> params) {
    String templateContent = File(templateFilePath).readAsStringSync();
    for (var key in params.keys) {
      templateContent = templateContent.replaceAll('${key}', params[key]!);
    }
    File(outputFilePath).writeAsStringSync(templateContent);
  }
}
