import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      // Body
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 200, vertical: 30)),
          const SizedBox(height: 10), // Moves image 10px down from AppBar
          // const CircleAvatar(
          //   radius: 50,
          //   backgroundImage: AssetImage('assets/SELF.jpg'),
          // ),

          Image(image: AssetImage('assets/SELF.jpg'), fit: BoxFit.fill, height: 200, width: 200,),
          const SizedBox(height: 20), // Space between image and text

          // Profile Details
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue[50], // Light background
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Student ID: 24MCA093',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 7),
                Text(
                  'Name: Akshat Mikin Shah',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 7),
                Text(
                  'Contact No.: 9409559596',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 7),
                Text(
                  'Program: MCA',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 7),
                Text(
                  'Student of CMPICA',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
