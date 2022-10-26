part of 'jokes_bloc.dart';

@immutable
abstract class JokesState extends Equatable {}

class JokesLoadingState extends JokesState {
  @override
  List<Object> get props => [];
}

class JokesLoadedState extends JokesState {
  late JokesModel jokesModel;

  JokesLoadedState(this.jokesModel);

  @override
  List<Object> get props => [jokesModel];
}

class JokesErrorState extends JokesState {
  String error;
  JokesErrorState(this.error);

  @override
  List<Object> get props => [error];
}
