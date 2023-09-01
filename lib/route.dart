import 'package:anima/animations/bouncing_animation/bouncing_ball_animation.dart';
import 'package:anima/animations/bouncing_animation/bouncing_card_colour_animation.dart';
import 'package:anima/animations/color_animation/colour_loop_animation.dart';
import 'package:anima/animations/color_animation/colour_pulse_animation.dart';
import 'package:anima/animations/color_animation/colour_transition_animation.dart';
import 'package:anima/animations/custom_path_animation/path_transition_animation.dart';
import 'package:anima/animations/fade_animation/cross_fade_animation.dart';
import 'package:anima/animations/flip_animation/flip_animation.dart';
import 'package:anima/animations/scale_animation/scale_animation.dart';
import 'package:anima/animations/text_animation/text_animations.dart';
import 'package:anima/animations/text_animation/text_colour_transition.dart';
import 'package:anima/animations/text_animation/typewriter_animation.dart';
import 'package:anima/main.dart';
import 'package:flutter/material.dart';
import 'animations/color_animation/colour_animation.dart';
import 'animations/combination_animation/combination_animation.dart';
import 'animations/custom_path_animation/custom_path_animation.dart';
import 'animations/fade_animation/fade_animation.dart';
import 'animations/fade_animation/fade_scale_animation.dart';
import 'animations/rotation_animation/rotation_animation.dart';
import 'animations/slide_animation/slide_animaton.dart';
import 'animations/staggered_animation/staggered_animation.dart';
import 'animations/bouncing_animation/bouncing_animation.dart';
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
  '/bounce_animation': (context) => BouncingAnimationWidget(),
  '/flip_animation': (context) => FlipAnimationWidget(),
  '/path_transition_animation': (context) => PathTransitionAnimationWidget(),
  '/text_animation': (context) => TextAnimationWidget(),
  '/typewriter_animation': (context) => TypewriterTextAnimationWidget(),
  '/text_colour_transition_animation': (context) => TextColourTransitionAnimationWidget(),
  '/fade_scale_animation': (context) => FadeAndScaleAnimationWidget(),
  '/cross_fade_animation': (context) => CrossfadeAnimationWidget(),
  '/bouncing_ball_animation': (context) => BouncingBallAnimationWidget(),
  '/bouncing_card_animation': (context) => BouncingCardColourAnimationWidget(),
  '/colour_transition_animation': (context) => ColourTransitionAnimationWidget(),
  '/colour_loop_animation': (context) => ColourLoopAnimationWidget(),
  '/color_pulse_animation': (context) => ColourPulseAnimationWidget(),

  // Add more routes for other animations here
};

class BounceAnimationWidget {
}

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
