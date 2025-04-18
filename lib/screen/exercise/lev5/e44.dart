import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_project/common/message.dart';
import 'package:new_project/practice/level5.dart';

class Exercise44 extends StatefulWidget {
  const Exercise44({super.key});

  @override
  State<Exercise44> createState() => _Exercise44State();
}

class _Exercise44State extends State<Exercise44> {
  final mapController = TextEditingController();
  Message message = Message();
  Map<String, int> mapKey = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Exercise 44',
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
                "SumAll: Write a function to calculate the sum of the keys of child elements in any array",
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
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white
                  ),
                  onPressed: () {
                    try{
                      var map = mapController.text;
                      var decoded = jsonDecode(map);
                      if (map.isEmpty) {
                        message.showErrorMessage(context, 'Please enter a list of maps');
                        return;
                      } else if (decoded is List) {
                        mapKey = Level5.sumAll(List<Map<String, dynamic>>.from(decoded));
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Result'),
                              content: Expanded(
                                child: ListView.builder(
                                  itemCount: mapKey.length,
                                  itemBuilder: (context, index) {
                                    return ExpansionTile(
                                      title: Text(
                                          mapKey.keys.elementAt(index).toString()),
                                      children: mapKey.entries.map((e) {
                                        return ListTile(
                                          title: Text('${e.key}: ${e.value}'),
                                        );
                                      }).toList(),
                                    );
                                  },
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        message.showErrorMessage(context, 'Invalid data');
                      }
                    }catch(e){
                      message.showErrorMessage(context, 'Error: ${e.toString()}');
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