import 'package:bloc/bloc.dart';
import 'package:flutter_cbt_tpa_app/data/datasource/auth_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_event.dart';
part 'logout_state.dart';
part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(const _Initial()) {
    on<LogoutEvent>((event, emit) async {
      emit(const _Loading());
      final response = await AuthRemoteDatasource().logout();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(const _Success()),
      );
    });
  }
}
