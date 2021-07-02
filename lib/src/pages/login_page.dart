import 'package:flutter/material.dart';
import 'package:newsprovider/src/theme/tema.dart';
import 'package:newsprovider/src/utils/utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
         
         children: <Widget>[
           _crearFondo(context),
           _loginForm(context)
         ],
      ),
    );
  }


_loginForm(BuildContext context){
 
  final size = MediaQuery.of(context).size;
  
  return SingleChildScrollView(
     child: Column(
       children: <Widget>[
         SafeArea(child: Container(height:100.0)),
         Container(
           width: size.width * 0.85,
           padding: EdgeInsets.symmetric(vertical:30.0),
           margin: EdgeInsets.symmetric(vertical:50.0),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(5.0),
             color: Colors.white,
             boxShadow: <BoxShadow>[
               BoxShadow(
                 color: Colors.black26,
                 blurRadius: 3.0,
                 offset: Offset(0.0,5.0),
                 spreadRadius: 1.0
               )
             ]
           ),
           child: Column(
             children: <Widget>[
               Text('Ingresos tus credencias',style: TextStyle(fontSize: 20.0),),
               SizedBox(height: 50.0,),
               _crearEmail(),
               SizedBox(height: 25.0,),
               _crearPassword(),
               SizedBox(height: 25.0,),
               _crearBotonSubmit()
               
             ],
           ),
         )
       ],
     ),
  );
}


Widget _crearEmail(){

return Container(
  padding: EdgeInsets.symmetric(horizontal:20.0),
  child: TextField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      icon: Icon(Icons.email_outlined,color: Colors.black54,),
      labelText: 'Correo Electronico',
      hintText: 'ejemplo@correo.com'
    ),
  ),

);
}

Widget _crearPassword(){

  return Container(
     padding: EdgeInsets.symmetric(horizontal:20.0),
     child: TextField(
       keyboardType: TextInputType.emailAddress,
       decoration: InputDecoration(
         icon: Icon(Icons.lock_outline,color: Colors.black54,), 
         labelText: 'Password',
   
       ),
     ),

  );
}

 Widget _crearBotonSubmit(){
   return RaisedButton(
       child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0,vertical: 15.0),
          child: Text('Entrar',style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500)),
       ),
       shape:   RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(5.0)
       ),
       color: miTema.accentColor,
       textColor: Colors.white,
       onPressed: (){},
   );
 }


 Widget _crearFondo(BuildContext context){
 
  final size = MediaQuery.of(context).size;
   final c_1 = getRGB(miTema.accentColor);

   final fondo = Container(
     height: size.height * 0.4,
     width: double.infinity,
     decoration: BoxDecoration(
       gradient: LinearGradient(
         colors: <Color>[
            Color.fromRGBO(c_1[0], c_1[1], c_1[2], 1.0),
             Color.fromRGBO(c_1[0], c_1[1], c_1[2], .85),
            
         ]
       )
     ),
   );

  final circulo = Container(
     height: 100.0,
     width: 100.0,
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(100.0),
       color: Color.fromRGBO(255, 255, 255, 0.08)
     ),
  );
    return Stack(
       children: <Widget>[
         fondo,
       Positioned( top: 90.0,left: 30.0,child: circulo ),
       Positioned( top: -40.0,right: -30.0,child: circulo ),
       Positioned( bottom: -50.0,right: -10.0,child: circulo ),
       Positioned( bottom: 120.0,right: 20.0,child: circulo ),
       Positioned( bottom: 120.0,right: 20.0,child: circulo ),
       Container(
         padding: EdgeInsets.only(top:80.0),
         child: Column(
           children: <Widget>[
             Icon(Icons.person_pin_circle, color: Colors.white,size: 100.0,),
             SizedBox(height: 10.0,width: double.infinity,),
             Text('Bienvenido a XNoticias',style: TextStyle(color: Colors.white,fontSize: 25.0),)
           ],
         )
       )
       ],
    );
  }
}