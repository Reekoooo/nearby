import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class EventsEvent extends Equatable {
  EventsEvent([List props = const []]) : super(props);
}


