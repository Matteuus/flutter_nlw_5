import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/pages/challenge/challenge_page.dart';
import 'package:dev_quiz/pages/home/widgets/app_bar/app_bar_widget.dart';
import 'package:dev_quiz/pages/home/widgets/level_button/level_button_widget.dart';
import 'package:dev_quiz/pages/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:dev_quiz/store/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

final controller = HomeStore();

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.user != null && controller.quizzes != null) {
        return Scaffold(
          appBar: AppBarWidget(
            user: controller.user!,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LevelButtonWidget(
                      label: "Fácil",
                      onTap: () {
                        controller.getQuizzesNivel("facil");
                      },
                    ),
                    LevelButtonWidget(
                      label: "Médio",
                      onTap: () {
                        controller.getQuizzesNivel("medio");
                      },
                    ),
                    LevelButtonWidget(
                      label: "Difícil",
                      onTap: () {
                        controller.getQuizzesNivel("dificil");
                      },
                    ),
                    LevelButtonWidget(
                      label: "Perito",
                      onTap: () {
                        controller.getQuizzesNivel("perito");
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    crossAxisCount: 2,
                    children: controller.quizzesNivel!.isEmpty
                        ? controller.quizzes!
                            .map((e) => QuizCardWidget(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ChallengePage(
                                                  questions: e.questions,
                                                  title: e.title,
                                                )));
                                  },
                                  title: e.title,
                                  percent:
                                      e.questionAnswered / e.questions.length,
                                  completed:
                                      "${e.questionAnswered}/${e.questions.length}",
                                ))
                            .toList()
                        : controller.quizzesNivel!
                            .map((e) => QuizCardWidget(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ChallengePage(
                                                  questions: e.questions,
                                                  title: e.title,
                                                )));
                                  },
                                  title: e.title,
                                  percent:
                                      e.questionAnswered / e.questions.length,
                                  completed:
                                      "${e.questionAnswered}/${e.questions.length}",
                                ))
                            .toList(),
                  ),
                )
              ],
            ),
          ),
        );
      } else if (controller.user == null && controller.quizzes == null) {
        return Scaffold(
            body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ));
      } else {
        return Scaffold(
            body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ));
      }
    });
  }
}
