import 'package:flutter/material.dart';

class Fees extends StatelessWidget {
  const Fees({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fees Details', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body:
      Padding(padding: EdgeInsets.symmetric(vertical: 15),
    child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Enables horizontal scrolling if needed
        child: DataTable(
          columnSpacing: 10, // Reduces space between columns
          dataRowMinHeight: 30, // Minimum row height
          dataRowMaxHeight: 35, // Maximum row height
          headingRowHeight: 40, // Reduces header row height
          headingRowColor: MaterialStateColor.resolveWith((states) => Colors.blue),
          columns: [
            DataColumn(label: tableHeader('Sem')),
            DataColumn(label: tableHeader('Total Fees')),
            DataColumn(label: tableHeader('Received Fees')),
            DataColumn(label: tableHeader('Scholarship Amt.')),
            DataColumn(label: tableHeader('Pending Fees')),
          ],
          rows: [
            tableRow(['2', '63500.00', '53500.00', '10000.00', '3500.00',],),
            tableRow(['1', '65000.00', '65000.00', '0.00', '0.00',],),
          ],
        ),
      ),
    )
    );
  }

  // Function to create table headers with custom font size
  Widget tableHeader(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  // Function to create table rows with custom font size
  DataRow tableRow(List<String> cells) {
    return DataRow(
      cells: cells.map((cell) {
        return DataCell(
          Text(
            cell,
            style: TextStyle(fontSize: 12), // Adjust text size
          ),
        );
      }).toList(),
    );
  }
}
