import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedplan/core/common/snackbar/my_snackbar.dart';
import 'package:wedplan/features/auth/domain/use_case/login_usecase.dart';
import 'package:wedplan/features/auth/presentation/view_model/register/register_bloc.dart';
import 'package:wedplan/features/home/presentation/view/home_page.dart';
import 'package:wedplan/features/home/presentation/view_model/home_cubit.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RegisterBloc _registerBloc;
  final HomeCubit _homeCubit;
  final LoginUsecase _loginUseCase;

  LoginBloc(
      {required RegisterBloc registerBloc,
      required HomeCubit homeCubit,
      required LoginUsecase loginUseCase})
      : _registerBloc = registerBloc,
        _loginUseCase = loginUseCase,
        _homeCubit = homeCubit,
        super(LoginState.initial()) {
    on<LoginUserEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      print(event.email);
      print(event.password);
      final result = await _loginUseCase(
        LoginParams(
          username: event.email,
          password: event.password,
        ),
      );
      print("login resukt: $result");

      result.fold(
        (failure) {
          emit(state.copyWith(isLoading: false, isSuccess: false));
          showMySnackBar(
            context: event.context,
            message: failure.message ?? "Login failed",
            color: Colors.red,
          );
        },
        (token) {
          print("Login token received: $token"); // Debugging

          // ✅ Fix: Check if the token is valid
          if (token.isNotEmpty) {
            emit(state.copyWith(isLoading: false, isSuccess: true));
            add(
              NavigateHomeScreenEvent(
                context: event.context,
                destination: const HomePage(),
              ),
            );
          } else {
            emit(state.copyWith(isLoading: false, isSuccess: false));
            showMySnackBar(
              context: event.context,
              message: "Invalid token received",
              color: Colors.red,
            );
          }
        },
      );
    });

    on<NavigateHomeScreenEvent>((event, emit) {
      Navigator.push(
          event.context,
          MaterialPageRoute(
            builder: (context) =>
                BlocProvider.value(value: _homeCubit, child: event.destination),
          ));
    });
    on<NavigateRegisterScreenEvent>((event, emit) {
      Navigator.push(
          event.context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: _registerBloc,
              child: event.destination,
            ),
          ));
    });
  }
}
