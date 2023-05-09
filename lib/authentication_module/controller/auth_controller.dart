import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/authentication_module/model/user_model.dart';
import 'package:medtrack/authentication_module/services/auth_services.dart';
import 'package:medtrack/core/utils/enums.dart';

class AuthController extends GetxController {

  UserModel? userModel;
  UserCredential? userCredential;
  final Rx<RequestState> requestState = RequestState.loaded.obs;
  AuthServices authServices = Get.put(AuthServices());
  @override
  Future<void> onInit() async {
    super.onInit();
    getUser();
  }


  Future<void> register({
    required String emailAddress,
    required String password,
    required String userName,
  }) async {
    requestState.value = RequestState.loading;
    try {
      final data = await authServices.register(
        emailAddress: emailAddress,
        password: password,
        userName: userName,
      );
      if (data) {
        requestState.value = RequestState.loaded;
        Get.snackbar(
          "Success",
          'Registration successful!',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.green,
        );

        Get.toNamed('/login');
      }
    } catch (e) {
      requestState.value = RequestState.error;
      // handle error here
      debugPrint('Registration failed: ${e.toString()}');
      Get.snackbar(
        "Error",
        'Registration failed: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    } finally {
      requestState.value = RequestState.loaded;
    }
  }

  Future<void> signIn(
      {required String emailAddress, required String password}) async {
    requestState.value = RequestState.loading;
    try {
      final data = await authServices.signIn(
          emailAddress: emailAddress, password: password);
      if (data) {
        requestState.value = RequestState.loaded;
        Get.snackbar(
          "Success",
          'Login is successful!',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.green,
        );
        Get.toNamed('/AppLayout');
      }

    } catch (e) {
      requestState.value = RequestState.error;
      // handle error here
      debugPrint('login failed: ${e.toString()}');
      Get.snackbar(
        "Error",
        'login failed: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    } finally {
      requestState.value = RequestState.loaded;
    }
  }

  Future<void> signInWithGoogle() async {
    requestState.value = RequestState.loading;
    try {
      userCredential = await authServices.signInWithGoogle();
      if (userCredential?.user?.uid != null) {
        requestState.value = RequestState.loaded;
        Get.snackbar(
          "Success",
          'Login is successful!',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.green,
        );
        Get.offNamed('/AppLayout');
      }
    } catch (e) {
      requestState.value = RequestState.error;
      // handle error here
      debugPrint('login failed: ${e.toString()}');
      Get.snackbar(
        "Error",
        'login failed: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    } finally {
      requestState.value = RequestState.loaded;
    }
  }

  Future<void> signInWithFacebook() async {
    requestState.value = RequestState.loading;

    try {
      userCredential = await authServices.signInWithFacebook();
      if (userCredential!.user?.uid != null) {
        requestState.value = RequestState.loaded;

        Get.snackbar(
          "Success",
          'Login is successful!',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.green,
        );

        Get.offNamed('/AppLayout');
      }
    } catch (e) {
      // Handle errors here
      debugPrint('Error signing in with Facebook: ${e.toString()}');
      Get.snackbar(
        'Error',
        'An unexpected error occurred',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
        shouldIconPulse: true,
      );
    } finally {
      requestState.value = RequestState.loaded;
    }
  }

  Future<void> signOut() async {
    try {
   await  authServices.signOut();
     Get.offNamed('/welcome');
    } catch (error) {
      debugPrint('Logout failed: $error');
    }
  }

  Future<void> getUser() async {
    try {
      final user = await authServices.getUser();
      if (user != null) {
        userModel = user;
        debugPrint('this is user ${userModel!.name}');
      } else {
        // handle null user error
        debugPrint('Error User not found');
      }
    } catch (error) {
      // handle error
      debugPrint('Error Failed to get user: $error');
    }
    update();
  }

  bool isPasswordLogin = true;
  bool isPasswordSignUp = true;
  //TOGGLE Password
  void changePasswordVisibilitySignUp() {
    isPasswordSignUp = !isPasswordSignUp;
    update();
  }

  void changePasswordVisibilityLogin() {
    isPasswordLogin = !isPasswordLogin;
    update();
  }
}
