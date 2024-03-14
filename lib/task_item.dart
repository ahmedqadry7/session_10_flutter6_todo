// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:session_10_flutter6_todo/firebase/firebase_functions.dart';
import 'package:session_10_flutter6_todo/my_theme_data.dart';
import 'package:session_10_flutter6_todo/tabs/edit_task_tab.dart';
import 'package:session_10_flutter6_todo/task_model.dart';

class TaskItem extends StatefulWidget {
  TaskModel model;
  TaskItem({required this.model, super.key});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Slidable(
        startActionPane: ActionPane(
          motion: DrawerMotion(),
          extentRatio: 0.7,
          children: [
            SlidableAction(
              onPressed: (context) {
                FirebaseFunctions.deleteTask(widget.model.id);
              },
              backgroundColor: Colors.red,
              label: "Delete",
              icon: Icons.delete,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                bottomLeft: Radius.circular(18),
              ),
            ),
            SlidableAction(
              onPressed: (context) {
                Navigator.pushNamed(
                  context,
                  EditTask.routeName,
                  arguments: widget.model,
                );
              },
              backgroundColor: Colors.blue,
              label: "Edit",
              icon: Icons.edit,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              children: [
                SizedBox(width: 16),
                Container(
                  decoration: BoxDecoration(
                      color: widget.model.isDone
                          ? MyTheme.greenColor
                          : MyTheme.primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  width: 4,
                  height: 80,
                  margin: EdgeInsets.symmetric(vertical: 12),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ListTile(
                    title: Text(
                      widget.model.title,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: widget.model.isDone
                              ? MyTheme.greenColor
                              : Colors.black),
                    ),
                    subtitle: Text(
                      widget.model.description,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: widget.model.isDone
                              ? MyTheme.greenColor
                              : Colors.black),
                    ),
                    trailing: InkWell(
                      onTap: () {
                        widget.model.isDone = true;
                        FirebaseFunctions.taskDone(
                            TaskModel(
                              date: widget.model.date,
                              description: widget.model.description,
                              title: widget.model.title,
                              id: widget.model.id,
                              isDone: widget.model.isDone,
                            ),
                          );
                        setState(() {});
                      },
                      child: widget.model.isDone
                          ? Text(
                              "Done!",
                              style: TextStyle(
                                  color: MyTheme.greenColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: MyTheme.primaryColor),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 2),
                              child: Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
