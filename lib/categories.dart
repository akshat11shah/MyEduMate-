import 'package:charusat/data/main_screen_data.dart';
import 'package:charusat/screens/profile.dart';
import 'package:charusat/screens/attendance.dart';
import 'package:charusat/screens/fees_status.dart';
import 'package:charusat/screens/result.dart';
import 'package:charusat/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void selectCategory(BuildContext context, String categoryId){

    Widget screen;

    switch(categoryId){
      case 'c1':
        screen = const Profile();
        break;

      case 'c2':
        screen = const Attendance();
        break;

      case 'c3':
        screen = const Fees();
        break;

      case 'c4':
        screen = const Result();
        break;

      default:
        return;
    }

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => screen
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar( // CircleAvatar automatically clips into a circle
              radius: 15, // Adjust size
              backgroundImage: AssetImage('assets/SELF.jpg'),
            ),
            const SizedBox(width: 10),
            const Text(
              'Dashboard',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10), // Adds spacing
            child: Text('Welcome Akshat Shah!!',style: TextStyle(fontSize: 25),),
          ),
          Expanded(
            child: GridView(
              padding: const EdgeInsets.all(2),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 5 / 1.7,
                crossAxisSpacing: 25,
                mainAxisSpacing: 15,
              ),
              children: [
                for (final category in availableCategories)
                  CategoryGridItem(category: category, onCategorySelect: () => selectCategory(context, category.id) ),
                ],
            ),
          ),
        ],
      ),
    );
  }


}