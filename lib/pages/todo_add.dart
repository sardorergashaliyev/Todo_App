import 'package:flutter/material.dart';
import 'package:todo/pages/home_page.dart';
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'TODO LIST',
          style: Style.textStyle(
              textColor: Style.whtieColor, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TextFormField(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          if (textEditingController.text.isNotEmpty) {
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
              style: Style.textStyle(
                textColor: Style.whtieColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}