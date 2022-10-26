import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jokes_bloc_app/models/jokesmodel.dart';
import 'package:jokes_bloc_app/networking/repositories/jokesrepository.dart';
import 'package:meta/meta.dart';

part 'jokes_event.dart';
part 'jokes_state.dart';

class JokesBloc extends Bloc<JokesEvent, JokesState> {
  late JokesRepository jokesRepository;

  JokesBloc(this.jokesRepository) : super(JokesLoadingState()) {
    on<JokesEvent>((event, emit) async {
      emit(JokesLoadingState());

      try {
        final result = await jokesRepository.getJoke();
        emit(JokesLoadedState(result));
      } catch (e) {
        emit(JokesErrorState(e.toString()));
      }
    });
  }
}
