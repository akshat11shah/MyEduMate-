import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<Result> {
  final List<String> semesters = ['Select Semester', 'Sem - 1'];
  String? selectedSem; // Initially null

  final Map<String, String> semImages = {
    'Sem - 1': 'assets/sem1.png', // Ensure this image exists in your assets folder
  };

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Result', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30), // General padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButton<String>(
                value: selectedSem,
                isExpanded: true,
                hint: Text('Select Semester'),
                items: semesters.map((String semester) {
                  return DropdownMenuItem<String>(
                    value: semester,
                    child: Text(semester),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedSem = newValue!;
                  });
                },
              ),
            ),
            Expanded(
              child: Center(
                child: (selectedSem != null && semImages.containsKey(selectedSem))
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.emoji_events, color: Colors.green, size: 40),
                        SizedBox(width: 10),
                        Text(
                          'Congratulations!!',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      ],
                    ),
                    Padding(padding: (EdgeInsets.symmetric(vertical: 10)),),
                    Image.asset(
                      semImages[selectedSem]!,
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.4,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 25),

                  ],
                )
                    : Text(
                  'Result Not Available',
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
