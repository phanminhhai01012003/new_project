import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_project/common/message.dart';
import 'package:new_project/practice/level5.dart';

class Exercise43 extends StatefulWidget {
  const Exercise43({super.key});

  @override
  State<Exercise43> createState() => _Exercise43State();
}

class _Exercise43State extends State<Exercise43> {
  final mapController = TextEditingController();
  final idController = TextEditingController();
  final newOrderController = TextEditingController();
  Message message = Message();
  List<Map<String, dynamic>> mapOrder = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Exercise 43',
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
                "Switch Order: Write a function to change the order of objects.",
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
              const SizedBox(height: 20),
              TextField(
                controller: idController,
                decoration: const InputDecoration(
                  labelText: 'Enter ID',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$')),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: newOrderController,
                decoration: const InputDecoration(
                  labelText: 'Enter new order',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$')),
                ],
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
                    // Add your function logic here
                    try {
                      var map = mapController.text;
                      var idText = idController.text;
                      var newOrderText = newOrderController.text;
                      var id = int.parse(idText);
                      var newOrder = int.parse(newOrderText);
                      if (map.isEmpty ||
                          idText.isEmpty ||
                          newOrderText.isEmpty) {
                        message.showErrorMessage(context,
                            "Please enter a list of maps, id and new order");
                        return;
                      } else {
                        var decoded = jsonDecode(map);
                        if (decoded is List) {
                          mapOrder = Level5.switchOrder(id, newOrder,
                              List<Map<String, dynamic>>.from(decoded));
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Result'),
                                content: Expanded(
                                  child: ListView.builder(
                                      itemCount: mapOrder.length,
                                      itemBuilder: (context, index) {
                                        return ExpansionTile(
                                          title: Text(
                                              mapOrder[index]['id'].toString()),
                                          children: mapOrder[index]
                                              .entries
                                              .map((entry) {
                                            return ListTile(
                                              title: Text(
                                                  '${entry.key}: ${entry.value}'),
                                            );
                                          }).toList(),
                                        );
                                      }),
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
                          message.showErrorMessage(context, "Invalid Data");
                        }
                      }
                    } catch (e) {
                      message.showErrorMessage(
                          context, 'Error: ${e.toString()}');
                    }
                  },
                  child: const Text('Execute'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
