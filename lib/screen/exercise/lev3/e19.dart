import 'package:flutter/material.dart';
import 'package:new_project/common/message.dart';
import 'package:new_project/practice/level3.dart';

class Exercise19 extends StatefulWidget {
  const Exercise19({super.key});

  @override
  State<Exercise19> createState() => _Exercise19State();
}

class _Exercise19State extends State<Exercise19> {
  final controller = TextEditingController();
  Message message = Message();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Exercise 19',
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
                "Write a program that takes a list of strings as input and returns the two strings with the largest overlap of characters.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: 'Enter a list of string',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                keyboardType: TextInputType.text,
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
                    var stringInput = controller.text;
                    if (stringInput.isEmpty) {
                      message.showErrorMessage(context, 'Please enter a list of string');
                      return;
                    }
                    List<String> strings = stringInput.split(',');
                    List<String> result = Level3.findLargestOverlap(strings, context);
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