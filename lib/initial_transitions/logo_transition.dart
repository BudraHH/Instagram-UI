import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instagramui/login_pages/recognition_page.dart';

class LogoTransitionPage extends StatefulWidget {
  const LogoTransitionPage({Key? key}) : super(key: key);

  @override
  _LogoTransitionPageState createState() => _LogoTransitionPageState();
}

class _LogoTransitionPageState extends State<LogoTransitionPage> {
  @override
  void initState() {
    super.initState();

    // Wait for 3 seconds and then navigate to HomePage with a fade-in animation
    Timer(Duration(seconds: 2), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => RecognitionPage(),
          transitionsBuilder: (context, animation1, animation2, child) {
            const begin = Offset(0.0, 0.0);
            const end = Offset(0, 0);
            const curve = Curves.easeOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            var offsetAnimation = animation1.drive(tween);

            // Add FadeTransition for the fade-in effect
            var fadeInAnimation =
                Tween(begin: 0.0, end: 1.0).animate(animation1);

            return FadeTransition(
              opacity: fadeInAnimation,
              child: SlideTransition(position: offsetAnimation, child: child),
            );
          },
          transitionDuration: const Duration(seconds: 2),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: Container(
      color: Color(0xff990050),
      child: Align(
        alignment: Alignment.center,
        child: Image.asset('assets/logo/counselin_logo.jpg'),
      ),
    ));
  }
}
