import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_project/common/message.dart';
import 'package:new_project/practice/level5.dart';

class Exercise40 extends StatefulWidget {
  const Exercise40({super.key});

  @override
  State<Exercise40> createState() => _Exercise40State();
}

class _Exercise40State extends State<Exercise40> {
  final mapController = TextEditingController();
  final fieldController = TextEditingController();
  Map<String, List<Map<String, dynamic>>> grouped = {};
  Message message = Message();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Exercise 40',
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
                "Group by: Given an input of a collection (array of objects), write a function to return a new OBJECT containing data grouped by the specified field.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: mapController,
                decoration: const InputDecoration(
                  labelText: 'Enter a list of map',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: fieldController,
                decoration: const InputDecoration(
                  labelText: 'Enter a field',
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
                      var input = mapController.text;
                      var field = fieldController.text;
                      if (input.isEmpty || field.isEmpty) {
                        message.showErrorMessage(
                            context, 'Please enter a list of map and field');
                        return;
                      } else {
                        var decoded = jsonDecode(input);
                        if (decoded is List) {
                          grouped = Level5.groupBy(
                              List<Map<String, dynamic>>.from(decoded), field);
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Result'),
                                content: Expanded(
                                  child: ListView.builder(
                                    itemCount: grouped.length,
                                    itemBuilder: (context, index) {
                                      var key = grouped.keys.elementAt(index);
                                      var value = grouped[key];
                                      return ExpansionTile(
                                        title: Text(key),
                                        children: value!.map((e) {
                                          return ListTile(
                                            title: Text(e.toString()),
                                          );
                                        }).toList(),
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
                        } else {
                          message.showErrorMessage(context, 'Invalid Data');
                        }
                      }
                    } catch (e) {
                      message.showErrorMessage(
                          context, 'Error: ${e.toString()}');
                    }
                  },
                  child: Text('Execute'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
