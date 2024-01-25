// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_cbt_tpa_app/core/constants/colors.dart';
import 'package:flutter_cbt_tpa_app/presentation/quiz/bloc/answer/answer_bloc.dart';
import 'package:flutter_cbt_tpa_app/presentation/quiz/bloc/daftar_soal/daftar_soal_bloc.dart';
import 'package:flutter_cbt_tpa_app/presentation/quiz/widgets/answer_choices.dart';

import '../../../core/components/buttons.dart';
import '../bloc/hitung_nilai/hitung_nilai_bloc.dart';

class QuizMultipleChoice extends StatefulWidget {
  final String kategori;
  const QuizMultipleChoice({
    Key? key,
    required this.kategori,
  }) : super(key: key);

  @override
  State<QuizMultipleChoice> createState() => _QuizMultipleChoiceState();
}

class _QuizMultipleChoiceState extends State<QuizMultipleChoice> {
  String selectedAnswer = '';
  String jawaban = '';

  @override
  Widget build(BuildContext context) {
    // final ValueNotifier<String> selectedAnswer = ValueNotifier("");

    return BlocBuilder<DaftarSoalBloc, DaftarSoalState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          success: (data, index, isNext) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    shadows: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.14),
                        blurRadius: 17,
                        offset: const Offset(0, 8),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Text(
                    data[index].pertanyaan,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 34.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnswerChoices(
                      label: data[index].jawabanA,
                      isSelected: selectedAnswer == data[index].jawabanA,
                      onChanged: (value) {
                        setState(() {
                          selectedAnswer = value;
                          jawaban = 'a';
                        });
                      },
                    ),
                    
                    const SizedBox(height: 16.0),
                    AnswerChoices(
                      label: data[index].jawabanB,
                      isSelected: selectedAnswer == data[index].jawabanB,
                      onChanged: (value) {
                        setState(() {
                          selectedAnswer = value;
                          jawaban = 'b';
                        });
                      },
                      
                    ),
                    const SizedBox(height: 16.0),
                    AnswerChoices(
                        label: data[index].jawabanC,
                        isSelected: selectedAnswer == data[index].jawabanC,
                        onChanged: (value) {
                          setState(() {
                            selectedAnswer = value;
                            jawaban = 'c';
                          });
                        }),
                    const SizedBox(height: 16.0,
                  ),
                    AnswerChoices(
                        label: data[index].jawabanD,
                        isSelected: selectedAnswer == data[index].jawabanD,
                        onChanged: (value) {
                          setState(() {
                            selectedAnswer = value;
                            jawaban = 'd';
                          });
                        }),
                  ],
                ),
                const SizedBox(height: 38.0),
                jawaban.isEmpty
                    ? Button.filled(
                        onPressed: () {},
                        disabled: true,
                        label: 'Selanjutnya',
                      )
                    : isNext
                        ? Button.filled(
                            onPressed: () {
                              context.read<AnswerBloc>().add(
                                    AnswerEvent.setAnswer(
                                      data[index].id,
                                      jawaban,
                                    ),
                                  );
                              context
                                  .read<DaftarSoalBloc>()
                                  .add(const DaftarSoalEvent.nextSoal());
                            },
                            label: 'Selanjutnya',
                          )
                        : Button.filled(
                            onPressed: () {
                              context.read<AnswerBloc>().add(
                                    AnswerEvent.setAnswer(
                                      data[index].id,
                                      jawaban,
                                    ),
                                  );
                              context
                                  .read<HitungNilaiBloc>()
                                  .add(HitungNilaiEvent.getNilai(widget.kategori));
                            },
                            label: 'Selesai',
                          ),
              ],
            );
          },
        );
      },
    );
  }
}
