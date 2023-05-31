import 'package:flutter/cupertino.dart';
import 'package:geico_mock_login/models/category.dart';

class CupertinoDashboardItem extends StatelessWidget {
  const CupertinoDashboardItem({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(
              color: CupertinoColors.black,
              width: 1,
            ),
            left: BorderSide(
              color: CupertinoColors.black,
              width: 1,
            ),
            bottom: BorderSide(
              color: CupertinoColors.black,
              width: 1,
            ),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(
                top: 10,
              ),
              child: Text(
                category.title,
                maxLines: 2,
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.black),
              ),
            ),
            Expanded(
                flex: 3,
                child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: category.image)),
          ],
        ),
      ),
    );
  }
}
