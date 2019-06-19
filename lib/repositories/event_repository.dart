import 'package:nearby/events/event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class EventsRepository{
  Future<List<Event>> getEvents(FirebaseUser user,int count);
  Stream<QuerySnapshot> getEventsStream(FirebaseUser user, int count);
  Future<DocumentReference> createEvent (Event events);
  Future<void> deleteEvent(Event events);
  Future<void> updateEvents(Event event);
}

class FireStoreEventsRepository extends EventsRepository{

  final fireStore = Firestore.instance;


  @override
  createEvent(Event event) {
    return fireStore.collection("events").add(event.toDocument());
  }

  @override
  deleteEvent(Event event) {
    return fireStore.collection("events").document(event.reference.documentID).delete();
  }

  @override
  Future<List<Event>> getEvents(FirebaseUser user,int count) async{

    final query = await fireStore.collection("events")
        .limit(count).getDocuments();

    return query.documents
        .map((document)=>Event.fromDocument(document)).toList();
  }

  @override
  Stream<QuerySnapshot> getEventsStream(FirebaseUser user, int count) {
    return fireStore.collection("events").limit(count).snapshots();
  }

  @override
  Future<void> updateEvents(Event event) {
    return fireStore.collection("events").document(event.reference.documentID)
        .updateData(event.toDocument());
  }

}