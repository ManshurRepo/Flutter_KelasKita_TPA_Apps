import 'package:bloc/bloc.dart';
import 'package:flutter_cbt_tpa_app/data/datasource/materi_remote_datasource%20copy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/responses/materi_response_model.dart';

part 'materi_event.dart';
part 'materi_state.dart';
part 'materi_bloc.freezed.dart';

class MateriBloc extends Bloc<MateriEvent, MateriState> {
  final MateriRemoteDatasource materiRemoteDatasource;
  MateriBloc(
    this.materiRemoteDatasource,
  ) : super(const _Initial()) {
    on<MateriEvent>((event, emit) async {
      emit(const MateriState.loading());
      final response = await materiRemoteDatasource.getAllMateri();
      response.fold(
        (l) => emit(MateriState.error(l)),
        (r) => emit(MateriState.success(r)),
      );
    });
  }
}
