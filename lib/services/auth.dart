import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_maker_app/models/user.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  User1 _userFromFirebaseUser(User user) {
    /*get user id and use shared preferences*/
    return user != null ? User1(uid: user.uid) : null;
  }

  /*Functions which are refered in SignIn and SignUp*/
  Future signInEmailAndPass(String email, String password) async {
    try {
      // AuthResult authResult = await _auth.signInWithEmailAndPassword(
      //     email: email, password: password);
      /*This function waits as it sends the request to server and accept whatever we get in return
      * Without await, the function wouldn't wait till it returns and would be NULL*/
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // FirebaseUser firebaseUser = authResult.user;
      User firebaseUser = authResult.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }

  /*Above code will be used for SignIn*/
  /*Below code will be used for SignUp*/
  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = authResult.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
/*
*
Starting from Version firebase_auth 0.18.0:

FirebaseUser has been changed to User

AuthResult has been changed to UserCredential

GoogleAuthProvider.getCredential() has been changed to GoogleAuthProvider.credential()

onAuthStateChanged which notifies about changes to the user's sign-in state was replaced with authStateChanges()

currentUser() which is a method to retrieve the currently logged in user, was replaced with the property currentUser and it no longer returns a Future<FirebaseUser>

* */
