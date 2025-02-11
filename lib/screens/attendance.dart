import 'package:flutter/material.dart';

class Attendance extends StatelessWidget {
  const Attendance({super.key});

  @override
  Widget build(BuildContext context) {
    // Example attendance values
    List<Map<String, dynamic>> attendanceData = [
      {"course": "CAUC513 / AMP", "type": "LECT", "present": 4, "total": 16},
      {"course": "CAUC513 / AMP", "type": "LAB", "present": 1, "total": 5},
      {"course": "CAUC514 / FSWD", "type": "LECT", "present": 0, "total": 0},
      {"course": "CAUC514 / FSWD", "type": "LAB", "present": 0, "total": 0},
      {"course": "CAUC515 / SEAD", "type": "LECT", "present": 0, "total": 0},
      {"course": "CAUE510 / PWF", "type": "LECT", "present": 3, "total": 3},
      {"course": "CAUE510 / PWF", "type": "LAB", "present": 1, "total": 4},
      {"course": "HSUA501 / AW", "type": "LAB", "present": 0, "total": 0},
    ];

    // // Calculate total attendance percentage
    // double totalPresent = 0;
    // double totalClasses = 0;
    // for (var data in attendanceData) {
    //   totalPresent += data["present"];
    //   totalClasses += data["total"];
    // }
    // double overallPercentage = totalClasses > 0 ? (totalPresent / totalClasses) * 100 : 0;

    return Scaffold(
      appBar: AppBar(title: Text('Attendance - 36 %',style: TextStyle(color: Colors.white)),backgroundColor: Colors.blue,titleSpacing: 50,), // ${overallPercentage.toStringAsFixed(2)}%")
      body:
      Padding(padding: const EdgeInsets.symmetric(vertical: 25),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: MediaQuery.of(context).size.width, // Ensures full width
          child: Table(
            border: TableBorder.all(color: Colors.black, width: 0), // Full vertical & horizontal borders
            children: [
              // Header Row
              _buildTableRow(["Course", "Class Type", "Present/Total", "Percentage"], Colors.blue, isHeader: true),
              // Data Rows with Alternate Colors
              for (int i = 0; i < attendanceData.length; i++)
                _buildTableRow(
                  [
                    attendanceData[i]["course"],
                    attendanceData[i]["type"],
                    "${attendanceData[i]["present"]} / ${attendanceData[i]["total"]}",
                    "${attendanceData[i]["total"] > 0 ? ((attendanceData[i]["present"] / attendanceData[i]["total"]) * 100).toStringAsFixed(2) : "0"}%",
                  ],
                  i % 2 == 0 ? Colors.white : Colors.grey[200]!,
                ),
            ],
          ),
        ),
      ),
    ),
    );
  }

  // Function to Build Table Rows (Handles Headers & Data)
  TableRow _buildTableRow(List<String> rowData, Color color, {bool isHeader = false}) {
    return TableRow(
      decoration: BoxDecoration(color: color),
      children: rowData.map((cell) {
        return Padding(
          padding: const EdgeInsets.all(7.7),
          child: Center(
            child: Text(
              cell,
              style: TextStyle(
                fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                color: isHeader ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
