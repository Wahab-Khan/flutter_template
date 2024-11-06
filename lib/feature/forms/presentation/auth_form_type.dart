enum AuthFormType { login, registration }

//user local if app support multiple languages
//also can create more variable to handle place holder for text fields

extension AuthFromTypeText on AuthFormType {
  String get authPrimaryButtonText {
    if (this == AuthFormType.login) {
      return "Login";
    } else {
      return "Register";
    }
  }

  String get authSecoundryButton {
    if (this == AuthFormType.login) {
      return "Have an accout? Login ";
    } else {
      return "Need an account? Register";
    }
  }

  String get authFailAlertTitle {
    if (this == AuthFormType.login) {
      return "fail to login";
    } else {
      return "fail to register";
    }
  }
}
