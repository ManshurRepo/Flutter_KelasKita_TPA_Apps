import 'package:bloc/bloc.dart';
import 'package:flutter_cbt_tpa_app/data/datasource/ujian_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hitung_nilai_event.dart';
part 'hitung_nilai_state.dart';
part 'hitung_nilai_bloc.freezed.dart';

class HitungNilaiBloc extends Bloc<HitungNilaiEvent, HitungNilaiState> {
  final UjianRemoteDatasource ujianRemoteDatasource;
  HitungNilaiBloc(
    this.ujianRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetNilai>((event, emit) async {
      emit(const _Loading());
      final response = await ujianRemoteDatasource.hitungNilai(event.kategori);
      emit(const _Success(100));
    });
  }
}
