import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_project/common/message.dart';
import 'package:new_project/practice/level3.dart';

class Exercise18 extends StatefulWidget {
  const Exercise18({super.key});

  @override
  State<Exercise18> createState() => _Exercise18State();
}

class _Exercise18State extends State<Exercise18> {
  final controller = TextEditingController();
  Message message = Message();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Exercise 18',
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
                "Write a program that takes a list of integers as input and returns the longest increasing subsequence of the numbers.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: 'Enter a list of numbers',
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
                    var numInput = controller.text;
                    if (numInput.isEmpty) {
                      message.showErrorMessage(context, 'Please enter a list of numbers');
                      return;
                    }
                    List<int> numbers = numInput.split(',').map((e) => int.parse(e)).toList();
                    List<int> result = Level3.findLongestIncreasingSubsequence(numbers);
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