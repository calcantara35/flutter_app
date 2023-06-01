import 'package:flutter/cupertino.dart';
import 'package:geico_mock_login/widgets/cupertino_dashboard_item.dart';
import 'package:geico_mock_login/widgets/rounded_cupertino_nav_bar.dart';
import 'package:geico_mock_login/models/category.dart';

class CupertinoLoginForm extends StatefulWidget {
  const CupertinoLoginForm({super.key});

  @override
  State<CupertinoLoginForm> createState() => _CupertinoLoginFormState();
}

class _CupertinoLoginFormState extends State<CupertinoLoginForm> {
  final categoryList = [
    Category(
        title: 'DriveEasy',
        image: Image.asset(
          "assets/images/steering_wheel.jpeg",
        )),
    Category(
        title: 'Geico Explore',
        image: Image.asset(
          "assets/images/map.png",
        )),
    Category(
        title: 'Roadside Assistance',
        image: Image.asset("assets/images/pickuptruck.png")),
    Category(
        title: 'Start a New Claim',
        image: Image.asset("assets/images/claim.png"))
  ];
  bool isLoading = false;
  bool _isLogin = true;
  bool obscureText = true;
  bool enableSavePassword = false;
  String? _errorUserNameText;
  String? _errorPasswordText;
  final _userNameEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();

  void login() {
    setState(() {
      isLoading = true;
      // Perform login logic here
      // You can call a login API or any other authentication mechanism
      // Use setState to update isLoading and trigger a rebuild of the widget
    });
    print(_userNameEditingController.text);
    print(_passwordEditingController.text);
  }

  /// <Summary>
  /// User ID/Email/Policy Number input field validation.
  /// Calls setState to update the UI in real time.
  /// </Summary>
  void _validateUserNameInput(String value) {
    setState(() {
      if (value.trim().characters.isEmpty) {
        _errorUserNameText = 'Field cannot be empty';
      } else {
        _errorUserNameText = null;
      }
    });
  }

  /// <Summary>
  /// Password input field validation.
  /// Calls setState to update the UI in real time.
  /// </Summary>
  void _validatePassword(String value) {
    setState(() {
      if (value.trim().characters.isEmpty) {
        _errorPasswordText = 'Field cannot be empty';
      } else {
        _errorPasswordText = null;
      }
    });
  }

  @override
  void dispose() {
    _userNameEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CupertinoPageScaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromRGBO(55, 114, 200, 1),
        navigationBar: const RoundedCupertinoNavigationBar(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(
                    top: 15, bottom: 2, left: 10, right: 10),
                child: Image.asset(
                  'assets/images/geico.jpeg',
                  fit: BoxFit.cover,
                  width: 200,
                  height: 100,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.only(top: 0, bottom: 0, right: 2, left: 2),
                margin: const EdgeInsets.only(
                    top: 0, bottom: 5, left: 10, right: 10),

                /// Email Input
                child: Column(
                  children: <Widget>[
                    CupertinoTextField(
                      prefix: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          CupertinoIcons.person_fill,
                          color: Color.fromARGB(255, 22, 74, 249),
                        ),
                      ),
                      placeholder: 'User ID/Email/Policy Number',
                      keyboardType: TextInputType.emailAddress,
                      controller: _userNameEditingController,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) => _validateUserNameInput(value),
                      onSubmitted: (value) {
                        _userNameEditingController.text = value;
                      },
                    ),
                    if (_errorUserNameText != null)
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(top: 4, left: 4),
                        child: Text(
                          _errorUserNameText!,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              color: CupertinoColors.destructiveRed,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.only(top: 5, bottom: 0, right: 2, left: 2),
                margin: const EdgeInsets.only(
                    top: 0, bottom: 0, left: 10, right: 10),

                /// password input
                child: Column(
                  children: [
                    CupertinoTextField(
                      prefix: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          CupertinoIcons.lock_fill,
                          color: Color.fromARGB(255, 22, 74, 249),
                        ),
                      ),
                      placeholder: 'Password',
                      controller: _passwordEditingController,
                      onChanged: (value) => _validatePassword(value),
                      obscureText: obscureText,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (value) {
                        _passwordEditingController.text = value;
                      },
                    ),
                    if (_errorPasswordText != null)
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(top: 4, left: 4),
                        child: Text(
                          _errorPasswordText!,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              color: CupertinoColors.destructiveRed,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                  ],
                ),
              ),

              /// switch to show password
              Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(
                    top: 2, bottom: 10, right: 10, left: 7),
                alignment: Alignment.topLeft,
                child: Row(
                  children: <Widget>[
                    CupertinoSwitch(
                      trackColor: CupertinoColors.lightBackgroundGray,
                      value: !obscureText,
                      onChanged: ((value) {
                        setState(() {
                          obscureText = !value;
                        });
                      }),
                    ),
                    Text(
                      "Show Password",
                      style: TextStyle(
                          color: CupertinoTheme.of(context)
                              .primaryContrastingColor),
                    )
                  ],
                ),
              ),
              // login button
              Container(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 10, left: 10),
                width: double.infinity,
                child: CupertinoButton(
                  borderRadius: const BorderRadius.all(Radius.zero),
                  color: const Color.fromARGB(255, 73, 164, 73),
                  onPressed: isLoading ? null : login,
                  child: isLoading
                      ? const CupertinoActivityIndicator()
                      : Text(
                          _isLogin
                              ? 'Log In'.toUpperCase()
                              : "Create Account".toUpperCase(),
                          style: TextStyle(
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                              color: CupertinoTheme.of(context)
                                  .primaryContrastingColor),
                        ),
                ),
              ),
              // forgot user id and signup
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CupertinoButton(
                        onPressed: () {},
                        child: Text(
                          "Forget User ID/Password?",
                          style: TextStyle(
                              color: CupertinoTheme.of(context)
                                  .primaryContrastingColor),
                        )),
                    CupertinoButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      child: Text(
                        _isLogin ? "Sign Up" : "Log in",
                        style: TextStyle(
                            color: CupertinoTheme.of(context)
                                .primaryContrastingColor),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 1),
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  // continue as a guest
                  child: CupertinoButton(
                    onPressed: () {},
                    child: Text(
                      "Continue as Guest",
                      style: TextStyle(
                          color: CupertinoTheme.of(context)
                              .primaryContrastingColor),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: CupertinoColors.white,
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  color: CupertinoTheme.of(context).barBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(3),
                    topRight: Radius.circular(3),
                  ),
                ),
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 10, right: 10),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/idcard.jpeg",
                      fit: BoxFit.cover,
                      width: 50,
                      height: 25,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "View Your Saved ID Cards",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: CupertinoTheme.of(context)
                              .primaryContrastingColor),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    const Icon(
                      CupertinoIcons.arrow_right,
                      color: CupertinoColors.white,
                    )
                  ],
                ),
              ),
              Container(
                height: 262,
                color: CupertinoColors.white,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                  ),
                  children: <Widget>[
                    for (final category in categoryList)
                      CupertinoDashboardItem(category: category)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
