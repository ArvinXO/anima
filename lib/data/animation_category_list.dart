import 'package:anima/main.dart';
import 'package:flutter/material.dart';

class AnimationCategoryList extends StatelessWidget {
  final List<Map<String, dynamic>> animationCategories = [
    {
      'categoryName': 'Fade Animations',
      'animations': [
        {'name': 'Fade Animation', 'route': '/fade_animation'},
        {'name': 'Fade and Scale Animation', 'route': '/fade_scale_animation'},
        {'name': 'Crossfade Animation', 'route': '/cross_fade_animation'},
      ],
    },
    {
      'categoryName': 'Bouncing Animations',
      'animations': [
        {'name': 'Bouncing Animation', 'route': '/bouncing_animation'},
        {'name': 'Bouncing Ball Animation', 'route': '/bouncing_ball_animation'},
        {'name': 'Bouncing Card Animation', 'route': '/bouncing_card_animation'},
      ],
    },
    {
      'categoryName': 'Color Animations',
      'animations': [
        {'name': 'Color Animation', 'route': '/colour_animation'},
        {'name': 'Color Transition Animation', 'route': '/colour_transition_animation'},
        {'name': 'Color Loop Animation', 'route': '/colour_loop_animation'},
        {'name': 'Color Pulse Animation', 'route': '/color_pulse_animation'},
      ],
    },
    {
      'categoryName': 'Combination Animations',
      'animations': [
        {'name': 'Combination Animation', 'route': '/combination_animation'},
      ],
    },
    {
      'categoryName': 'Custom Path Animations',
      'animations': [
        {'name': 'Custom Path Animation', 'route': '/custom_path_animation'},
      ],
    },
    {
      'categoryName': 'Path Transition Animations',
      'animations': [
        {'name': 'Path Transition Animation', 'route': '/path_transition_animation'},
      ],
    },
    {
      'categoryName': 'Flip Animations',
      'animations': [
        {'name': 'Flip Animation', 'route': '/flip_animation'},
      ],
    },
    {
      'categoryName': 'Rotation Animations',
      'animations': [
        {'name': 'Rotation Animation', 'route': '/rotation_animation'},
      ],
    },
    {
      'categoryName': 'Scale Animations',
      'animations': [
        {'name': 'Scale Animation', 'route': '/scale_animation'},
      ],
    },
    {
      'categoryName': 'Slide Animations',
      'animations': [
        {'name': 'Slide Animation', 'route': '/slide_animation'},
      ],
    },
    {
      'categoryName': 'Staggered Animations',
      'animations': [
        {'name': 'Staggered Animation', 'route': '/staggered_animation'},
      ],
    },
    {
      'categoryName': 'Text Animations',
      'animations': [
        {'name': 'Text Animation', 'route': '/text_animation'},
        {'name': 'Typewriter Animation', 'route': '/typewriter_animation'},
        {'name': 'Colour Transition Text Animation', 'route': '/text_colour_transition_animation'},
        // Add more text animations here
      ],
    },
    // Add more animation categories here
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      itemCount: animationCategories.length,
      itemBuilder: (BuildContext context, int index) {
        final category = animationCategories[index];
        final categoryName = category['categoryName'] as String;
        final animations = category['animations'] as List<Map<String, String>>;

        return AnimationCategoryWidget(
          categoryName: categoryName,
          animations: animations,
        );
      },
    );
  }
}
