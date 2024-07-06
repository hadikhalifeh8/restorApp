import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:restaurantapp/core/constant/routes.dart';
import 'package:restaurantapp/core/middleware/myMiddleware.dart';
import 'package:restaurantapp/test.dart';
import 'package:restaurantapp/view/screen/auth/forget%20password/forgetPassword-checkEmail.dart';
import 'package:restaurantapp/view/screen/auth/forget%20password/resetPassword.dart';
import 'package:restaurantapp/view/screen/auth/forget%20password/verifyCode.dart';
import 'package:restaurantapp/view/screen/auth/login.dart';
import 'package:restaurantapp/view/screen/auth/register.dart';
import 'package:restaurantapp/view/screen/auth/verifycodesignup.dart';
import 'package:restaurantapp/view/screen/onboarding.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () =>const Onboarding(), middlewares: [MyMiddleware() ]),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signup, page: () => const SignUp()),
  GetPage(name: AppRoute.verifycodesignup, page: () => const VerifyCodeSignUp()),

  GetPage(name: AppRoute.forgetpassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verifycode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetpassword, page: () => const ResetPassword()),

  GetPage(name: AppRoute.test, page: () => const Test()),
];
