import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastmiam/src/data/models/client.dart';
import 'package:fastmiam/src/pages/phone_verification_page/phone_verification_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  late final String _verificationId;
  late final Client _client;

  Future<void> signUp(Client user) async {
    final String phone = user.phone as String;
    _client = user;
    await _isUserExist(phone).then((value) async {
      if (!value) {
        await _auth.verifyPhoneNumber(
          phoneNumber: phone,
          verificationCompleted: (phoneAuthCredential) =>
              _verificationCompleted(phoneAuthCredential),
          verificationFailed: (error) => _verificationFailed(error),
          codeSent: (verificationId, forceResendingToken) =>
              _codeSent(verificationId, forceResendingToken),
          codeAutoRetrievalTimeout: (verificationId) =>
              _codeAutoRetrievalTimeout,
        );
      } else {
        if (kDebugMode) {
          print('User already exist - please try to login');
        }
      }
    });
  }

  Future<void> login(phone) async {
    await _isUserExist(phone).then((value) async {
      if (value) {
        await _auth.verifyPhoneNumber(
          phoneNumber: phone,
          verificationCompleted: (phoneAuthCredential) =>
              _verificationCompleted(phoneAuthCredential),
          verificationFailed: (error) => _verificationFailed(error),
          codeSent: (verificationId, forceResendingToken) =>
              _codeSent(verificationId, forceResendingToken),
          codeAutoRetrievalTimeout: (verificationId) =>
              _codeAutoRetrievalTimeout,
        );
      } else {
        Get.snackbar('Cet utilisateur n\'existe pas',
            'veuillez verifier votre saisie ou creer un compte svp');
      }
    });
  }

  Future<void> verify(code) async {
    var cred = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: code);
    await _auth.signInWithCredential(cred).then((userCred) {
      _addUser(_client, userCred.user!.uid);
    });
  }

  _verificationCompleted(phoneAuthCredential) {
    _auth.signInWithCredential(phoneAuthCredential).then((value) {
      if (kDebugMode) {
        print('Succeeded');
      }
    });
  }

  _verificationFailed(FirebaseAuthException error) {
    if (kDebugMode) {
      print(error.message);
    }
  }

  _codeSent(verificationId, forceResendToken) {
    _verificationId = verificationId;
    Get.toNamed(PhoneVerificationPage.routeName);
    if (kDebugMode) {
      print('Code has been sent');
    }
  }

  _codeAutoRetrievalTimeout(verificationId) {
    if (kDebugMode) {
      print('Verification timed-out');
    }
  }

  Future<bool> _isUserExist(number) async {
    bool exist = await db
        .collection('clients')
        .where('phone', isEqualTo: number)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        if (kDebugMode) {
          print('User already exist');
        }
        if (kDebugMode) {
          print(value.docs);
        }
        return true;
      } else {
        return false;
      }
    });
    return exist;
  }

  Future<void> _addUser(Client client, String userId) async {
    await db
        .collection('clients')
        .doc(userId)
        .set(client.toMap())
        .then((value) {
      if (kDebugMode) {
        print('user added to database');
      }
    });
  }
}
