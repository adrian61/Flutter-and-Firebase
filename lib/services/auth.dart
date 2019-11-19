import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterprojects/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user){
    return user !=null ? User(uid: user.uid) : null;
  }
  Future signInAnonymously() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //TODO sign in with email & password
  Future signInEmail(Stream email, String password) async {}

  //TODO register with email & password
  Future registerEmail() async {}

//TODO sign out
  Future signOut() async {}
}
