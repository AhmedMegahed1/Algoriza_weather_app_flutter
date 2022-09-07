import 'package:flutter/material.dart';


class HomeLoading extends StatelessWidget {
  const HomeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 3, 95),
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.yellow,
        ),
      ),
    );
  }
}
