import 'package:flutter/material.dart';
import 'package:provider_try_2_animation/screens/all_screens/app_screen.dart';
import 'package:provider_try_2_animation/screens/all_screens/app_screen_mobile.dart';
import 'package:provider_try_2_animation/widgets/responsive_layout.dart';

class CurrentScreen extends StatelessWidget {
  const CurrentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsivelayout(
        mobileBody: HomeScreenMobile(), desktopBody: HomeScreen());
  }
}
