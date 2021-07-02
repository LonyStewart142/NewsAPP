import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newsprovider/src/services/news_service.dart';
import 'package:newsprovider/src/theme/tema.dart';
import 'package:newsprovider/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {

  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewsService>(context).headlines;
    //newsService.headlines;
    //ListaNoticias(headlines)
    return Scaffold(
        
       body: (headlines.length ==0)
             ? Center(
               child: SpinKitDoubleBounce(
                 size: 50,
                 color: miTema.accentColor,
               ),)
             : Container(
               child: Column(
                 children: [
                    _TextTopHeadLine(headlines.length),
                    Expanded(child: ListaNoticias(headlines)) ,
                 ]
               ),
             ) 
            
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class _TextTopHeadLine extends StatelessWidget {
  final cantNews;

  const _TextTopHeadLine( this.cantNews);
  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.only(top:0,left: 10),  
    width: double.infinity,
    height: 80.0,
    color: Color.fromRGBO(243, 243, 243, 1),
    child: 
    Row(
          children:<Widget>[
          Icon(Icons.star_rate_outlined,size: 30,color: miTema.accentColor,), 
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.black87,
                fontSize: 25.0,
                fontWeight: FontWeight.w700
              ),
              children: <TextSpan>[
                   TextSpan(text: 'TOP '),
                   TextSpan(text: '$cantNews ', style: TextStyle(color: miTema.accentColor)),
                   TextSpan(text: 'HEADLINES '),
              ]
            )
      ),
          ] 
    ),
   
   
    );
  }
}