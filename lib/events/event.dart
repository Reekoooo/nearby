import 'package:cloud_firestore/cloud_firestore.dart';

class Event{
  DocumentReference reference;
  String uid;
  String eventTitle;
  String eventDescription;
  DateTime dateTime;
  Event({
    this.reference,
    this.uid,
    this.eventTitle,
    this.eventDescription,
    this.dateTime

});

  factory Event.fromDocument(DocumentSnapshot document){
    return Event(
      reference: document.reference,
      uid: document.documentID,
      eventTitle: document.data['title'],
      eventDescription: document.data['description'],
      dateTime: document.data['datetime'],
    );
  }
  Map<String,dynamic> toDocument(){
    return {
      "title":this.eventTitle,
      "description":this.eventDescription,
      "datetime":this.dateTime.toUtc().toIso8601String()
    };
  }
  
}