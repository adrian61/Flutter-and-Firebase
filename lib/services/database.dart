import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterprojects/models/translation.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference translationCollection =
      Firestore.instance.collection('translationCollection');


  Future updateUserData(String name, Map word, List count) async {
    return await translationCollection
        .document(uid)
        .setData({'name': name, 'word': word, 'count': count});
  }
  // translation list from snapshot
  List<Translation> _translationListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Translation(
        name: doc.data['name'] ?? '',
        translationMap: doc.data['word'] ?? '',
        counter: doc.data['count'] ?? ''
      );
    }).toList();
  }

  // get translation snapshot
  Stream<List<Translation>> get translationSnapshot {
    return translationCollection.snapshots().map(_translationListFromSnapshot);
  }
}
