class User{
  String _email;
  String _name;
  String _photoUrl;

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get name => _name;

  String get photoUrl => _photoUrl;

  set photoUrl(String value) {
    _photoUrl = value;
  }

  set name(String value) {
    _name = value;
  }
}