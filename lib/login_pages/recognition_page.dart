import 'package:counselin/login_pages/sign_in_page.dart';
import 'package:counselin/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:instagramui/login_pages/sign_up_page.dart';

// SIGN IN PAGE

Route _signinRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SignInPage(),
    transitionsBuilder: (context, animation1, animation2, child) {
      const begin = Offset(0.0, 0.0);
      const end = Offset(0, 0);
      const curve = Curves.easeOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      var offsetAnimation = animation1.drive(tween);

      // Add FadeTransition for the fade-in effect
      var fadeInAnimation = Tween(begin: 0.0, end: 1.0).animate(animation1);

      return FadeTransition(
        opacity: fadeInAnimation,
        child: SlideTransition(position: offsetAnimation, child: child),
      );
    },
    transitionDuration: const Duration(seconds: 1),
  );
}

// SIGN UP PAGE

Route _signUpRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SignUpPage(),
    transitionsBuilder: (context, animation1, animation2, child) {
      const begin = Offset(0.0, 0.0);
      const end = Offset(0, 0);
      const curve = Curves.easeOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      var offsetAnimation = animation1.drive(tween);

      // Add FadeTransition for the fade-in effect
      var fadeInAnimation = Tween(begin: 0.0, end: 1.0).animate(animation1);

      return FadeTransition(
        opacity: fadeInAnimation,
        child: SlideTransition(position: offsetAnimation, child: child),
      );
    },
    transitionDuration: const Duration(seconds: 1),
  );
}

class RecognitionPage extends StatefulWidget {
  const RecognitionPage({Key? key}) : super(key: key);

  @override
  State<RecognitionPage> createState() => _RecognitionPageState();
}

class _RecognitionPageState extends State<RecognitionPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
        backgroundColor: Color(0xff990050),
        surfaceTintColor: Color(0xff990050),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                // width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.685,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(70)),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff990050),
                      Colors.black.withOpacity(0.8),
                    ],
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomElevatedButton(
                    key: ValueKey('signin_button'),
                    onPressed: () {
                      Navigator.of(context).push(_signinRoute());
                    },
                    buttonText: 'Already student',
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'New to Counselin,',
                          style: TextStyle(
                            color: Color(0xff5d0130),
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(_signUpRoute());
                          },
                          child: Text(
                            "Sign up?",
                            style: textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xff990050),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
