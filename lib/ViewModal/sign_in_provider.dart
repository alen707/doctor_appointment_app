
import 'package:docter_appointment_app/Service/sign_in_api.dart';
import 'package:flutter/material.dart';

class SignInProvider extends ChangeNotifier {
 

 // ignore: strict_top_level_inference
 Future <void> signInProvider(context,String email,String password)async {
  SignInApi signInApi=SignInApi();
  signInApi.signInApi(context ,email, password);
  

}
}
