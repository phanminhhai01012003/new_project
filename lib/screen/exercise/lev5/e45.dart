import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:new_project/common/message.dart';
import 'package:new_project/practice/level5.dart';

class Exercise45 extends StatefulWidget {
  const Exercise45({super.key});

  @override
  State<Exercise45> createState() => _Exercise45State();
}

class _Exercise45State extends State<Exercise45> {
  Message message = Message();
  String templateContent = "";
  String outputContent = "";
  Map<String, String> params = {};
  Future<void> pickFileTemplate() async {
    final file = await FilePicker.platform.pickFiles();
    if (file != null && file.files.single.path != null) {
      final filePath = File(file.files.single.path!);
      final content = await filePath.readAsString();
      setState(() {
        templateContent = content;
      });
    } else {
      message.showErrorMessage(context, "File not selected");
    }
  }
  void generateOutput(){
    setState(() {
      Level5.templateString(templateContent, outputContent, params);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Exercise 45',
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
                "TemplateString:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Input: a template file, and params, the file content and param names are not fixed",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Output: a new file with the template content and the passed params.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              // Add your input fields and buttons here
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    pickFileTemplate();
                  },
                  child: const Text("Pick Template File"),
                ),
              ),
              if (templateContent.isNotEmpty) ...[
                const SizedBox(height: 20),
                Text(
                  "Template Content:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(templateContent),
              ],
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter params (key:value)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                onChanged: (value) {
                  final parts = value.split(',');
                  for (var part in parts) {
                    final keyValue = part.split(':');
                    if (keyValue.length == 2) {
                      params[keyValue[0].trim()] = keyValue[1].trim();
                    }
                  }
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    generateOutput();
                  },
                  child: const Text("Generate Output"),
                ),
              ),
              if (outputContent.isNotEmpty) ...[
                const SizedBox(height: 20),
                Text(
                  "Output Content:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(outputContent),
              ],
            ],
          ),
        ),
      ),
    );
  }
}