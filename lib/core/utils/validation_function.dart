
import 'package:nb_utils/nb_utils.dart';

/// Checks if string consist only Vietnamese Text. (With whitespace accepted)
bool isFullname(
  String? inputString, {
  bool isRequired = false,
}) {
  bool isInputStringValid = true;

  if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
    isInputStringValid = false;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern = r'^[a-zA-Z_ÀÁÂÃÈÉÊẾÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêếìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\ ]+$';

    final regExp = RegExp(pattern);

    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}
/// Checks if string consist only Vietnamese Text and number. (With whitespace accepted)
bool isAddress(
  String? inputString, {
  bool isRequired = false,
}) {
  bool isInputStringValid = true;

  if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
    isInputStringValid = false;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern = r'^[a-z0-9A-Z_ÀÁÂÃÈÉÊẾÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêếìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ,/\ ]+$';

    final regExp = RegExp(pattern);

    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}

/// Checks if valid vietnamese phone  number
bool isPhone(
  String? inputString, {
  bool isRequired = false,
}) {
  bool isInputStringValid = true;

  if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
    isInputStringValid = false;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern = r'^(03|05|07|08|09|01[2689])+([0-9]{8})$';

    final regExp = RegExp(pattern);

    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}

bool is1to10(
  String? inputString, {
  bool isRequired = false,
}) {
  bool isInputStringValid = true;

  if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
    isInputStringValid = false;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern = r'^[1-10]{1}$';

    final regExp = RegExp(pattern);

    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}

bool is1to100percent(
  String? inputString, {
  bool isRequired = false,
}) {
  bool isInputStringValid = true;

  if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
    isInputStringValid = false;
  }

  if (inputString != null && inputString.isNotEmpty) {
    try{
      double percent = inputString.toDouble();
      if(percent >= 0.01 && percent <= 1){
        return isInputStringValid = true;
      }
      isInputStringValid = false;
    }catch(e){
      return isInputStringValid = false;
    }
  }

  return isInputStringValid;
}

/// Password should have,
/// at least a upper case letter
/// at least a lower case letter
/// at least a digit
/// at least a special character [@#$%^&+=]
/// length of at least 8
/// no white space allowed
bool isValidPassword(
  String? inputString, {
  bool isRequired = false,
}) {
  bool isInputStringValid = true;

  if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
    isInputStringValid = false;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern =
        r'^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,25}$';

    final regExp = RegExp(pattern);

    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}
