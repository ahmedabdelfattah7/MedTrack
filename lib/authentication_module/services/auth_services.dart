import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medtrack/authentication_module/model/user_model.dart';
import 'package:medtrack/core/network/local/cache_helper.dart';
import 'package:medtrack/core/utils/constants.dart';

class AuthServices extends GetxService {
  UserModel? userModel;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<bool> register({
    required String emailAddress,
    required String password,
    required String userName,
  }) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    userCreate(
      uId: FirebaseAuth.instance.currentUser!.uid,
      email: emailAddress,
      name: userName,
    );
    return true;
  }

  /// Sign in Function
  Future<bool> signIn(
      {required String emailAddress, required String password}) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);
    String name = userCredential.user!.displayName ?? emailAddress;
    userCreate(uId: userCredential.user!.uid, email: emailAddress, name: name);
    return true;
  }
  ///SIGN IN WITH GOOGLE
  Future<UserCredential> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential = await auth.signInWithCredential(credential);
    userCreate(
      uId: userCredential.user!.uid,
      email: userCredential.user!.email!,
      name: userCredential.user!.displayName!,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    final res = await FacebookLogin().logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    final FacebookAccessToken accessToken = res.accessToken!;
    final AuthCredential credential =
        FacebookAuthProvider.credential(accessToken.token);
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final user = userCredential.user!;
     userCreate(
        uId: user.uid, email: user.email!, name: user.displayName!);
    return userCredential;
  }

  ///Create User Data to firebase
  Future<bool> userCreate({
    required  String name,
    required String email,
    required String uId,
  }) async {
    userModel = UserModel(
      name: name ,
      email: email,
      uid: uId,
    );
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .set(userModel!.toMap());
      userUid = uId;
      CacheHelper.saveData(key: 'UserId', value: uId);
      await getUser();
      return true;
    } catch (error) {
      debugPrint(error.toString());
      return false;
    }
  }

  ///Get User data
  Future<UserModel?> getUser() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .get();
      final data = snapshot.data() as Map<String, dynamic>;
      debugPrint('this is data$data');
      return userModel = UserModel.fromJson(data);
    } catch (error) {
      debugPrint('Error getting user data: $error');
      return null;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
