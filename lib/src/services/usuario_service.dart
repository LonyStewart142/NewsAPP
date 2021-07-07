
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'  as http;
import 'package:newsprovider/src/preferencias_usuario/preferencias_usuario.dart';

class UsuarioService with ChangeNotifier{
 final _firebaseKey= 'AIzaSyCc7e4D_mFefB9A2AynV9lKoj8L_MXUv3Y';

 final _urlBase ='https://identitytoolkit.googleapis.com/v1/accounts';

  final _prefs = new PreferenciasUsuario();

 Future<Map<String,dynamic>> login (String email,String password) async{

   final authData={
     "email":email,
     "password":password,
     "returnSecureToken":true
   };

   final url = Uri.parse(_urlBase+':signInWithPassword?key=$_firebaseKey');
   
   final resp =  await http.post(
     url,
     body: json.encode(authData)
   );

   Map<String,dynamic> decodedResp = json.decode(resp.body);
   print(decodedResp);

   if(decodedResp.containsKey('idToken')){
        _prefs.token=decodedResp['token'];
        return {'ok':true,'token': decodedResp['idToken']};
   }else{
        return {'ok':false,'mensaje': decodedResp['error']['message']};
   }

 }


 Future<Map<String,dynamic>> nuevoUsuario(String email,String password)  async{
   
   final authData ={
    "email": email,
    "password":password,
    'returnSecureToken':true,
   };


   final  url  =  Uri.parse(_urlBase+':signUp?key=$_firebaseKey');

   final resp =  await http.post(
     url,
     body: json.encode(authData)
     );

     Map<String,dynamic> decodedResp = json.decode(resp.body);

    if(decodedResp.containsKey('idToken')){
       _prefs.token=decodedResp['token'];
       return {'ok':true,'token': decodedResp['idToken']};
    }else{
        return {'ok':false,'mensaje': decodedResp['error']['message']};
   }

 }

}