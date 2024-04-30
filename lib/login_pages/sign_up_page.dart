import 'package:counselin/login_pages/recovery_settings.dart';
import 'package:counselin/widgets/elevated_button.dart';
import 'package:counselin/widgets/text_field_input.dart';
import 'package:flutter/material.dart';

Route _recoverySetRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => RecoverySetPage(),
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

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool showAdditionalText = false; // Set your condition here
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
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
                        height: MediaQuery.of(context).size.height * 0.5,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Choose your username',
                              style: TextStyle(
                                color: Color(0xff990050),
                              )),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005),
                          TextFieldInput(
                            hintText: 'Username',
                            textInputType: TextInputType.emailAddress,
                            textEditingController: _usernameController,
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
                                    "Enter a valid username",
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
                          Text('Enter your email',
                              style: TextStyle(
                                color: Color(0xff990050),
                              )),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005),
                          TextFieldInput(
                            hintText: 'Email',
                            textInputType: TextInputType.emailAddress,
                            textEditingController: _emailController,
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
                                    "Enter a valid email",
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
                          Text('Set your password',
                              style: TextStyle(
                                color: Color(0xff990050),
                              )),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005),
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
                                    "Password must contain both case alphabets",
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
                          Text('Confirm your password',
                              style: TextStyle(
                                color: Color(0xff990050),
                              )),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005),
                          TextFieldInput(
                            hintText: 'Confirm password',
                            textInputType: TextInputType.emailAddress,
                            textEditingController: _confirmPasswordController,
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
                                    "Passwords do not match",
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
                              Navigator.of(context).push(_recoverySetRoute());
                            },
                            buttonText: 'Sign up',
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005),
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
