import 'package:counselin/login_pages/sign_in_page.dart';
import 'package:counselin/widgets/elevated_button.dart';
import 'package:counselin/widgets/text_field_input.dart';
import 'package:flutter/material.dart';

// SIGN IN PAGE

Route _signInRoute() {
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

class RecoveryStep3Page extends StatefulWidget {
  const RecoveryStep3Page({Key? key}) : super(key: key);

  @override
  State<RecoveryStep3Page> createState() => _RecoveryStep1PageState();
}

class _RecoveryStep1PageState extends State<RecoveryStep3Page> {
  bool showAdditionalText = false; // Set your condition here
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _eMailController = TextEditingController();

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
                                bottomLeft: Radius.circular(70)),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff990050),
                                Colors.black.withOpacity(0.8),
                              ],
                              begin: Alignment.center,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Text('Reset your password',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                              ))),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Enter your password',
                              style: TextStyle(
                                color: Color(0xff990050),
                              )),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005),
                          TextFieldInput(
                            hintText: 'Password',
                            textInputType: TextInputType.emailAddress,
                            textEditingController: _userNameController,
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
                            hintText: 'Re-type password',
                            textInputType: TextInputType.emailAddress,
                            textEditingController: _eMailController,
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
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015),
                          CustomElevatedButton(
                            key: ValueKey('next_button'),
                            onPressed: () {
                              Navigator.of(context).push(_signInRoute());
                            },
                            buttonText: 'Confirm',
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
