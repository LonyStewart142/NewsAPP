import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsprovider/src/pages/tabs_page.dart';
import 'package:newsprovider/src/theme/tema.dart';


class MenuWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Stack(
              children:<Widget>[
                _Fondo(),
                _Menu()
              ] 
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
          children: [
           Container(
             child: Column(
     mainAxisAlignment: MainAxisAlignment.center,
     crossAxisAlignment: CrossAxisAlignment.center,
     children: <Widget>[
       CircleAvatar(
         radius: 50.0,
         backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1018943227791982592/URnaMrya_400x400.jpg'),
       ),
       SizedBox(height: 5,),
       Text('Stan Lee', style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w600)),

       SizedBox(height: 3,),
       Text('American comic book writer', style: TextStyle(fontSize: 16.0,)),

       SizedBox(height: 10,),

     ],
             ),
           ),

           Divider(height: 3,thickness: 0,),
           ListTile(
             leading: Icon(Icons.list_alt_outlined,size: 30,color: miTema.accentColor,),
             title: Text('Mis Noticias',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),),
             onTap: (){
           Navigator.push(context, CupertinoPageRoute(builder: (context) {
    return TabsPage();
            }));
     },
           ),
           ListTile(
             leading: Icon(Icons.person_outline,size: 30,color: miTema.accentColor,),
             title: Text('Mi Perfil',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),),
             onTap: (){print('object');},
           ),
           ListTile(
             leading: Icon(Icons.settings_outlined,size: 30,color: miTema.accentColor,),
             title: Text('Configuracion',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),),
             onTap: (){print('object');},
           ),
           ListTile(
             leading: Icon(Icons.help_outline,size: 30,color: miTema.accentColor,),
             title: Text('Ayuda',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),),
             onTap: (){print('object');},
           ),
           Divider(height: 4,thickness: 0,),
           ListTile(
             leading: Icon(Icons.logout,size: 30,color: miTema.accentColor,),
             title: Text('Cerrar Session',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),),
             onTap: (){print('object');},
           ),
          ],
        );
  }
}
class _Fondo extends StatelessWidget {
   


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
     
    final fondoMorado = Container(
     height: size.height * 0.4,
     width: double.infinity,
     decoration: BoxDecoration(
       gradient: LinearGradient(
         colors: <Color>[
           Color.fromRGBO(63, 63, 156, 1.0),
           Color.fromRGBO(90, 70, 178, 1.0),
         ]
       )
     ),
    );
   
   final cTema = getRGB(miTema.accentColor);
   final rnd = new Random.secure();
   
    return Stack(
     children: <Widget>[
       Positioned( top: -50.0,left: 30.0,child: _crearCirculo() ),
       Positioned( bottom: -50.0,left: -30.0,child: _crearCirculo() ),
       Positioned( bottom:150.0,left: 250.0,child: _crearCirculo() ),
     ],
    );
  }

  List<int> getRGB(Color c) {
  return [c.red,c.green, c.blue];
}

_crearCirculo(){
  final cTema = getRGB(miTema.accentColor);
 final rnd = new Random.secure();
return Container(
     width: 100.0,
     height: 100.0,
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(100.0),
       color: Color.fromRGBO(cTema[0], cTema[1], cTema[2], rnd.nextDouble()*0.80)
     ),
   );
}
}
