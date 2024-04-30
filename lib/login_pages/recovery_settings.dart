import 'package:counselin/widgets/elevated_button.dart';
import 'package:counselin/widgets/text_field_input.dart';
import 'package:flutter/material.dart';

class RecoverySetPage extends StatefulWidget {
  const RecoverySetPage({Key? key}) : super(key: key);

  @override
  State<RecoverySetPage> createState() => _RecoverySetPageState();
}

class _RecoverySetPageState extends State<RecoverySetPage> {
  bool showAdditionalText = false; // Set your condition here
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _backupEmailController = TextEditingController();

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
                            textEditingController: _phoneNoController,
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
                          Text('Enter your backup email',
                              style: TextStyle(
                                color: Color(0xff990050),
                              )),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005),
                          TextFieldInput(
                            hintText: 'Email',
                            textInputType: TextInputType.emailAddress,
                            textEditingController: _backupEmailController,
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
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015),
                          CustomElevatedButton(
                            key: ValueKey('signin_button'),
                            onPressed: () {},
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
