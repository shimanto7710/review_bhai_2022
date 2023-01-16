import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:review_bhai_2022/ui/user_details/user_details_bloc.dart';

import '../../SharedPref/prefManager.dart';
import '../../api/model/request_body/UserDetailRequestBody.dart';
import '../../core/MyColor.dart';
import '../../util/loader.dart';
import 'package:intl/intl.dart';

class UserDetailsScreen extends StatefulWidget {
  static const routeName = '/user_details';
  UserDetailsScreen({required this.id}) : super();
  late String id;
  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState(id: id);
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  late String id;
  _UserDetailsScreenState({required this.id}) : super();
  late UserDetailBloc _bloc;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _userNameController;
  late TextEditingController _emailController;
  late TextEditingController _genderController;
  late TextEditingController _userTypeController;

  String _genderGrop = "gender";
  String _userTypeGroup = "userType";

  final List<String> _gender_status = ["Male", "Female"];
  final List<String> _userTypeStatus = ["User", "Owner"];
  double screenWidth = 0;
  @override
  void initState() {
    _bloc = UserDetailBloc(context);
    _userNameController = TextEditingController();
    _emailController = TextEditingController();
    _genderController = TextEditingController();
    _userTypeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: const Text(
          "Detail Info",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: Colors.white,
      body: BlocProvider<UserDetailBloc>(
        create: (_) => _bloc,
        // ignore: missing_return
        child: BlocConsumer<UserDetailBloc, UserDetailState>(
          listener: (BuildContext context, UserDetailState state) {
            // ignore: missing_return
          },
          // ignore: missing_return
          builder: (BuildContext context, UserDetailState state) {
            if (state is LoadingState) {
              return Center(child: Loader.circular());
            } else {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Container(
                        margin: const EdgeInsets.only(top: 100),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: size.width,
                              margin:
                                  const EdgeInsets.only(left: 32, right: 32),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: CustomColors.primaryColor,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(3))),
                              child: SizedBox(
                                height: 50,
                                width: 200,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 16),
                                      child: const Icon(
                                        Icons.person,
                                        color: CustomColors.primaryColor,
                                        size: 26,
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 1,
                                      color: CustomColors.primaryColor,
                                      margin: const EdgeInsets.only(left: 16),
                                    ),
                                    Flexible(
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(
                                            left: 10, bottom: 0),
                                        child: TextFormField(
                                          /*validator: (value) {
                                      if (value.isEmpty) {
                                         Scaffold.of(context)
                                            .showSnackBar(SnackBar(content: Text('Data is in processing.')));
                                      }
                                      return null;
                                    },*/
                                          onChanged: (text) {},
                                          controller: _userNameController,
                                          style: const TextStyle(
                                              color: CustomColors.primaryColor,
                                              fontSize: 20),
                                          keyboardType: TextInputType.text,
                                          decoration: const InputDecoration(
                                            hintText: "User Name",
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              width: size.width,
                              margin:
                                  const EdgeInsets.only(left: 32, right: 32),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: CustomColors.primaryColor,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(3))),
                              child: SizedBox(
                                height: 50,
                                width: 200,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 16),
                                      child: const Icon(
                                        Icons.email,
                                        color: CustomColors.primaryColor,
                                        size: 26,
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 1,
                                      color: CustomColors.primaryColor,
                                      margin: const EdgeInsets.only(left: 16),
                                    ),
                                    Flexible(
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(
                                            left: 10, bottom: 0),
                                        child: TextFormField(
                                          /*validator: (value) {
                                      if (value.isEmpty) {
                                         Scaffold.of(context)
                                            .showSnackBar(SnackBar(content: Text('Data is in processing.')));
                                      }
                                      return null;
                                    },*/
                                          onChanged: (text) {},
                                          controller: _emailController,
                                          style: const TextStyle(
                                              color: CustomColors.primaryColor,
                                              fontSize: 20),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: const InputDecoration(
                                            hintText: "Email",
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              width: size.width,
                              margin:
                                  const EdgeInsets.only(left: 32, right: 32),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: CustomColors.primaryColor,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(3))),
                              child: SizedBox(
                                height: 50,
                                width: 200,
                                child: Row(
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.only(left: 16),
                                        child: Image.asset(
                                            "assets/icons/gender.png")),
                                    Container(
                                      height: 50,
                                      width: 1,
                                      color: CustomColors.primaryColor,
                                      margin: const EdgeInsets.only(left: 16),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(
                                          left: 10, bottom: 0),
                                      child: Container(
                                        child: RadioGroup<String>.builder(
                                          direction: Axis.horizontal,
                                          groupValue: _genderGrop,
                                          onChanged: (value) => setState(() {
                                            _genderGrop = value!;
                                          }),
                                          items: _gender_status,
                                          itemBuilder: (item) =>
                                              RadioButtonBuilder(
                                            item,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              width: size.width,
                              margin:
                                  const EdgeInsets.only(left: 32, right: 32),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: CustomColors.primaryColor,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(3))),
                              child: SizedBox(
                                height: 50,
                                width: 200,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 16),
                                      child: const Icon(
                                        Icons.supervised_user_circle,
                                        color: CustomColors.primaryColor,
                                        size: 26,
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 1,
                                      color: CustomColors.primaryColor,
                                      margin: const EdgeInsets.only(left: 16),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(
                                          left: 10, bottom: 0),
                                      child: RadioGroup<String>.builder(
                                        direction: Axis.horizontal,
                                        groupValue: _userTypeGroup,
                                        onChanged: (value) => setState(() {
                                          _userTypeGroup = value!;
                                        }),
                                        items: _userTypeStatus,
                                        itemBuilder: (item) =>
                                            RadioButtonBuilder(
                                          item,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              width: size.width,
                              margin:
                                  const EdgeInsets.only(left: 32, right: 32),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: CustomColors.primaryColor,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(3))),
                              child: SizedBox(
                                height: 50,
                                width: 200,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 16),
                                      child: const Icon(
                                        Icons.person,
                                        color: CustomColors.primaryColor,
                                        size: 26,
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 1,
                                      color: CustomColors.primaryColor,
                                      margin: const EdgeInsets.only(left: 16),
                                    ),
                                    Flexible(
                                      child: InkWell(
                                        // onTap: selectFromCamera,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          margin: const EdgeInsets.only(
                                              left: 10, bottom: 0),
                                          child: const Text(
                                              "Take a profile picture"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 50,
                              height: 45,
                              margin:
                                  const EdgeInsets.only(top: 50, bottom: 50),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: CustomColors.primaryColor
                                        .withOpacity(0.5),
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
                                    borderRadius: BorderRadius.circular(5.0)),
                                color: CustomColors.primaryColor,
                                onPressed: () async {
                                  if (_userNameController.text.isEmpty) {
                                    Scaffold.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Username cant be empty')));
                                  } else if (_emailController.text.isEmpty) {
                                    Scaffold.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Email cant be empty')));
                                  } else if (_genderGrop == "gender") {
                                    Scaffold.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Gender cant be empty')));
                                  } else if (_userTypeGroup == "userType") {
                                    Scaffold.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'User type cant be empty')));
                                  } else if (!emailValidation(
                                      _emailController.text)) {
                                    Scaffold.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text('Invalid Email')));
                                  } else {
                                    SharedPrefManager sp = SharedPrefManager();
                                    String phoneNumber = await sp.getPhone();

                                    UserDetailRequestBody userBody;
                                    var dateTime = DateTime.now();

                                    String formattedDate =
                                        DateFormat('yyyy-MM-ddTkk:mm')
                                            .format(dateTime);
                                    print(formattedDate);

                                    userBody = UserDetailRequestBody(
                                        phoneNumber: phoneNumber,
                                        email: _emailController.text,
                                        name: _userNameController.text,
                                        sex: (_genderGrop == "Male") ? 1 : 2,
                                        createdAt: formattedDate,
                                        dp: _userNameController.text,
                                        firebaseKey: "firebase",
                                        isFirstTime: 2,
                                        userType:
                                            (_userTypeGroup == "User") ? 1 : 2);
                                    _bloc.add(
                                        SubmitDataEvent( id: id,userBody: userBody));
                                    // _dummyDestination();
                                  }
                                  /*if(_formKey.currentState.validate()){
                            }*/
                                },
                                child: const Text(
                                  "Done",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  bool emailValidation(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }
}
