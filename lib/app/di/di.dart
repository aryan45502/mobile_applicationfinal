import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:wedplan/core/network/api_service.dart';
import 'package:wedplan/core/network/hive_service.dart';
import 'package:wedplan/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:wedplan/features/auth/data/data_source/remote_data_source.dart/auth_remote_datasource.dart';
import 'package:wedplan/features/auth/data/repository/auth_local_repository.dart';
import 'package:wedplan/features/auth/data/repository/auth_remote_repository/auth_remote_repository.dart';
import 'package:wedplan/features/auth/domain/repository/auth_repository.dart';
import 'package:wedplan/features/auth/domain/use_case/login_usecase.dart';
import 'package:wedplan/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:wedplan/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:wedplan/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:wedplan/features/auth/presentation/view_model/register/register_bloc.dart';
import 'package:wedplan/features/home/presentation/view_model/home_cubit.dart';



final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // First initialize hive service
  await _initHiveService();
  await initApiService();


  await _initHomeDependencies();
  await __initRegisterDependencies();
  await _initLoginDependencies();

}

initApiService() {
  getIt.registerLazySingleton<Dio>(
    () => ApiService(Dio()).dio,
  );
}

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}


_initLoginDependencies() async {
  getIt.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(
      getIt<AuthRemoteRepository>(),
    ),
  );
  getIt.registerLazySingleton<LoginBloc>(()=>LoginBloc(registerBloc: getIt(), homeCubit: getIt(), loginUseCase:getIt() ));


}


__initRegisterDependencies() {

  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(hiveService: getIt<HiveService>()),
  );

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt<Dio>()),
  );

  // =========================== Repository ===========================

  getIt.registerLazySingleton(
    () => AuthLocalRepository(authLocalDataSource: getIt<AuthLocalDataSource>()),
  );
  getIt.registerLazySingleton<AuthRemoteRepository>(
    () => AuthRemoteRepository(getIt<AuthRemoteDataSource>()),
  );

  // =========================== Usecases ===========================
  getIt.registerLazySingleton<RegisterUserUsecase>(
    () => RegisterUserUsecase(
      authRepository: getIt<AuthRemoteRepository>(),

    ),
  );

  getIt.registerLazySingleton<UploadImageUsecase>(
    () => UploadImageUsecase(
      getIt<AuthRemoteRepository>(),
    ),
  );

  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
   
      registerUseCase: getIt(),
      uploadImageUsecase: getIt(),
    ),
  );
}





_initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
}



// _initSplashScreenDependencies() async {
//   getIt.registerFactory<SplashCubit>(
//     () => SplashCubit(getIt<LoginBloc>()),
//   );
// }
