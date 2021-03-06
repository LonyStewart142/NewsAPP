import 'package:flutter/material.dart';
import 'package:newsprovider/src/models/news_models.dart';
import 'package:newsprovider/src/theme/tema.dart'; 

class ListaNoticias extends StatelessWidget {

 final  List<Article> noticias;

 const ListaNoticias(this.noticias);
 

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
       itemCount: noticias.length,
       itemBuilder: (BuildContext context, int index){
         return _Noticia(noticia:this.noticias[index], index: index);
       },
    );
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;
 
  const _Noticia({@required this.noticia, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:10),
       child: Column(
         children: <Widget>[
           _TarjetaTopBar(noticia,index),
           _TarjetaTitulo(noticia),
           _TarjetaImage(noticia),
           _TarjetaBody(noticia),
           SizedBox(height: 10,),
           Divider(),
           _TarjetaBotones()
         ],
       ),
    );
  }
}


class _TarjetaBotones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
         RawMaterialButton(
           onPressed: ()=>null,
           fillColor: miTema.accentColor,
           shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),
           child: Icon(Icons.star_border_outlined,color: Colors.white,),
         ),
         SizedBox(width:10),
          RawMaterialButton(
           onPressed: ()=>null,
           fillColor: Colors.blueGrey,
           shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20)),
           child: Icon(Icons.info,color: Colors.white,),
         ),
        ],
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Article noticia;

  const _TarjetaBody( this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:20),
      child: Text((noticia.description) != null ? noticia.description : ''),
    );
  }
}

class _TarjetaImage extends StatelessWidget {
final Article noticia;

  const _TarjetaImage( this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft:Radius.circular(50),bottomRight: Radius.circular(50)),
        child: Container(
          child:(this.noticia.urlToImage != null) 
          ? FadeInImage(
                  placeholder: AssetImage('assets/img/giphy.gif'),
                  image: NetworkImage(this.noticia.urlToImage),
                )
          : Image(image: AssetImage('assets/img/no-image.png'))
        ),
      ),
    );
  }
}


class _TarjetaTitulo extends StatelessWidget {

  final Article noticia;

  const _TarjetaTitulo( this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:15),
      child: Text(noticia.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
    );
  }
}


class _TarjetaTopBar extends StatelessWidget {

  final Article noticia;
   final int index;

  const _TarjetaTopBar(this.noticia, this.index); 
  @override
  Widget build(BuildContext context) {
    return Container(   
       padding: EdgeInsets.symmetric(horizontal:10.0),
       margin: EdgeInsets.only(bottom:10.0),
       child: Row(
         children: <Widget>[
            Text('${index+1}. ', style: TextStyle(color: miTema.accentColor,fontWeight: FontWeight.w700),),
            Text('${noticia.source.name}. ', style: TextStyle(color: miTema.accentColor,fontWeight: FontWeight.w700),)
         ],
       ),

    );
  }
}