import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medtrack/authentication_module/model/user_model.dart';
import 'package:medtrack/core/network/local/cache_helper.dart';
import 'package:medtrack/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    debugPrint('onInit()');
    getUser();
  }

  @override
  void onReady() {
    super.onReady();
    debugPrint('onInit()');
  }

  @override
  void onClose() {
    super.onClose();
    debugPrint('onClose()');
  }

  ///sign out Function
  Future<void> register(
      {required String emailAddress,
      required String password,
      required String userName}) async {
    try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (userCredential != null) {
        userCreate(
          uId: userCredential!.user!.uid,
          email: emailAddress,
          name: userName,
        );
        getUser();
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
        getUser();
        CacheHelper.saveData(key: 'UserId', value: userCredential!.user!.uid);
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
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
        CacheHelper.saveData(key: 'UserId', value: userCredential!.user!.uid);
        getUser();
        Get.offNamed('/home');
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

  Future<UserCredential> signInWithFacebook() async {
    try {
      // Create a new instance of the FacebookLogin class
      final res = await FacebookLogin().logIn(permissions: [
        // Request permission to access the user's public profile and email address
        FacebookPermission.publicProfile,
        FacebookPermission.email,
      ]);

      // Get the Facebook access token from the result of the login
      final FacebookAccessToken accessToken = res.accessToken!;

      // Create an authentication credential using the Facebook access token
      final AuthCredential credential =
          FacebookAuthProvider.credential(accessToken.token);

      // Sign in to Firebase with the Facebook authentication credential
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Get the signed-in user from the user credential
      final user = userCredential.user!;

      // Create a user profile in Firebase Firestore
      await userCreate(
          uId: user.uid, email: user.email!, name: user.displayName!);
      getUser();
      CacheHelper.saveData(key: 'UserId', value: userCredential.user!.uid);
      // Use GetX to navigate to home screen
      Get.offNamed('/home');

      // Return the user credential for further processing
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Map error codes to error messages
      final errorMessages = {
        'account-exists-with-different-credential':
            'An account already exists with this email address',
        'invalid-credential': 'Invalid Facebook credentials',
      };
      // Get the corresponding error message for the error code, or a generic message if not found
      final errorMessage =
          errorMessages[e.code] ?? 'An unexpected error occurred';

      Get.snackbar(
        'Error',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
        shouldIconPulse: true,
      );

      // Rethrow the error for further handling
      rethrow;
    } catch (e) {
      Get.snackbar(
        'Error',
        'An unexpected error occurred',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
        shouldIconPulse: true,
      );

      // Rethrow the error for further handling
      rethrow;
    }
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
  Future<UserModel?> getUser() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('users').doc(uId).get();

      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        debugPrint('this is data$data');
        userModel = UserModel.fromJson(data);
      } else {
        return null;
      }
    } catch (error) {
      debugPrint('Error getting user data: $error');
      return null;
    }
  }

  ///Create User Data to firebase
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

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .set(userModel!.toMap());
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
