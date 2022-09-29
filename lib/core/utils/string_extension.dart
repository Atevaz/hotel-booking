extension EmailValidator on String {
  bool isValidEmail() {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
    return emailValid;
  }

  replaceFarsiNumber() {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.'];
    const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹', ','];
    final myString = split('');
    for (int i = 0; i < myString.length; i++) {
      if (english.contains(myString[i])) {
        final index = english.indexOf(myString[i]);
        myString[i] = farsi[index];
      }
    }
    return myString.join('').toString();
  }
}
