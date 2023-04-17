import 'package:get/get.dart';
import 'package:medtrack/core/utils/string_manger.dart';

class AppLocal extends Translations{

  @override

  Map<String, Map<String, String>> get keys => {
    'en': {
      'loginWelcomeSentence': AppStrings.loginWelcomeSentence,
      'login': AppStrings.login,
      'userEmailHint': AppStrings.userEmailHint,
      'userNameHint': AppStrings.userNameHint,
      'userPassWordHint': AppStrings.userPassWordHint,
      'loginWithGoogle': AppStrings.loginWithGoogle,
      'notHavingAccount': AppStrings.notHavingAccount,
      'register': AppStrings.register,
      'signUp': AppStrings.signUp,
      'signUpWithGoogle': AppStrings.signUpWithGoogle,
      'alreadyHaveAccount': AppStrings.alreadyHaveAccount,
      'signIn': AppStrings.signIn,
      'signUpWelcomeSentence': AppStrings.signUpWelcomeSentence,
      'facebookSentence': AppStrings.facebookSentence,
      'googleSentence': AppStrings.googleSentence,
    },
    'ar': {
      'loginWelcomeSentence': AppStrings.loginWelcomeSentenceAr,
      'login': AppStrings.loginAr,
      'userEmailHint': AppStrings.userEmailHintAr,
      'userNameHint': AppStrings.userNameHintAr,
      'userPassWordHint': AppStrings.userPassWordHintAr,
      'loginWithGoogle': AppStrings.loginWithGoogleAr,
      'notHavingAccount': AppStrings.notHavingAccountAr,
      'register': AppStrings.registerAr,
      'signUp': AppStrings.signUpAr,
      'signUpWithGoogle': AppStrings.signUpWithGoogleAr,
      'alreadyHaveAccount': AppStrings.alreadyHaveAccountAr,
      'signIn': AppStrings.signInAr,
      'signUpWelcomeSentence': AppStrings.signUpWelcomeSentenceAr,
      'facebookSentence': AppStrings.facebookSentenceAr,
      'googleSentence': AppStrings.googleSentenceAr,
    },
  };

}