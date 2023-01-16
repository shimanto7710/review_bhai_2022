import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_bhai_2022/ui/confirm/confirm_bloc.dart';

import '../../core/MyColor.dart';

class ConfirmPinScreen extends StatefulWidget {
  static const routeName = '/pin_screen';
  ConfirmPinScreen({required this.phoneNumber}) : super();

  late String phoneNumber;

  @override
  State<ConfirmPinScreen> createState() =>
      _ConfirmPinScreenState(phoneNumber: phoneNumber);
}

class _ConfirmPinScreenState extends State<ConfirmPinScreen> {
  _ConfirmPinScreenState({required this.phoneNumber}) : super();

  double screenWidth = 0;
  late String phoneNumber;
  late TextEditingController controllerPinOne;
  late TextEditingController controllerPinTwo;
  late TextEditingController controllerPinThree;
  late TextEditingController controllerPinFour;
  late FocusNode focusOne;
  late FocusNode focusTwo;
  late FocusNode focusThree;
  late FocusNode focusFour;
  late ConfirmBloc _bloc;
  @override
  void initState() {
    // _bloc = new LoginBloc();
    controllerPinOne = TextEditingController();
    controllerPinTwo = TextEditingController();
    controllerPinThree = TextEditingController();
    controllerPinFour = TextEditingController();

    focusOne = FocusNode();
    focusTwo = FocusNode();
    focusThree = FocusNode();
    focusFour = FocusNode();
    _bloc=ConfirmBloc(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<ConfirmBloc>(
        create: (_) => _bloc,
        // ignore: missing_return
        child: BlocConsumer<ConfirmBloc, ConfirmState>(
          listener: (BuildContext context, ConfirmState state) {
            // ignore: missing_return
          },
          // ignore: missing_return
          builder: (BuildContext context, ConfirmState state) {
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
                        margin: const EdgeInsets.only(top: 20, left: 0, right: 0),
                        child: Image.asset('assets/icons/confirm.png'),
                      ),
                      const SizedBox(height: 5),
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
                        margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
                        child: RichText(
                          text: TextSpan(
                              children: <TextSpan>[
                                const TextSpan(
                                    text: 'Enter the OTP sent to ',
                                    style: TextStyle(fontSize: 15)),
                                TextSpan(
                                    text: ' $phoneNumber',
                                    style: const TextStyle(
                                        fontSize: 17, fontWeight: FontWeight.bold)),
                              ],
                              style: const TextStyle(
                                  color: Colors.black54, fontSize: 15)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                        Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.only(right: 20),
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 2.0, color: Colors.white),
                              left: BorderSide(width: 2.0, color: Colors.white),
                              right: BorderSide(width: 2.0, color: Colors.white),
                              bottom: BorderSide(
                                  width: 2.0, color: CustomColors.primaryColor),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: TextField(
                            focusNode: focusOne,
                            style: const TextStyle(fontSize: 25, color: CustomColors.primaryColor, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(1)
                            ],
                            onChanged: (text) {
                              if(text.isNotEmpty){
                                if(controllerPinTwo.text.isEmpty){
                                  FocusScope.of(context).requestFocus(focusTwo);
                                }
                                else if(controllerPinThree.text.isEmpty){
                                  FocusScope.of(context).requestFocus(focusThree);
                                }
                                else if(controllerPinFour.text.isEmpty){
                                  FocusScope.of(context).requestFocus(focusFour);
                                }

                                // FocusScope.of(context).requestFocus(focusTwo);
                              }/*else if(text.isEmpty){
                          FocusScope.of(context).requestFocus(focusFour);
                        }*/
                            },
                            controller: controllerPinOne,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.only(right: 20),
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 2.0, color: Colors.white),
                              left: BorderSide(width: 2.0, color: Colors.white),
                              right: BorderSide(width: 2.0, color: Colors.white),
                              bottom: BorderSide(
                                  width: 2.0, color: CustomColors.primaryColor),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: TextField(
                            focusNode: focusTwo,
                            style: const TextStyle(fontSize: 25, color: CustomColors.primaryColor, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(1)
                            ],
                            onChanged: (text) {
                              if(text.isNotEmpty){
                                if(controllerPinThree.text.isEmpty){
                                  FocusScope.of(context).requestFocus(focusThree);
                                }
                                else if(controllerPinFour.text.isEmpty){
                                  FocusScope.of(context).requestFocus(focusFour);
                                }
                                else if(controllerPinOne.text.isEmpty){
                                  FocusScope.of(context).requestFocus(focusOne);
                                }
                              }else if(text.isEmpty){
                                FocusScope.of(context).requestFocus(focusOne);
                              }
                            },
                            controller: controllerPinTwo,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.only(right: 20),
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 2.0, color: Colors.white),
                              left: BorderSide(width: 2.0, color: Colors.white),
                              right: BorderSide(width: 2.0, color: Colors.white),
                              bottom: BorderSide(
                                  width: 2.0, color: CustomColors.primaryColor),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: TextField(
                            focusNode: focusThree,
                            style: const TextStyle(fontSize: 25, color: CustomColors.primaryColor, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(1)
                            ],
                            onChanged: (text) {
                              if(text.isNotEmpty){
                                // FocusScope.of(context).requestFocus(focusFour);
                                if(controllerPinFour.text.isEmpty){
                                  FocusScope.of(context).requestFocus(focusFour);
                                }
                                else if(controllerPinOne.text.isEmpty){
                                  FocusScope.of(context).requestFocus(focusOne);
                                }else if(controllerPinTwo.text.isEmpty){
                                  FocusScope.of(context).requestFocus(focusTwo);
                                }
                              }else if(text.isEmpty){
                                FocusScope.of(context).requestFocus(focusTwo);
                              }
                            },
                            controller: controllerPinThree,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.only(right: 20),
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 2.0, color: Colors.white),
                              left: BorderSide(width: 2.0, color: Colors.white),
                              right: BorderSide(width: 2.0, color: Colors.white),
                              bottom: BorderSide(
                                  width: 2.0, color: CustomColors.primaryColor),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: TextField(
                            focusNode: focusFour,
                            style: const TextStyle(fontSize: 25, color: CustomColors.primaryColor, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(1)
                            ],
                            onChanged: (text) {
                              if(text.isNotEmpty){
                                if(controllerPinOne.text.isEmpty){
                                  FocusScope.of(context).requestFocus(focusOne);
                                }else if(controllerPinTwo.text.isEmpty){
                                  FocusScope.of(context).requestFocus(focusTwo);
                                }
                                else if(controllerPinThree.text.isEmpty){
                                  FocusScope.of(context).requestFocus(focusThree);
                                }
                                // FocusScope.of(context).requestFocus(focusThree);
                              }else if(text.isEmpty){
                                FocusScope.of(context).requestFocus(focusThree);
                              }
                            },
                            controller: controllerPinFour,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ]),
                      (state is ErrorState)
                          ? Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          state.msg,
                          style: const TextStyle(color: Colors.red),
                        ),
                      )
                          : Container(),
                      Container(
                        margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
                        child: RichText(
                          text: TextSpan(
                              children: <TextSpan>[
                                const TextSpan(
                                    text: 'Don\'t receive the OTP? ',
                                    style: TextStyle(fontSize: 12)),
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => {},
                                    text: ' RESEND OTP',
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline)),
                              ],
                              style: const TextStyle(
                                  color: Colors.black54, fontSize: 15)),
                          textAlign: TextAlign.center,
                        ),
                      ),
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
                            'VERIFY & PROCEED',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                decoration: TextDecoration.underline),
                          ),
                          onPressed: () {
                            if(controllerPinTwo.text.toString().isEmpty || controllerPinThree.text.toString().isEmpty || controllerPinFour.text.toString().isEmpty || controllerPinOne.text.toString().isEmpty){
                              _bloc.add(ErrorEvent(
                                  msg: "Invalid Pin"));
                            }else {
                              _bloc.add(VerifyPinEvent(pin: controllerPinOne.text.toString()+controllerPinTwo.text.toString()+controllerPinThree.text.toString()+controllerPinFour.text.toString()));
                              // go to next page
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
}
