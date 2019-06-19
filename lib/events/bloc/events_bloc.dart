import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  @override
  EventsState get initialState => InitialEventsState();

  @override
  Stream<EventsState> mapEventToState(
    EventsEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
