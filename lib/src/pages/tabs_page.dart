import 'package:flutter/material.dart';
import 'package:newsprovider/src/pages/tab1_page.dart';
import 'package:newsprovider/src/pages/tab2_page.dart';
import 'package:newsprovider/src/theme/tema.dart';
import 'package:newsprovider/src/widgets/menu_widget.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> new _NavegacionModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('XNoticias',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w700),),
          backgroundColor: Colors.white,
          iconTheme:IconThemeData(color:Colors.black87),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.all(7),
              child:CircleAvatar(
                backgroundColor: miTema.accentColor,
                backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/profile_images/1018943227791982592/URnaMrya_400x400.jpg'
                ),
                radius: 22.0,
              )
            ),
          ],
        ),
        drawer: MenuWidget(),
        body: _Paginas(),
        bottomNavigationBar:_Navegacion() ,
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

   final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      fixedColor: miTema.accentColor,
      onTap: (i){
        navegacionModel.paginaActual=i;
      },
      items: [
        BottomNavigationBarItem(  icon: Icon(Icons.person_outline,),label: 'Para ti' ),
        BottomNavigationBarItem(  icon: Icon(Icons.public),label: 'Encabezados' ),
      ],
    );
  }
}

class _Paginas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
 
    return PageView(
       controller: navegacionModel.pageController,
       
      // physics: BouncingScrollPhysics(),
       physics: NeverScrollableScrollPhysics(),
       children: <Widget>[
         
         Container( margin: EdgeInsets.only(top:0),child: Tab1Page()),
          Container(margin: EdgeInsets.only(top:0),  child:  Tab2Page() ),
         
       ],
     );
  }
}

class _NavegacionModel with ChangeNotifier{
  int _paginaActual =0;
  PageController _pageController = new PageController(initialPage: 0);

  int get paginaActual => this._paginaActual;

      set paginaActual(int valor) {
        this._paginaActual=valor;
        _pageController.animateToPage(valor, duration: Duration(milliseconds:250), curve: Curves.easeOut);
        notifyListeners();
      } 

   PageController get pageController  => this._pageController;   
}