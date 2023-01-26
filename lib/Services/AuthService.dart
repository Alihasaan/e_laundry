import 'package:e_laundry/Screens/LoginSignupScreen.dart';
import 'package:e_laundry/Screens/ShopOrderScreen.dart';
import 'package:e_laundry/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  signInPhone(AuthCredential authCrd) {
    try {
      FirebaseAuth.instance.signInWithCredential(authCrd);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }

  signInWithOTP(smsCode, verId) {
    try {
      AuthCredential authCredential =
          PhoneAuthProvider.credential(verificationId: verId, smsCode: smsCode);
      signInPhone(authCredential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }

  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return MyHomePage();
          } else {
            return LoginSignup();
          }
        });
  }

  final FirebaseAuth _firebaseAuth;
  AuthService(this._firebaseAuth);
  final db = FirebaseFirestore.instance;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String?> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      print("User Signed In");
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    print("User Signed Out");
  }

  Future<String?> signUp(
    String email,
    String password,
    String name,
  ) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("!---------! Siging Up");
      // ignore: deprecated_member_use
      await FirebaseAuth.instance.currentUser!.updateProfile(displayName: name);

      return "Account created";
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }

  Future<String> addOrder(
    String orderType,
    String userID,
    String userName,
    int shirts,
    int pants,
    int suits,
    int totalPrice,
    String userNotes,
  ) async {
    try {
      await db.collection("Orders").add({
        'Order Type:': orderType,
        'Price': totalPrice,
        'UserId': userID,
        'UserName': userName,
        'No. of Shirts ': shirts,
        'No. of Pants ': pants,
        'No. of Suits ': suits,
        'Extra Notes': userNotes
      });
    } catch (e) {
      print(e);
    }
    return "Success";
  }

  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
