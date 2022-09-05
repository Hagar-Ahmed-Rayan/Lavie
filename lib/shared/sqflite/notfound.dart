import 'package:flutter/material.dart';
import 'package:plantsshop/shared/style.dart';
class NotFoundResultView extends StatelessWidget {
  const NotFoundResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 35,
        ),
        Image(
          image: const AssetImage(
            "images/pic.png",
          ),
          fit: BoxFit.cover,
          height: 250,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Your cart is empty",
          style: AppTextStyle.bodyText(),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Sorry, the keyword you entered cannot be found, please check again or search with another keyword.",
          textAlign: TextAlign.center,
          style: AppTextStyle.subTitle(),
        ),
      ],
    );
  }
}
