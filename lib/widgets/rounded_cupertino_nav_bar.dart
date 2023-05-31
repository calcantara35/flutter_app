import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedCupertinoNavigationBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  const RoundedCupertinoNavigationBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      child: CupertinoNavigationBar(
        leading: Text("Geico".toUpperCase(),
            style: GoogleFonts.titilliumWeb(
                textStyle:
                    CupertinoTheme.of(context).textTheme.navTitleTextStyle)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CupertinoButton(
                padding: const EdgeInsets.all(0),
                onPressed: () => {},
                child: Icon(
                  CupertinoIcons.map,
                  color: CupertinoTheme.of(context).primaryContrastingColor,
                )),
            CupertinoButton(
                padding: const EdgeInsets.all(0),
                onPressed: () => {},
                child: Icon(
                  CupertinoIcons.mail,
                  color: CupertinoTheme.of(context).primaryContrastingColor,
                )),
            CupertinoButton(
                padding: const EdgeInsets.all(0),
                onPressed: () => {},
                child: Icon(
                  CupertinoIcons.question,
                  color: CupertinoTheme.of(context).primaryContrastingColor,
                )),
            CupertinoButton(
              padding: const EdgeInsets.all(0),
              onPressed: () => {},
              child: Icon(
                CupertinoIcons.settings,
                color: CupertinoTheme.of(context).primaryContrastingColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }
}
