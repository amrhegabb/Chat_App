import 'package:chat_app/Model/my_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  static CollectionReference<Myuser> getuserscollection() {
    return FirebaseFirestore.instance
        .collection(Myuser.collectionName)
        .withConverter(
            fromFirestore: (snapshot, options) =>
                Myuser.fromFireStore(snapshot.data()!),
            toFirestore: (user, options) => user.toFireStore());
  }

  static Future<Myuser?> insertuser(Myuser user) async {
    CollectionReference<Myuser> collection = getuserscollection();
    DocumentReference<Myuser> documentReference = collection.doc(user.id);
    var res = await documentReference.set(user);
    return user;
  }

  static Future<Myuser?> getuserbyid(String uid) async {
    CollectionReference<Myuser> collectionReference = getuserscollection();
    DocumentReference<Myuser> documentReference = collectionReference.doc(uid);
    var res = await documentReference.get();
    return res.data();
  }
}
