import 'dart:convert';

import '../models/login_model.dart';
import '/utils/url_utils.dart';
import '/services/api_service.dart';


class APIProvider {

  void loginAPI({
    var params,
    Function()? beforeSend,
    Function(LoginModel data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(url: urlLogin,  formdataParams: params,).post(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        LoginModel res = LoginModel.fromJson(json.decode(data.toString()));
       print('ApI PROVIDER :  $res');
        onSuccess!(res);
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }




}

