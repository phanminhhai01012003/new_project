import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_project/common/message.dart';
import 'package:new_project/practice/level5.dart';

class Exercise42 extends StatefulWidget {
  const Exercise42({super.key});

  @override
  State<Exercise42> createState() => _Exercise42State();
}

class _Exercise42State extends State<Exercise42> {
  final mapController = TextEditingController();
  final listController = TextEditingController();
  Message message = Message();
  List<Map<String, dynamic>> mapKey = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Exercise 42',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "MapKey: Given an array of keys, into an array of objects, write a function to return an array of objects in the order of the array of keys. (Requires the use of the map function)",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: mapController,
                  decoration: const InputDecoration(
                    labelText: 'Enter a list of maps',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: listController,
                  decoration: const InputDecoration(
                    labelText: 'Enter a list of keys',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      try {
                        var map = mapController.text;
                        var list = listController.text;
                        if (map.isEmpty || list.isEmpty) {
                          message.showErrorMessage(
                              context, 'Please enter maps and list');
                          return;
                        } else {
                          var decoded = jsonDecode(map);
                          if (decoded is List) {
                            List<String> keys =
                                list.split(',').map((e) => e.trim()).toList();
                            mapKey = Level5.mapKey(
                                keys, List<Map<String, dynamic>>.from(decoded));
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Result'),
                                  content: Expanded(
                                    child: ListView.builder(
                                      itemCount: mapKey.length,
                                      itemBuilder: (context, index) {
                                        final key = mapKey[index].keys.first;
                                        final value = mapKey[index][key];
                                        return ExpansionTile(
                                          title: Text(key),
                                          children: [
                                            Text('Value: $value'),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else{
                            message.showErrorMessage(
                                context, "Invalid Data");
                          }
                        }
                      } catch (e) {
                        message.showErrorMessage(
                            context, "Error: ${e.toString()}");
                      }
                    },
                    child: const Text('Execute'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
