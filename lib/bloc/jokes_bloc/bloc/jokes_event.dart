part of 'jokes_bloc.dart';

@immutable
abstract class JokesEvent extends Equatable {
  const JokesEvent();
}

class JokesLoadEvent extends JokesEvent {
  @override
  List<Object> get props => [];
}
