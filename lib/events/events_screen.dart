import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nearby/repositories/event_repository.dart';


class EventsScreen extends StatefulWidget {

  final FirebaseUser user;
  final FireStoreEventsRepository fireStoreRepository;

  const EventsScreen({Key key, this.user, this.fireStoreRepository}) : super(key: key);

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
      ),
    );
  }
}
