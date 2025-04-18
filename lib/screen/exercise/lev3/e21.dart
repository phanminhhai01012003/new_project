import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_project/common/message.dart';
import 'package:new_project/practice/level3.dart';

class Exercise21 extends StatefulWidget {
  const Exercise21({super.key});

  @override
  State<Exercise21> createState() => _Exercise21State();
}

class _Exercise21State extends State<Exercise21> {
  final _firstController = TextEditingController();
  final _secondController = TextEditingController();
  Message message = Message();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Exercise 21',
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
                "Write a program that takes two lists of integers as input and returns the median of the combined list.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _firstController,
                decoration: const InputDecoration(
                  labelText: 'Enter first list of numbers',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[0-9,]*$')),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                controller: _secondController,
                decoration: const InputDecoration(
                  labelText: 'Enter second list of numbers',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[0-9,]*$')),
                ],
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
                    var firstInput = _firstController.text;
                    var secondInput = _secondController.text;
                    if (firstInput.isEmpty || secondInput.isEmpty) {
                      message.showErrorMessage(context, 'Please enter both list of numbers');
                      return;
                    }
                    List<int> firstNumbers = firstInput.split(',').map((e) => int.parse(e)).toList();
                    List<int> secondNumbers = secondInput.split(',').map((e) => int.parse(e)).toList();
                    List<int> combineList = [...firstNumbers, ...secondNumbers];
                    double result = Level3.findMedian(combineList);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Result'),
                          content: Text('The result is $result'),
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