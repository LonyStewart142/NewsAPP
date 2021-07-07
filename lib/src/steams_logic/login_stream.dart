
import 'package:newsprovider/src/utils/validators.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';


class LoginStream{

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();


  //Recuperar valores del string
   Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  
  Stream<String>  get passwordStream  =>
    _passwordController.stream.transform(validarPassword);


  Stream<bool>  get formValidState => Rx.combineLatest2(_emailController, _passwordController, (a, b) => true);
   
   //Insertar valores al string
   Function(String) get changeEmail =>  _emailController.sink.add;

   Function(String) get changePassword =>_passwordController.sink.add;


   //Obtener el ultimo valor ingresado a los streams
    String get email => _emailController.value;
    String get password => _passwordController.value;  

  dispose(){

    this._emailController.close();
    this._passwordController.close();
  }

}