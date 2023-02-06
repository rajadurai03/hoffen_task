class LoginModel {
  String? type;
  String? accessToken;
  int? expiresIn;
  String? printedCardNumber;
  String? refreshToken;
  String? scope;
  String? tokenType;
  String? username;
  String? result;

  LoginModel(
      {this.type,
        this.accessToken,
        this.expiresIn,
        this.printedCardNumber,
        this.refreshToken,
        this.scope,
        this.tokenType,
        this.username,
        this.result});

  LoginModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    accessToken = json['access_token'];
    expiresIn = json['expires_in'];
    printedCardNumber = json['printedCardNumber'];
    refreshToken = json['refresh_token'];
    scope = json['scope'];
    tokenType = json['token_type'];
    username = json['username'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['access_token'] = this.accessToken;
    data['expires_in'] = this.expiresIn;
    data['printedCardNumber'] = this.printedCardNumber;
    data['refresh_token'] = this.refreshToken;
    data['scope'] = this.scope;
    data['token_type'] = this.tokenType;
    data['username'] = this.username;
    data['result'] = this.result;
    return data;
  }
}