import 'package:flutter/material.dart';
import 'package:todo/pages/todo_add.dart';
import 'package:todo/style/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Column(
        children: [
          const SizedBox(height: 32),
          // 32.verticalSpace,
          Row(
            children: [
              const SizedBox(width: 32),
              // 32.horizontalSpace,
              Checkbox(
                onChanged: (bool? value) {
                  isCheck = !isCheck;
                  setState(() {});
                },
                value: isCheck,
              ),
              const SizedBox(width: 32),
              Text(
                'Flutter',
                style: Style.textStyle(isDone: isCheck),
              )
            ],
          ),
        ],
      ),
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
