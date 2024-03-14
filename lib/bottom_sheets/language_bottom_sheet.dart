// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session_10_flutter6_todo/my_theme_data.dart';
import 'package:session_10_flutter6_todo/providers/my_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage("en");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (provider.languageCode == "en")...[
                  Text(
                    "English",
                    style: TextStyle(
                      fontSize: 30,
                      color: MyTheme.primaryColor
                    ),
                  ),
                  Icon(
                    Icons.done,
                    size: 30,
                    color: MyTheme.primaryColor
                  ),
                ] else
                  Text(
                    "الإنجليزية",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black
                    ),
                  ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage("ar");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (provider.languageCode == "ar") ...[
                  Text(
                    "العربية",
                    style: TextStyle(
                      fontSize: 30,
                      color: MyTheme.primaryColor,
                    ),
                  ),
                  Icon(
                    Icons.done,
                    size: 30,
                    color: Colors.blue,
                  )
                ]
                else
                  Text(
                    "Arabic",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
