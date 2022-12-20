import 'package:flutter/material.dart';
import 'package:todo/model/todo_model.dart';
import 'package:todo/pages/todo_add.dart';
import 'package:todo/style/style.dart';
import 'package:todo/store/localstrore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TodoModel> listOfTodo = [];
  @override
  void initState() {
    getInfo();
    super.initState();
  }

  Future getInfo() async {
    listOfTodo = await LocalStrore.getListTodo();
    setState(() {});
  }

  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.primaryColor, 
        title: const Text(
          'TODO LIST',
          style: TextStyle(
            color: Style.whtieColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: listOfTodo.length,
        itemBuilder: (context, index) {
        return Row(
          children: [
            Checkbox(
                value: listOfTodo[index].isDone,
                onChanged: (value) {
                  listOfTodo[index].isDone = !listOfTodo[index].isDone;
                  LocalStrore.changeStatus(listOfTodo[index], index);
                  setState(() {});
                }),
            Text(
              listOfTodo[index].title,
              style: Style.textStyle(isDone: listOfTodo[index].isDone),
            )
          ],
        );
      }),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (a) => const TodoAdd()));
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Style.primaryColor,
          ),
          child: const Icon(
            Icons.add,
            color: Style.whtieColor,
          ),
        ),
      ),
    );
  }
}
