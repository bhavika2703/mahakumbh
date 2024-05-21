class Validator {
  String? validateMobile(String? value) {
    String? patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (value != null) {
      if (value.isEmpty) {
        return 'Please enter mobile number';
      } else if (!regExp.hasMatch(value)) {
        return 'Please enter valid mobile number';
      }
    }
    return null;
  }

  String? validateMobileWithoutEmpty(String? value) {
    String? patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (value != null && value.isNotEmpty) {
      if (!regExp.hasMatch(value)) {
        return 'Please enter valid mobile number';
      }
    }
    return null;
  }

  bool isValidMobile(String? value) {
    String? patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (value != null) {
      if (value.isEmpty) {
        return false;
      } else if (!regExp.hasMatch(value)) {
        return false;
      }
    } else {
      return false;
    }
    return true;
  }

  String? validateIsNoEmpty(String? value) {
    if (value!.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'please enter password';
    }
    if (value.length < 6) {
      return 'Password must contain at least 6 character';
    }
    return null;
  }

  String? validateEmail(String? value) {
    String? patttern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(patttern);
    if (value != null && value.isNotEmpty) {
      if (!regExp.hasMatch(value)) {
        return 'Enter valid email id';
      }
    }
    return null;
  }

  bool isValidEmail(String? value) {
    String? patttern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(patttern);
    if (value != null) {
      if (value.isEmpty) {
        return false;
      } else if (!regExp.hasMatch(value)) {
        return false;
      }
    } else {
      return false;
    }
    return true;
  }
}
