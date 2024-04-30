import 'package:counselin/password_recovery_pages/recovery_step1_page.dart';
import 'package:counselin/responsive/mobile_screen_layout.dart';
import 'package:counselin/widgets/elevated_button.dart';
import 'package:counselin/widgets/text_field_input.dart';
import 'package:flutter/material.dart';

// HOME SCREEN

Route _homeScreenRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        MobileScreenLayout(),
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

// REVCOVERY STEP1 PAGE

Route _recoveryStep1Route() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        RecoveryStep1Page(),
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

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool showAdditionalText = false; // Set your condition here
  final TextEditingController _username_emailController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.575,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(70)),
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
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFieldInput(
                            hintText: 'Username or email',
                            textInputType: TextInputType.emailAddress,
                            textEditingController: _username_emailController,
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015),
                          TextFieldInput(
                            hintText: 'Password',
                            textInputType: TextInputType.emailAddress,
                            textEditingController: _passwordController,
                          ),
                          Visibility(
                            visible: true,
                            child: Column(
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.015),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  child: Text(
                                    "Username or password is incorrect",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Colors.red,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015),
                          CustomElevatedButton(
                            key: ValueKey('signin_button'),
                            onPressed: () {
                              Navigator.of(context).push(_homeScreenRoute());
                            },
                            buttonText: 'Sign in',
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(_recoveryStep1Route());
                            },
                            child: Text(
                              "Forgot password?",
                              style: textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xff990050),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(7.5),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_rounded),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
