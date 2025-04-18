import 'package:flutter/material.dart';
import 'package:new_project/common/common.dart';
import 'package:new_project/common/page_navigator.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> levels = Common.levels;
  final List<Widget> levelNavigation = PageNavigator.levelNavigation;
  int selectedLevelIndex = 0;
  String selectedLevel = Common.levels[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Code Page",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text("Select Level",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: levels.length,
                itemBuilder: (context, index) {
                  return Card(
                    surfaceTintColor: Colors.blue.shade400,
                    child: ListTile(
                      title: Text(levels[index]),
                      onTap: () {
                        setState(() {
                          selectedLevelIndex = index;
                          selectedLevel = levels[index];
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => levelNavigation[selectedLevelIndex],
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