class AppLink {
  static const String server = "http://192.168.1.107/ecommerce";
  // static const String server = "http://10.0.2.2/ecommerce";
  // ================================= Image ================================== //

  static const String imagestatic = "http://192.168.1.107/ecommerce/upload";
  // static const String imagestatic = "http://10.0.2.2/ecommerce/upload";
  static const String imagecategories = "$imagestatic/categories";
  static const String imageitems = "$imagestatic/items";
  // ========================================================================== //

  static const String test = "$server/test.php";
  // ================================= Auth ================================== //
  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verfiycode = "$server/auth/verfiycode.php";
  // ================================= ForgetPassword ================================== //
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String verifyCodeForgetPassword =
      "$server/forgetpassword/verifycode.php";
  // ================================= Home ================================== //
  static const String homepage = "$server/home.php";
  // ================================= Items ================================== //
  static const String items = "$server/items/items.php";
}
