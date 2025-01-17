import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wedplan/features/home/presentation/view_model/home_state.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());
  void onTabTapped(int index){
    emit(state.copyWith(selectedIndex:index));
  }
}
