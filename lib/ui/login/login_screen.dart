import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_bhai_2022/core/MyColor.dart';

import '../confirm/confirm_pin.dart';
import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double screenWidth = 0;
  late TextEditingController inputNumberController;
  late LoginBloc _bloc;

  @override
  void initState() {
    super.initState();
    // _bloc = new LoginBloc();
    inputNumberController = TextEditingController();
    _bloc = LoginBloc(context);
    // _bloc.add(InitEvent());
  }

  @override
  void dispose() {
    super.dispose();

    //Close the Stream Sink when the widget is disposed
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<LoginBloc>(
        create: (_) => _bloc,
        // ignore: missing_return
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (BuildContext context, LoginState state) {
            // ignore: missing_return
          },
          // ignore: missing_return
          builder: (BuildContext context, LoginState state) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 250,
                        width: 250,
                        margin:
                            const EdgeInsets.only(top: 20, left: 0, right: 50),
                        child: Image.asset('assets/icons/login.png'),
                      ),
                      const SizedBox(height: 20),
                      const Center(
                        child: Text(
                          "OTP Verification",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: CustomColors.appBlack),
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 20, left: 30, right: 30),
                        child: RichText(
                          text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'we will send you an',
                                    style: TextStyle(fontSize: 15)),
                                TextSpan(
                                    text: ' One Time Password',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: '\non this mobile number',
                                    style: TextStyle(fontSize: 15)),
                              ],
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 15)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 50,
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2.0, color: CustomColors.primaryColor),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: double.maxFinite,
                              alignment: Alignment.center,
                              color: CustomColors.primaryColor,
                              margin: const EdgeInsets.only(left: 0),
                              padding:
                                  const EdgeInsets.only(left: 5, right: 10),
                              child: const Text(
                                "+88",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: double.maxFinite,
                                padding:
                                    const EdgeInsets.only(left: 5, bottom: 12),
                                child: TextField(
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(11)
                                  ],
                                  onChanged: (text) {},
                                  controller: inputNumberController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      (state is OtpErrorState)
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                      state.msg,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                )
                              : Container(),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.primaryColor.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],

                          // border: Border.all(
                          //     color: CustomColors.primaryColor, width: 3),
                        ),
                        child: (state is LoadingState)
                            ? MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0)),
                                minWidth: screenWidth - 50,
                                height: 45,
                                elevation: 0,
                                color: CustomColors.primaryColor,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.redAccent,
                                        valueColor: AlwaysStoppedAnimation(
                                            Colors.white),
                                        strokeWidth: 5,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Please Wait",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                                onPressed: () {
                                  /* var isValidate = _phoneNumberValidator(
                                inputNumberController.text.toString());
                            if (isValidate == true) {

                              _onClickLogin(inputNumberController.text.toString());
                              _bloc.add(SendOtpEvent());
                            } else {
                              _bloc.add(ErrorEvent(msg: "Invalid Phone Number"));
                            }*/
                                },
                              )
                            : MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0)),
                                minWidth: screenWidth - 50,
                                height: 45,
                                elevation: 0,
                                color: CustomColors.primaryColor,
                                child: const Text(
                                  'GET OTP',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline),
                                ),
                                onPressed: () {
                                  var isValidate = _phoneNumberValidator(
                                      inputNumberController.text.toString());
                                  // _bloc.add(SendOtpEvent(phone: "+8801686352645"));
                                  if (isValidate == true) {
                                    _bloc.add(SendOtpEvent(phone: inputNumberController.text.toString()));
                                  } else {
                                    _bloc.add(ErrorEvent(
                                        msg: "Invalid Phone Number"));
                                  }
                                },
                              ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Text(
                          'Login with Gmail',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: CustomColors.appBlack,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  bool _phoneNumberValidator(String value) {
    Pattern pattern = r'^(?:\+88|01)?\d{11}$';
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  _onClickLogin(String phoneNumber) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmPinScreen(
            phoneNumber: phoneNumber,
          ),
        ));
  }
}
