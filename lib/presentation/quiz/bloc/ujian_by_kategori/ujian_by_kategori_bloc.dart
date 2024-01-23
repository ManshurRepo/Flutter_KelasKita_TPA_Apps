import 'package:bloc/bloc.dart';
import 'package:flutter_cbt_tpa_app/data/datasource/ujian_remote_datasource.dart';
import 'package:flutter_cbt_tpa_app/data/models/responses/ujian_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ujian_by_kategori_event.dart';
part 'ujian_by_kategori_state.dart';
part 'ujian_by_kategori_bloc.freezed.dart';

class UjianByKategoriBloc
    extends Bloc<UjianByKategoriEvent, UjianByKategoriState> {
  final UjianRemoteDatasource ujianRemoteDatasource;
  UjianByKategoriBloc(
    this.ujianRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetUjianByKategori>((event, emit) async {
      emit(const _Loading());
      final response =
          await ujianRemoteDatasource.getUjianByKategori(event.kategori);
      response.fold((l) => emit(_Error(l)), (r) {
        if (r.data.isEmpty) {
          emit(const _Notfound());
        }else {
          emit(_Success(r));
      }
    });
  });
  }
}
