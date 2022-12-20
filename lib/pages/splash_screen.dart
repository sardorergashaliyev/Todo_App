import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:todo/pages/home_page.dart';
import 'package:todo/style/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = false;

  @override
  void initState() {
    isLoading = true;
    Future.delayed(const Duration(seconds: 4), () {
      isLoading = false;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (a) => const HomePage()), (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/Logo.png',
              height: 250,
              width: 250,
            ),
            Text(
              'Todo App',
              style: Style.textStyle(
                size: 26,
              ),
            ),
            12.verticalSpace,
            Text(
              'The best to do list application for you',
              style: Style.textStyle(size: 13),
            ),
            50.verticalSpace,
            isLoading
                ? LoadingAnimationWidget.beat(
                    color: Style.primaryColor, size: 40)
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
