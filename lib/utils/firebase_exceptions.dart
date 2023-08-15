//FirebaseAuth Exception Handler

class ExceptionHandler {
  // Exception for login
  static loginException(String errorCode) {
    switch (errorCode) {
      case "wrong-password":
        return "Your password is wrong";

      case "user-not-found":
        return "User not found";

      case "user-disabled":
        return "User disabled";

      case "too-many-requests":
        return "Too many requests";

      case "invalid-email":
        return "Invalid email";

      default:
        return "something went wrong";
    }
  }

// Exception for sign up

  static signUpException(String errorCode) {
    switch (errorCode) {
      case "email-already-in-use":
        return "Email already in use";

      case "invalid-email":
        return "Invalid email";

      case "operation-not-allowed":
        return "Operation not allowed";

      case "weak-password":
        return "Weak password";

      default:
        return "something went wrong";
    }
  }
}
