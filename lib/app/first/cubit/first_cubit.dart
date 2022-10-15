import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'first_state.dart';

class FirstCubit extends Cubit<FirstState> {
  FirstCubit() : super(FirstState());
}
