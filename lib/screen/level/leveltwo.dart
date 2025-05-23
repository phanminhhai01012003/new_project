import 'package:flutter/material.dart';
import 'package:new_project/common/common.dart';
import 'package:new_project/common/page_navigator.dart';

class Leveltwo extends StatefulWidget {
  const Leveltwo({super.key});

  @override
  State<Leveltwo> createState() => _LeveltwoState();
}

class _LeveltwoState extends State<Leveltwo> {
  List<String> exercises = Common.level2;
  List<Widget> exerciseWidgets = PageNavigator.level2ExercisesNavigation;
  int exerciseIndex = 0;
  String selectedExercise = Common.level2[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Level 2",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Center(
              child: Text("Select exercises",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: exercises.length, // Number of exercises
                itemBuilder: (context, index) {
                  return Card(
                    surfaceTintColor: Colors.blue.shade400,
                    child: ListTile(
                      title: Text(exercises[index]), // Exercise name
                      onTap: () {
                        // Navigate to the exercise page
                        setState(() {
                          exerciseIndex = index;
                          selectedExercise = exercises[index];
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => exerciseWidgets[index],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}