import 'package:nearby/model/user.dart';

class Event {
  final String id;
  final String title;
  final String description;
  final User creator;
  final String location;
  final List<User> participants;
  final DateTime date;

  Event(
    this.id,
    this.title,
    this.description,
    this.creator,
    this.location,
    this.participants,
    this.date,
  );
}
