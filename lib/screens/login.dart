import 'package:flutter/material.dart';
import 'dart:io';

import 'package:geico_mock_login/widgets/cupertino_login_form.dart';
import 'package:geico_mock_login/widgets/material_login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return const CupertinoLoginForm();
    }
    return MaterialLoginForm(appBar: _buildAppBar());
  }

  /// Builds Platform specific app bar.
  PreferredSizeWidget _buildAppBar() {
    final PreferredSizeWidget appBar = AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      actions: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.map),
            ),
            const SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.mail),
            ),
            const SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.help),
            ),
            const SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
      ],
      title: Text(
        "Geico",
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Colors.white),
      ),
    );

    return appBar;
  }
}
