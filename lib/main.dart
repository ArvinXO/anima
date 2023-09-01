import 'package:anima/route.dart'; // Import your routing functions and animationRoutes
import 'package:flutter/material.dart';

import 'data/animation_category_list.dart';

void main() {
  runApp(AnimaApp());
}

class AnimaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anima',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // Set your initial route here (e.g., '/home' or '/splash')
      initialRoute: '/',
      // Provide your routing function
      onGenerateRoute: generateRoute,
      // Provide your animation routes
      routes: animationRoutes,
      debugShowCheckedModeBanner: false,
      home: MainPage(), // Set the MainPage as the home
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Anima'),
      ),
      body: AnimationCategoryList(), // Display the AnimationCategoryList widget here
    );
  }
}



class AnimationCategoryWidget extends StatelessWidget {
  final String categoryName;
  final List<Map<String, String>> animations;

  AnimationCategoryWidget({
    required this.categoryName,
    required this.animations,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        categoryName,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: animations.map((animation) {
        return CustomListTile(
          animationName: animation['name']!,
          animationRoute: animation['route']!,
          onTap: () {
            // Navigate to the animation when the tile is tapped
            Navigator.pushNamed(context, animation['route']!);
          },
        );
      }).toList(),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String animationName;
  final String animationRoute;
  final VoidCallback onTap;

  CustomListTile({
    required this.animationName,
    required this.animationRoute,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        animationName,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.normal,
        ),
      ),
      onTap: onTap,
      trailing: Icon(
        Icons.arrow_forward,
        color: Colors.blue,
      ),
    );
  }
}
