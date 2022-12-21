import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/component/unfocused.dart';
import 'package:todo/model/todo_model.dart';
import 'package:todo/pages/home/home_page.dart';
import 'package:todo/store/localstrore.dart';
import 'package:todo/style/style.dart';
import 'dart:io' show Platform;

class EditTodoPage extends StatefulWidget {
  final TodoModel todoModel;
  final int index;
  const EditTodoPage({super.key, required this.todoModel, required this.index});

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  TextEditingController textEditingController = TextEditingController();
  bool isEmpty = true;
  String oldTitle = '';

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    oldTitle = widget.todoModel.title;
    textEditingController.text = widget.todoModel.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Platform.isAndroid
            ? showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Save?'),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            LocalStrore.editLocal(
                                TodoModel(
                                    title: textEditingController.text,
                                    isDone: widget.todoModel.isDone),
                                widget.index);
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (a) => const HomePage()),
                                (route) => false);
                          },
                          child: const Text('Yes')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (a) => const HomePage()),
                                (route) => false);
                          },
                          child: const Text('No')),
                    ],
                  );
                },
              )
            : showCupertinoDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog();
                });
        return Future.value(false);
      },
      child: OnUnFocusTap(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Style.primaryColor,
            centerTitle: true,
            title: Text(
              'EDIT TODO',
              style: Style.textStyleNormal(
                  textColor: Style.whtieColor, fontWeight: FontWeight.w600),
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                autofocus: true,
                controller: textEditingController,
                onChanged: (value) {
                  if (oldTitle == value || value.isEmpty) {
                    isEmpty = true;
                  } else {
                    isEmpty = false;
                  }
                  setState(() {});
                },
                maxLines: 2,
                decoration: const InputDecoration(
                  label: Text('Edit Todo'),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: InkWell(
            onTap: () {
              if (!isEmpty) {
                LocalStrore.editLocal(
                    TodoModel(
                        title: textEditingController.text,
                        isDone: widget.todoModel.isDone),
                    widget.index);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (a) => const HomePage()),
                    (route) => false);
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient:
                      !isEmpty ? Style.primaryGradient : Style.enabledGradient),
              child: Center(
                child: Text(
                  'Edit',
                  style: Style.textStyleNormal(
                    textColor: Style.whtieColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
