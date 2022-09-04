import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantsshop/cubit/cubit.dart';
import 'package:plantsshop/cubit/states.dart';
import 'package:plantsshop/screens/QUIZ/2NDQUIZ.dart';
import 'package:plantsshop/shared/components.dart';
import 'package:plantsshop/shared/style.dart';
import 'package:navigation_utils/navigation_utils.dart';


class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Course Exam",
            style: TextStyle(
              fontSize: 23.0,
              fontWeight: FontWeight.w800,
              color: Colors.black,
              fontFamily: "Roboto",
              backgroundColor: Colors.green,
            ),
          ),
        backgroundColor: Colors.green,
      ),
      body: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var cubit = ShopLoginCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Question ",
                      style: TextStyle(
                        fontSize: 23.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontFamily: "Roboto",
                      ),
                    ),
                    Text(
                      (cubit.currentQuestion + 1).toString(),
                      style: AppTextStyle.headLine()
                          .copyWith(color: Colors.green),
                    ),
                    Text(
                      "/ ${cubit.questions.length}",
                      style: AppTextStyle.bodyText(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  cubit.questions[cubit.currentQuestion].question,
                  style: AppTextStyle.bodyText(),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          cubit.chooseAnswer(index);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.green),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(cubit
                                    .questions[cubit.currentQuestion]
                                    .answers[index]),
                              ),
                              Icon(
                                (cubit.questions[cubit.currentQuestion].userAnswerIndex ==index)
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                color: Colors.green
                              ),
                            ],
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                      itemCount: cubit.questions[cubit.currentQuestion].answers.length),
                ),
                Row(
                  children: [
                    if (!cubit.isFirst)
                      Expanded(
                        child: DefaultButton(
                          onPress: () {
                            cubit.backToPreviousQuestion();
                          },
                          hasBorder: true,
                          textColor: Colors.green,
                          backgroundColor: Colors.black,
                          text: "Back",
                          height: 40,
                          borderRadius: 10,
                        ),
                      )
                    else
                      const Expanded(
                        child: SizedBox(),
                      ),
                    SizedBox(
                      width: 10,
                    ),
                    if (!cubit.isLast) ...[
                      Expanded(
                        child: DefaultButton(
                          onPress: () {
                            cubit.moveToNextQuestion();
                          },
                          text: "Next",
                          height: 40,
                          borderRadius: 10,
                        ),
                      )
                    ] else ...[
                      Expanded(
                        child: DefaultButton(
                          height: 40,
                          borderRadius: 10,
                          onPress: () {
                            cubit.calculateResult();
                            debugPrint(cubit.correctAnswers.toString());
                            NavigationUtils.navigateTo(
                                context: context,
                                destinationScreen: QuizResultScreen(
                                    result: cubit.correctAnswers));
                          },
                          text: "Finish",
                        ),
                      )
                    ]
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
