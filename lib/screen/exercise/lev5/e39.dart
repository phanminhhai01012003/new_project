import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_project/common/message.dart';
import 'package:new_project/practice/level5.dart';

class Exercise39 extends StatefulWidget {
  const Exercise39({super.key});

  @override
  State<Exercise39> createState() => _Exercise39State();
}

class _Exercise39State extends State<Exercise39> {
  final mapController = TextEditingController();
  Message message = Message();
  List<Map<String, int>> unique = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Exercise 39',
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "uniq ArrayObject: Given an input array, write a function to remove duplicate elements in the array.",
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
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    try{
                      var map = mapController.text;
                      var decoded = jsonDecode(map);
                      if (map.isEmpty) {
                        message.showErrorMessage(context, "Please enter a list of maps");
                        return;
                      } else if (decoded is List){
                        unique = Level5.uniqArrayObject(List<Map<String, int>>.from(decoded));
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Result'),
                              content: Expanded(
                                child: ListView.builder(
                                  itemCount: unique.length,
                                  itemBuilder: (context, index) {
                                    final key = unique[index].keys.first;
                                    final value = unique[index][key];
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
                      } else {
                        message.showErrorMessage(context, "Invalid data");
                      }
                    }catch(e){
                      message.showErrorMessage(context, "Error: ${e.toString()}");
                    }
                  },
                  child: const Text('Execute'),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}