class Glitch {
  String message;

  Glitch({
    required this.message,
  });

  @override
  String toString() => 'Glitch(message: $message)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Glitch && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class NoInternetGlitch extends Glitch {
  NoInternetGlitch() : super(message: "Unable to connect to the internet");
}

class UnAuthorizeGlitch extends Glitch {
  UnAuthorizeGlitch() : super(message: "Unauthorize user");
}

class UserNotFoundGlitch extends Glitch {
  UserNotFoundGlitch() : super(message: "User Not Found");
}

class WrongPassWordGlitch extends Glitch {
  WrongPassWordGlitch() : super(message: "Wrong Password");
}

class WrongEmailFormat extends Glitch {
  WrongEmailFormat() : super(message: "Wrong Email Format");
}

class UserAlreadyExist extends Glitch {
  UserAlreadyExist() : super(message: "User Already Exist");
}

class PassWordLengthError extends Glitch {
  PassWordLengthError() : super(message: "Password Length should be at least 6");
}

class InvalidEmail extends Glitch {
  InvalidEmail() : super(message: "Invalid Email");
}
class DioException extends Glitch {
  DioException() : super(message: "Dio try catch");
}

class FirebaseError extends Glitch {
  FirebaseError() : super(message: "firebase error");
}

