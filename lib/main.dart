import 'package:anima/route.dart'; // Import your routing functions and animationRoutes
import 'package:flutter/material.dart';

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
        title: Text('Anima'),
      ),
      body: AnimationList(), // Display the AnimationList widget here
    );
  }
}

class AnimationList extends StatelessWidget {
  // Define a list of animations with their names and route names
  final List<Map<String, String>> animations = [
    {'name': 'Fade Animation', 'route': '/fade_animation'},
    {'name': 'Slide Animation', 'route': '/slide_animation'},
    {'name': 'Scale Animation', 'route': '/scale_animation'},
    {'name': 'Rotation Animation', 'route': '/rotation_animation'},
    {'name': 'Color Animation', 'route': '/color_animation'},
    {'name': 'Custom Path Animation', 'route': '/custom_path_animation'},
    {'name': 'Combination Animation', 'route': '/combination_animation'},
    {'name': 'Staggered Animation', 'route': '/staggered_animation'},
    {'name': 'Bounce Animation', 'route': '/bounce_animation'},

    // Add more animations here as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
      ),
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              animationName,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
