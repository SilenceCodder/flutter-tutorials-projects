import 'dart:async';
import 'package:async/async.dart';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class APIErrorHandling{
static int httpDuration = 10; //show data within 10, else display an exception.. Am setting it to 10 sec because THIS IS NIGERIA


//API FOR GETTING THE SESSION CODE.

  @override
  Future<SessionModel> getSessionCode() async{
    Map<String, String> header = new HashMap();
    header['X-Oc-Merchant-Id'] = LocatorInjection().apiLink.id;

    try {
      var response = await http.get(LocatorInjection().apiLink.getSessionLink, headers: header).timeout(Duration(seconds: httpDuration));
      var convert = json.decode(response.body);
      print(convert.toString());
      int success = convert['success'];

      if(success == 1){
      SessionModel sessionModel = SessionModel.fromJson(convert);
        LocatorInjection().myFunction.saveSession(code: sessionModel.data.session); //Save session
        print(sessionModel.data.session);

        return sessionModel;
      }else{

        return null;
      }
    } on TimeoutException catch (e) {
      //Exception if data load for 5 seconds and no response
      print('Timeout Execption');
      throw Failure(AppText.timeoutException);

    } on SocketException catch (_) {
      //Exception if there's no Internet
      throw Failure(AppText.noInternet);

    }on HttpException {
      //Exception if there's invalid request
      throw Failure(AppText.badposturl);

    }on FormatException {
      //Exception if there's invalid Http
      throw Failure(AppText.badrequest);
    }
  }

}
