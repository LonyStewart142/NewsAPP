import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newsprovider/src/models/category_mode.dart';
import 'package:newsprovider/src/services/news_service.dart';
import 'package:newsprovider/src/theme/tema.dart';
import 'package:newsprovider/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 final newsService = Provider.of<NewsService>(context);
    return SafeArea(
      child: Container(
        child:Column(
          children: <Widget>[
            _ListaCategorias(),
              if ( !newsService.isLoading)
              Expanded(
                child: ListaNoticias( newsService.getArticlesCategorySelected )
              ),

            if ( newsService.isLoading )
            Expanded(
              child: Center(
                
                child: SpinKitDoubleBounce(
                  size: 50,
                  color: miTema.accentColor,

                ),
              )
            )

          ],
        )
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   final categories = Provider.of<NewsService>(context).categorys;
  
    
    return Container(
      padding: EdgeInsets.all(1),
      width: double.infinity,
      height: 80,
      color: Color.fromRGBO(243, 243, 243, 1),
      
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index){

          final cName = categories[index].name;

          return Padding(
             padding: EdgeInsets.all(8),
             child: Column(
               children: <Widget>[
                 _CategoryButton(categories[index]),
                 SizedBox(height:5),
                 Text('${cName[0].toUpperCase()}${cName.substring(1)}')
               ],
             ),
           );
        }
        ),
    );
  }
}

class _CategoryButton extends StatelessWidget {

  final Category category;

  const _CategoryButton(this.category);

  @override
  Widget build(BuildContext context) {
   final newService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: (){
        final newService = Provider.of<NewsService>(context,listen: false);
        newService.selectedCategory= category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin:  EdgeInsets.symmetric(horizontal:10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          category.icon,
        
          color: (this.category.name==newService.selectedCategory)? miTema.accentColor : Colors.black54,
        ),
      ),
    );
  }
}