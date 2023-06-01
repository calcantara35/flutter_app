import 'package:flutter/material.dart';

class MaterialLoginForm extends StatefulWidget {
  const MaterialLoginForm({super.key, required this.appBar});
  final PreferredSizeWidget appBar;

  @override
  State<MaterialLoginForm> createState() => _MaterialLoginFormState();
}

class _MaterialLoginFormState extends State<MaterialLoginForm> {
  final _form = GlobalKey<FormState>();
  var _isLogin = true;
  var _enteredEmail = "";
  var _enteredPassword = "";

  void submit() {
    final isValid = _form.currentState!.validate();
    if (isValid) {
      _form.currentState!.save();
      print(_enteredEmail);
      print(_enteredPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                        top: 10, bottom: 5, left: 5, right: 5),
                    width: 100,
                    child: Image.asset('assets/images/geico.jpeg',
                        fit: BoxFit.cover),
                  ),
                  Card(
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Form(
                        key: _form,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: "Email Address"),
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    !value.contains('@')) {
                                  return 'Please enter a valid email address.';
                                }

                                return null;
                              },
                              textCapitalization: TextCapitalization.none,
                              onSaved: (newValue) {
                                _enteredEmail = newValue!;
                              },
                            ),
                            TextFormField(
                              decoration:
                                  const InputDecoration(labelText: "Password"),
                              keyboardType: TextInputType.text,
                              autocorrect: false,
                              validator: (value) {
                                if (value == null || value.trim().length < 6) {
                                  return 'Password must contain at least 6 characters';
                                }

                                return null;
                              },
                              onSaved: (newValue) {
                                _enteredPassword = newValue!;
                              },
                              textCapitalization: TextCapitalization.none,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  submit();
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer),
                                child: Text(
                                    _isLogin ? "LOG IN" : "Create an Account")),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                });
                              },
                              child: Text(_isLogin
                                  ? "Sign Up"
                                  : "Already have an account?"),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
