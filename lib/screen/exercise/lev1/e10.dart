import 'package:flutter/material.dart';
import 'package:new_project/common/message.dart';
import 'package:new_project/practice/level1.dart';

class Exercise10 extends StatefulWidget {
  const Exercise10({super.key});

  @override
  State<Exercise10> createState() => _Exercise10State();
}

class _Exercise10State extends State<Exercise10> {
  Message message = Message();
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Exercise 10',
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
                  "Write a program that takes a list of strings as input and returns the number of strings that contain the letter 'a'.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 30),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Enter a list of strings',
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
                    var text = _controller.text;
                    if (text.isEmpty) {
                      message.showErrorMessage(context, 'Please enter a list of strings');
                      return;
                    }
                    List<String> input = text.split(',');
                    String result = Level1.countWordsWithA(input).toString();
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
