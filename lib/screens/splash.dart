import 'package:flutter/cupertino.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(55, 114, 200, 1),
      child: SafeArea(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            "assets/images/geico.jpeg",
          ),
        ),
      ),
    );
  }
}
