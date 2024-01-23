import 'package:bloc/bloc.dart';
import 'package:flutter_cbt_tpa_app/data/datasource/ujian_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_ujian_event.dart';
part 'create_ujian_state.dart';
part 'create_ujian_bloc.freezed.dart';

class CreateUjianBloc extends Bloc<CreateUjianEvent, CreateUjianState> {
  final UjianRemoteDatasource ujianRemoteDatasource;
  CreateUjianBloc(
    this.ujianRemoteDatasource,
  ) : super(const _Initial()) {
    on<CreateUjianEvent>((event, emit) async {
      emit(const _Loading());
      final response = await ujianRemoteDatasource.createUjian();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(const _Success()),
      );
    });
  }
}
