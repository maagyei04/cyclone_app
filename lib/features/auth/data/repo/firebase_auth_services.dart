

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPAssword(String email, String password) async {

    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (e) {
      // ignore: avoid_print
      print("Some error occured");
    }
  return null;

  }


  Future<User?> signInWithEmailAndPAssword(String email, String password) async {

    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (e) {
      // ignore: avoid_print
      print("Some error occured");
    }
  return null;

}

}