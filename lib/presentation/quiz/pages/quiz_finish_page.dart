import 'package:flutter/material.dart';
import 'package:flutter_cbt_tpa_app/core/components/custom_scaffold.dart';
import 'package:flutter_cbt_tpa_app/core/constants/colors.dart';
import 'package:flutter_cbt_tpa_app/core/extensions/build_context_ext.dart';
import 'package:flutter_cbt_tpa_app/presentation/quiz/models/quiz_model.dart';
import 'package:flutter_cbt_tpa_app/presentation/quiz/widgets/countdown_timer.dart';
import 'package:flutter_cbt_tpa_app/presentation/quiz/widgets/quiz_result_last.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/components/buttons.dart';
import 'quiz_result_page.dart';

class QuizFinishPage extends StatefulWidget {
  final QuizModel data;
  final int timeRemaining;

  const QuizFinishPage({
    super.key,
    required this.data,
    required this.timeRemaining,
  });

  @override
  State<QuizFinishPage> createState() => _QuizFinishPageState();
}

class _QuizFinishPageState extends State<QuizFinishPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: Text(widget.data.name),
      actions: [
        Assets.icons.clock.image(width: 24.0),
        const SizedBox(width: 8.0),
        CountdownTimer(
          duration: widget.timeRemaining,
          onTimerCompletion: (timeRemaining) {},
        ),
        const SizedBox(width: 24.0),
      ],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Assets.images.finish.image(),
              const Text(
                'Yeavy Finish',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 42.0),
              Button.filled(
                onPressed: () => context.popToRoot(),
                label: 'Kembali ke Beranda',
                color: AppColors.white,
                textColor: AppColors.primary,
              ),
              const SizedBox(height: 28.0),
              Button.filled(
                onPressed: () => context.push(const QuizResultPage()),
                label: 'Lihat Hasil',
              )
            ],
          ),
        ),
      ),
    );
  }
}
