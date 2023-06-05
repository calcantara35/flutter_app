import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// fire base object that is maintained in the SDK
final _firebase = FirebaseAuth.instance;

class LogOutScreen extends StatelessWidget {
  const LogOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// <Summary>
    /// Logs the user out when the logout button has been pressed
    /// this is the only thing we have to do because we are listening to events
    /// in the main.dart file and firebase will emmit a new event, erase the
    /// token, and the streambuilder will trigger the Login page.
    /// </Summary>
    void logOut() {
      //
      _firebase.signOut();
      Navigator.of(context).pop();
    }

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            const CupertinoSliverNavigationBar(
              largeTitle: Text(
                "Settings",
                style: TextStyle(fontSize: 35),
              ),
            )
          ];
        },
        body: SafeArea(
          child: Column(
            children: <Widget>[
              CupertinoListSection(
                header: Row(
                  children: <Widget>[
                    Icon(
                      CupertinoIcons.bell_circle_fill,
                      size: 40,
                      color: CupertinoTheme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Settings",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                children: <CupertinoListTile>[
                  CupertinoListTile(
                      title: const Text('Notifications'),
                      padding: const EdgeInsetsDirectional.only(start: 60),
                      trailing: CupertinoButton(
                          onPressed: () {},
                          child: Icon(CupertinoIcons.right_chevron,
                              size: CupertinoTheme.of(context)
                                  .textTheme
                                  .textStyle
                                  .fontSize,
                              color: CupertinoColors.systemGrey2
                                  .resolveFrom(context)))),
                  CupertinoListTile(
                    title: const Text('Login Settings'),
                    padding: const EdgeInsetsDirectional.only(start: 60),
                    trailing: CupertinoButton(
                        onPressed: () {},
                        child: Icon(CupertinoIcons.right_chevron,
                            size: CupertinoTheme.of(context)
                                .textTheme
                                .textStyle
                                .fontSize,
                            color: CupertinoColors.systemGrey2
                                .resolveFrom(context))),
                  ),
                  CupertinoListTile(
                    title: const Text('DriveEasy Settings'),
                    padding: const EdgeInsetsDirectional.only(start: 60),
                    trailing: CupertinoButton(
                        onPressed: () {},
                        child: Icon(CupertinoIcons.right_chevron,
                            size: CupertinoTheme.of(context)
                                .textTheme
                                .textStyle
                                .fontSize,
                            color: CupertinoColors.systemGrey2
                                .resolveFrom(context))),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: CupertinoButton(
                    child: const Text("Logout"), onPressed: () => logOut()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
