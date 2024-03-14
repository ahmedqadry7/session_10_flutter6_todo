import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session_10_flutter6_todo/bottom_sheets/language_bottom_sheet.dart';
import 'package:session_10_flutter6_todo/bottom_sheets/theme_bottom_sheet.dart';
import 'package:session_10_flutter6_todo/my_theme_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:session_10_flutter6_todo/providers/my_provider.dart';


class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: TextStyle(fontSize: 25 , fontWeight: FontWeight.w700,
            color: provider.theme == MyTheme.lightColor ? Colors.black : Colors.white),
          ),
          SizedBox(height: 16),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isDismissible: true,
                isScrollControlled: true,
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.60,
                    child: LanguageBottomSheet(),
                  );
                },
              );
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: MyTheme.primaryColor),
              ),
              child: Row(
                children: [
                  Text(
                    provider.languageCode == "en" ? "English" : "العربية",
                    style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w500,
                    color: provider.theme == MyTheme.lightColor ? Colors.black : Colors.white),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_drop_down , size: 30,color: provider.theme == MyTheme.lightColor ? Colors.black : Colors.white,)
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: TextStyle(fontSize: 25 , fontWeight: FontWeight.w700,
            color: provider.theme == MyTheme.lightColor ? Colors.black : Colors.white),
          ),
          SizedBox(height: 16),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isDismissible: true,
                isScrollControlled: true,
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.60,
                    child: ThemeBottomSheet(),
                  );
                },
              );
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.blue),
              ),
              child: Row(
                children: [
                  Text(
                    provider.theme == MyTheme.lightColor ? "Light" : "Dark",
                    style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w500,
                    color: provider.theme == MyTheme.lightColor ? Colors.black : Colors.white),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_drop_down,size: 30,color: provider.theme == MyTheme.lightColor ? Colors.black : Colors.white,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}