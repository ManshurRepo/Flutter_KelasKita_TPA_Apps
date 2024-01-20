import 'package:bloc/bloc.dart';
import 'package:flutter_cbt_tpa_app/data/datasource/content_remote_datasource.dart';
import 'package:flutter_cbt_tpa_app/data/models/responses/content_respon_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_event.dart';
part 'content_state.dart';
part 'content_bloc.freezed.dart';


class ContentBloc extends Bloc<ContentEvent, ContentState> {
  final ContentRemoteDatasource contentRemoteDatasource;
  ContentBloc(
    this.contentRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetContentById>((event, emit) async {
      emit(const _Loading());
      final response = await contentRemoteDatasource.getContentById(event.id);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
