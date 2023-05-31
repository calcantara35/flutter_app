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
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(children: [
            Text(
              category.title,
              maxLines: 2,
              textAlign: TextAlign.center,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.systemBlue),
            ),
            Container(alignment: Alignment.center, child: category.image),
          ])),
    );
  }
}
