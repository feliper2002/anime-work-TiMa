import 'dart:ui';

import 'package:anime_work_time_management/pages/home/widgets/timer_clock.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaY: 4, sigmaX: 4),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset('assets/images/day_bg.jpg').image,
                ),
              ),
            ),
          ),
          Center(
            child: TimerClock(),
          ),
        ],
      ),
    );
  }
}
