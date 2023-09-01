import 'package:anima/animations/scale_animation/scale_animation.dart';
import 'package:anima/main.dart';
import 'package:flutter/material.dart';
import 'animations/color_animation/colour_animation.dart';
import 'animations/combination_animation/combination_animation.dart';
import 'animations/custom_path_animation/custom_path_animation.dart';
import 'animations/fade_animation/fade_animation.dart';
import 'animations/rotation_animation/rotation_animation.dart';
import 'animations/slide_animation/slide_animaton.dart';
import 'animations/staggered_animation/staggered_animation.dart';
import 'default.dart';

Map<String, Widget Function(BuildContext)> animationRoutes = {
  '/fade_animation': (context) => FadeAnimationWidget(),
  '/slide_animation': (context) => SlideAnimationWidget(),
  '/scale_animation': (context) => ScaleAnimationWidget(),
  '/rotation_animation': (context) => RotationAnimationWidget(),
  '/color_animation': (context) => ColourAnimationWidget(),
  '/custom_path_animation': (context) => CustomPathAnimationWidget(),
  '/combination_animation': (context) => CombinationAnimationWidget(),
  '/staggered_animation': (context) => StaggeredAnimationWidget(),
  // Add more routes for other animations here
};

MaterialPageRoute generateRoute(RouteSettings settings) {
  final builder = animationRoutes[settings.name];
  if (builder != null) {
    return MaterialPageRoute(builder: builder);
  } else {
    return MaterialPageRoute(
      builder: (context) => MainPage(), // Replace with your default page
    );
  }
}
