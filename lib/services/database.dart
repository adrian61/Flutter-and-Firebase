import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference testCollection =
      Firestore.instance.collection('testCollection');

  Future updateUserData(String name, Map word, List count) async {
    return await testCollection
        .document(uid)
        .setData({'name': name, 'word': word, 'count': count});
  }

  Stream<QuerySnapshot> get testSnapshot {
    return testCollection.snapshots();
  }
}
