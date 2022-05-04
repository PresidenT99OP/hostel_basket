import 'package:firebase_auth/firebase_auth.dart';
import 'package:hostel_basket/modals/UserData.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create object firebase based user

  UserData? _userFromFirebaseUser(User user) {
    return user != null ? UserData(uid: user.uid) : null;
  }

// auth change user stream

  Stream<UserData> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!)!);
  }

  // signin function
  Future signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register function
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
