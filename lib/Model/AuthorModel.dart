class AuthorModel{
  String _id;
  String _name;
  String _email;
  String _avater;

  AuthorModel(this._id, this._name, this._email, this._avater);

  String get avater => _avater;

  set avater(String value) {
    _avater = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}