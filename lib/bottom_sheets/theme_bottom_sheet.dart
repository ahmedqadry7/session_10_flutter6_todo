// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session_10_flutter6_todo/my_theme_data.dart';
import 'package:session_10_flutter6_todo/providers/my_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(MyTheme.lightColor);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Light",
                  style: TextStyle(
                    fontSize: 30,
                    color: provider.theme == MyTheme.lightColor
                        ? MyTheme.primaryColor
                        : Colors.black,
                  ),
                ),
                if (provider.theme == MyTheme.lightColor) ...[
                  Icon(Icons.done, size: 30, color: MyTheme.primaryColor),
                ]
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(MyTheme.darkColor);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark",
                  style: TextStyle(
                    fontSize: 30,
                    color: provider.theme == MyTheme.darkColor
                        ? MyTheme.primaryColor
                        : Colors.black,
                  ),
                ),
                if (provider.theme == MyTheme.darkColor) ...[
                  Icon(Icons.done, size: 30, color: MyTheme.primaryColor),
                ]
              ],
            ),
          )
        ],
      ),
    );
  }
}
