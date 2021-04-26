import 'dart:core';
import 'package:dev_quiz/pages/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/pages/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:dev_quiz/pages/challenge/widgets/quiz/quiz_widget.dart';
import 'package:dev_quiz/pages/result/result_page.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:dev_quiz/store/challenge/challenge_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

final controller = ChallengeStore();

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;
  ChallengePage({Key? key, required this.questions, required this.title})
      : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length) {
      pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.linear);
    }
  }

  void onSelected(bool value) {
    if (value) {
      controller.correctAwnsers++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(87),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              Observer(
                builder: (_) {
                  return QuestionIndicatorWidget(
                      currentPage: controller.currentPage,
                      length: widget.questions.length);
                },
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map(
              (e) => QuizWidget(
                question: e,
                onSelected: onSelected,
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        minimum: EdgeInsets.only(bottom: 6),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Observer(
                builder: (_) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (controller.currentPage != widget.questions.length)
                          Expanded(
                              child: NextButtonWidget.white(
                            label: "Pular",
                            onTap: nextPage,
                          )),
                        if (controller.currentPage == widget.questions.length)
                          Expanded(
                            child: NextButtonWidget.green(
                              label: "Concluir",
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ResultPage(
                                              title: widget.title,
                                              length: widget.questions.length,
                                              result: controller.correctAwnsers,
                                            )));
                              },
                            ),
                          )
                      ],
                    ))),
      ),
    );
  }
}
