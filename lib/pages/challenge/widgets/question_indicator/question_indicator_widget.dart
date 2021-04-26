import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatefulWidget {
  final int currentPage;
  final int length;
  const QuestionIndicatorWidget(
      {Key? key, required this.currentPage, required this.length})
      : super(key: key);

  @override
  _QuestionIndicatorWidgetState createState() =>
      _QuestionIndicatorWidgetState();
}

class _QuestionIndicatorWidgetState extends State<QuestionIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Questão ${widget.currentPage}",
                style: AppTextStyles.body,
              ),
              Text(
                "de ${widget.length}",
                style: AppTextStyles.body,
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ProgressIndicatorWidget(value: widget.currentPage / widget.length)
        ],
      ),
    );
  }
}
