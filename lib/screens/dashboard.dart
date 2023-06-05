import 'package:flutter/cupertino.dart';
import 'package:geico_mock_login/screens/logout.dart';
import 'package:google_fonts/google_fonts.dart';

enum activeTabBarIndices { myGeico, billing, dashboard, claims, featured }

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final currentTab = 2;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: CupertinoColors.white,
        currentIndex: currentTab,
        onTap: (value) {
          /// you can navigate through pages this way
          if (value == activeTabBarIndices.billing.index) {
            // Navigator.of(context).push(CupertinoPageRoute<void>())....
            print("Billing Page");
          }
          if (value == activeTabBarIndices.claims.index) {
            print("Claims Page");
          }
          if (value == activeTabBarIndices.featured.index) {
            print("Features Page");
          }
          if (value == activeTabBarIndices.myGeico.index) {
            print("My GEICO Page");
          }
          if (value == activeTabBarIndices.dashboard.index) {
            print("Dashboard Page");
          }
        },
        iconSize: 28,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: "My GEICO",
            backgroundColor: CupertinoColors.white,
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.money_dollar),
              label: "Billing",
              backgroundColor: CupertinoColors.white),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.graph_square_fill),
              label: "Dashboard",
              backgroundColor: CupertinoColors.white),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.doc_on_clipboard),
              label: "Claims",
              backgroundColor: CupertinoColors.white),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.star),
              label: "Featured",
              backgroundColor: CupertinoColors.white),
        ],
      ),
      backgroundColor: CupertinoColors.systemGrey5,
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: CupertinoTheme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 60,
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: Text("Geico".toUpperCase(),
                                      style: GoogleFonts.titilliumWeb(
                                          textStyle: CupertinoTheme.of(context)
                                              .textTheme
                                              .navTitleTextStyle)),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CupertinoButton(
                                    onPressed: () => {},
                                    child: Icon(
                                      CupertinoIcons.mail,
                                      size: 20,
                                      color: CupertinoTheme.of(context)
                                          .primaryContrastingColor,
                                    )),
                                CupertinoButton(
                                    onPressed: () => {},
                                    child: Icon(
                                      CupertinoIcons.chat_bubble_text_fill,
                                      size: 20,
                                      color: CupertinoTheme.of(context)
                                          .primaryContrastingColor,
                                    )),
                                CupertinoButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        CupertinoPageRoute(
                                            builder: (_) =>
                                                const LogOutScreen()));
                                  },
                                  child: Icon(
                                    CupertinoIcons.settings,
                                    size: 20,
                                    color: CupertinoTheme.of(context)
                                        .primaryContrastingColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Good morning, Cesar",
                              style: GoogleFonts.albertSans(
                                  textStyle: CupertinoTheme.of(context)
                                      .textTheme
                                      .navLargeTitleTextStyle),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Icon(
                              CupertinoIcons.sun_max_fill,
                              color: CupertinoTheme.of(context)
                                  .primaryContrastingColor,
                              size: 25,
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Last login: 06/02/2023 10:09 AM EDT",
                                style: GoogleFonts.albertSans(
                                    textStyle: CupertinoTheme.of(context)
                                        .textTheme
                                        .navActionTextStyle
                                        .copyWith(fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10.0, right: 10),
                    child: Row(
                      children: [
                        const Text("Viewing:"),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text(
                          "Auto",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: CupertinoTheme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: CupertinoButton(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              borderRadius: BorderRadius.circular(20),
                              child: Text(
                                "View All Policies",
                                style: CupertinoTheme.of(context)
                                    .textTheme
                                    .actionTextStyle
                                    .copyWith(
                                        fontSize: 15,
                                        color: CupertinoTheme.of(context)
                                            .primaryColor),
                              ),
                              onPressed: () {}),
                        )
                      ],
                    ),
                  ),
                ),

                /// < --- start of three cards --->
                Container(
                  color: CupertinoColors.white.withOpacity(.8),
                  height: 200,
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                    ),
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: CupertinoContextMenu.kEndBoxShadow,
                            color: CupertinoColors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 50,
                              width: 50,
                              padding: const EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color:
                                      CupertinoTheme.of(context).primaryColor),
                              margin: const EdgeInsets.only(left: 5),
                              child: Image.asset(
                                "assets/images/idcard.jpeg",
                                width: 50,
                                height: 25,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "View ID",
                                    style: CupertinoTheme.of(context)
                                        .textTheme
                                        .textStyle
                                        .copyWith(
                                            fontSize: 15,
                                            color: CupertinoColors.black),
                                  ),
                                  Text(
                                    "Cards",
                                    style: CupertinoTheme.of(context)
                                        .textTheme
                                        .textStyle
                                        .copyWith(
                                            fontSize: 15,
                                            color: CupertinoColors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: CupertinoContextMenu.kEndBoxShadow,
                            color: CupertinoColors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 50,
                              width: 50,
                              padding: const EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: CupertinoColors.systemOrange),
                              margin: const EdgeInsets.only(left: 5),
                              child: Image.asset(
                                "assets/images/pickuptruck.png",
                                width: 50,
                                height: 25,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: Text(
                                "Request Roadside Help",
                                style: CupertinoTheme.of(context)
                                    .textTheme
                                    .textStyle
                                    .copyWith(
                                        fontSize: 15,
                                        color: CupertinoColors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: CupertinoContextMenu.kEndBoxShadow,
                            color: CupertinoColors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 50,
                              width: 50,
                              padding: const EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: CupertinoColors.activeGreen),
                              margin: const EdgeInsets.only(left: 5),
                              child: const Icon(
                                CupertinoIcons.money_dollar_circle_fill,
                                size: 30,
                                color: CupertinoColors.white,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: Text(
                                "View Upcoming Withdrawl",
                                textAlign: TextAlign.left,
                                softWrap: true,
                                style: CupertinoTheme.of(context)
                                    .textTheme
                                    .textStyle
                                    .copyWith(
                                        fontSize: 15,
                                        color: CupertinoColors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /// <--- end of three cards --->
                Container(
                  color: CupertinoColors.white.withOpacity(.8),
                  height: 280,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: CupertinoContextMenu.kEndBoxShadow,
                        color: CupertinoColors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color:
                                      CupertinoTheme.of(context).primaryColor),
                              height: 30,
                              width: 30,
                              margin: const EdgeInsets.only(left: 15, top: 10),
                              child: const Icon(
                                CupertinoIcons.car_detailed,
                                color: CupertinoColors.white,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 15, top: 10),
                              child: Text(
                                "Your Driving Score",
                                style: CupertinoTheme.of(context)
                                    .textTheme
                                    .tabLabelTextStyle
                                    .copyWith(
                                        color: CupertinoColors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Image.asset("assets/images/driverscorebar.jpg"),
                        Container(
                          margin: const EdgeInsets.only(left: 12),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Updated: Jun 2, 2023",
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .actionTextStyle
                                .copyWith(color: CupertinoColors.black),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          margin: const EdgeInsets.only(top: 20, right: 10),
                          child: CupertinoButton.filled(
                              borderRadius: BorderRadius.circular(25),
                              child: const Text(
                                "DriveEasy Home",
                                softWrap: true,
                              ),
                              onPressed: () {}),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
