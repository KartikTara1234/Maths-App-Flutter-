import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maths_quiz_app/constants.dart';
import 'package:maths_quiz_app/controllers/question_controller.dart';
import 'package:maths_quiz_app/screens/Quiz/Components/progressbar.dart';
import 'package:maths_quiz_app/screens/Quiz/Components/question_car.dart';
import 'package:websafe_svg/websafe_svg.dart';

class body extends StatelessWidget {
  const body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // QuestionController _questionController = Get.put(QuestionController());
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Obx(
                    () => Text.rich(
                      TextSpan(
                        text:
                            "Question ${_questionController.questionNumber.value}",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: kSecondaryColor),
                        children: [
                          TextSpan(
                              text: "/${_questionController.questions.length}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(color: kSecondaryColor)),
                        ],
                      ),
                    ),
                  )),
              Divider(
                thickness: 1.5,
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.UpdateqnNumber,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                    question: _questionController.questions[index],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}