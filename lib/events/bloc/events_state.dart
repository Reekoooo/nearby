import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class EventsState extends Equatable {
  EventsState([List props = const []]) : super(props);
}

class InitialEventsState extends EventsState {}
