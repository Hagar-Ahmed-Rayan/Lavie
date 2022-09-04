import 'package:flutter/material.dart';
import 'package:plantsshop/screens/homescreen.dart';
import 'package:plantsshop/shared/components.dart';
import 'package:plantsshop/shared/style.dart';


class QuizResultScreen extends StatelessWidget {
  QuizResultScreen({Key? key, required this.result}) : super(key: key);
  final int result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () {
            NavigationUtils.navigateAndClearStack(
              context: context,
              destinationScreen:homescreen(),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Result",
          style: AppTextStyle.appBarText(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Result is",
              style: AppTextStyle.headLine().copyWith(fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              result.toString(),
              style: AppTextStyle.headLine()
                  .copyWith(color: Colors.green, fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
