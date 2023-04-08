import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medtrack/authentication_module/model/user_model.dart';

class AuthController extends GetxController {
  bool isPasswordLogin = true;
  bool isPasswordSignUp = true;
  UserModel? userModel;
  UserCredential? userCredential;
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  @override
  void onInit() {
    super.onInit();
    checkUserLoggedIn();
  }

  ///check if user logged in
  Future<User?> checkUserLoggedIn() async {
    user = auth.currentUser;
    if (user != null) {
      return user;
    } else {
      return null;
    }
  }

  ///sign out Function
  Future<void> register(
      {required String emailAddress,
      required String password,
      required String userName}) async {
    try {
      userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (userCredential != null) {
        userCreate(
          uId: userCredential!.user!.uid,
          email:emailAddress,
          name:userName,
        );
        userGet(uId: userCredential!.user!.uid);
        Get.toNamed('/login');
        Get.snackbar(
          "Register",
          'Successfully',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(vertical: 10),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
        Get.snackbar(
          "Error",
          e.message!,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          "Error",
          e.message!,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.redAccent,
          shouldIconPulse: true,
        );
        debugPrint('The account already exists for that email.');
      }
    }
  }

  /// Sign in Function
  Future<void> signIn(
      {required String emailAddress, required String password}) async {
    try {
      userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      if (userCredential != null) {
        Get.toNamed('/home');
        userGet(uId: userCredential!.user!.uid);
        Get.snackbar(
          "Login",
          'Successfully',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.green,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "Error",
          e.message!,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red,
          shouldIconPulse: true,
        );
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "Error",
          e.message!,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
        );
        debugPrint('Wrong password provided for that user.');
      }
    }
  }

  ///SIGN OUT
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed('/login');
  }

  ///SIGN IN WITH GOOGLE
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {}
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    try {
      userCredential = await auth.signInWithCredential(credential);

      if (userCredential != null) {
        userCreate(
          uId: userCredential!.user!.uid,
          email: userCredential!.user!.email!,
          name: userCredential!.user!.displayName!,
        );
        userGet(uId: userCredential!.user!.uid);
        Get.toNamed('/home');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        Get.snackbar(
          "Error",
          e.message!,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.redAccent,
          shouldIconPulse: true,
        );
      } else if (e.code == 'invalid-credential') {
        Get.snackbar(
          "Error",
          e.message!,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.redAccent,
          shouldIconPulse: true,
        );
      }
    }
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  ///TOGGLE Password
  void changePasswordVisibilitySignUp() {
    isPasswordSignUp = !isPasswordSignUp;
    update();
  }

  void changePasswordVisibilityLogin() {
    isPasswordLogin = !isPasswordLogin;
    update();
  }

  ///Get User data
  Future<UserModel?> userGet({
    required String uId,
  }) async {
    try {
      final doc =
          await FirebaseFirestore.instance.collection('users').doc(uId).get();
      if (doc.exists) {
        userModel = UserModel.fromJson(doc.data()!);
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      debugPrint('Error retrieving user: $e');
      throw Exception('Error retrieving user');
    }
  }

  ///Create User Data
  Future<void> userCreate({
    required String name,
    required String email,
    required String uId,
  }) async {
    userModel = UserModel(
      name: name,
      email: email,
      uid: uId,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel!.toMap())
        .then((value) {})
        .catchError((error) {
      debugPrint(error.toString());
    });
  }
}
