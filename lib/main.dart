import 'package:flutter/material.dart';
import 'package:newsprovider/src/pages/login_page.dart';
import 'package:newsprovider/src/pages/registro_page.dart';
import 'package:newsprovider/src/pages/tabs_page.dart';
import 'package:newsprovider/src/services/news_service.dart';
import 'package:newsprovider/src/services/usuario_service.dart';
import 'package:newsprovider/src/steams_logic/login_stream.dart';
import 'package:newsprovider/src/theme/tema.dart';
import 'package:provider/provider.dart';
 
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  }
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final pStream = LoginStream();
    return MultiProvider(
        providers: [
          Provider<LoginStream>(
            create: (_) =>  pStream,
            dispose: (_, prov) => prov.dispose(),
          ),

          StreamProvider(create: (_) => pStream.emailStream, initialData: null),
          StreamProvider(create: (_) => pStream.passwordStream, initialData: null),
          ChangeNotifierProvider(create: (_)=> new NewsService()),
          ChangeNotifierProvider(create: (_)=> new UsuarioService()),
        ],
        child: MaterialApp(
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          theme: miTema,
          initialRoute: 'login',
          routes: {
            '/' : (BuildContext context) => TabsPage(),
            'login' : (BuildContext context) => LoginPage(),
            'registro' : (BuildContext context) => RegistroPage()
          },
      ),
    );
  }
}