import 'package:flutter/material.dart';
import 'package:todo/component/unfocused.dart';
import 'package:todo/model/todo_model.dart';
import 'package:todo/pages/home/home_page.dart';
import 'package:todo/store/localstrore.dart';
import 'package:todo/style/style.dart';

class TodoAdd extends StatefulWidget {
  const TodoAdd({super.key});

  @override
  State<TodoAdd> createState() => _TodoAddState();
}

class _TodoAddState extends State<TodoAdd> {
  TextEditingController textEditingController = TextEditingController();
  bool isEmpty = true;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        
        return Future.value(false);
      },
      child: OnUnFocusTap(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Style.primaryColor,
            centerTitle: true,
            title: Text(
              'TODO ADD',
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
                  if (value.isEmpty) {
                    isEmpty = true;
                  } else {
                    isEmpty = false;
                  }
                  setState(() {});
                },
                maxLines: 2,
                decoration: const InputDecoration(
                  label: Text('To Do Work'),
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
              if (textEditingController.text.isNotEmpty) {
                LocalStrore.setTodo(
                    TodoModel(title: textEditingController.text));

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
                  'Add',
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
