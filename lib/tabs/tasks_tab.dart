import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session_10_flutter6_todo/firebase/firebase_functions.dart';
import 'package:session_10_flutter6_todo/my_theme_data.dart';
import 'package:session_10_flutter6_todo/providers/my_provider.dart';
import 'package:session_10_flutter6_todo/task_item.dart';
import 'package:session_10_flutter6_todo/task_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TasksTab extends StatefulWidget {
  TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Column(
      children: [
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: DatePicker(
            locale: provider.languageCode,
            height: 90,
            DateTime.now(),
            initialSelectedDate: selectedDate,
            selectionColor: Colors.blue,
            selectedTextColor: Colors.white,
            onDateChange: (date) {
              selectedDate = date;
              setState(() {
                
              });
            },
          ),
        ),
        SizedBox(height: 16),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFunctions.getTasks(selectedDate),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Column(
                  children: [
                    Text("Something went wrong"),
                    ElevatedButton(onPressed: () {}, child: Text("Try again"))
                  ],
                );
              }
              List<TaskModel> tasksList =
                  snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
              if (tasksList.isEmpty) {
                return Center(
                    child: Text(
                  AppLocalizations.of(context)!.noTasksYet,
                  style: TextStyle(fontSize: 20,
                  color: provider.theme == MyTheme.lightColor ? Colors.black : Colors.white ),
                ));
              }
              return ListView.separated(
                itemBuilder: (context, index) {
                  return TaskItem(
                    model: tasksList[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 12,
                  );
                },
                itemCount: tasksList.length,
              );
            },
          ),
        )
      ],
    );
  }
}
