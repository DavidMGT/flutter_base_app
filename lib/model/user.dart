class User {
  int _loginType;
  int _code;
  String _msg;

  int get loginType => _loginType;

  set loginType(int value) {
    _loginType = value;
  }

  int get code => _code;

  String get msg => _msg;

  set msg(String value) {
    _msg = value;
  }

  set code(int value) {
    _code = value;
  }

  User({
    int loginType,
    int code,
    String msg,
  }) {
    this._loginType = loginType;
    this._code = code;
    this._msg = msg;
  }

  User.fromJson(Map<String, dynamic> json) {
    _loginType = json['loginType'];
    _code = json['code'];
    _msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loginType'] = this._loginType;
    data['code'] = this._code;
    return data;
  }
}
