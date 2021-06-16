import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './helpers/sharedPrefs.dart';
import './providers/movies_provider.dart';
import './screens/movie_details_screen.dart';
import './screens/tv_show_details_screen.dart';
import './screens/home_screen.dart';
import 'providers/tv_shows_provider.dart';

final sharedPrefs = SharedPrefs();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPrefs.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Movies(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => TvShows(),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus.unfocus();
        },
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeScreen(),
          routes: {
            MovieDetailsScreen.routeName: (ctx) => MovieDetailsScreen(),
            TvShowDetailsScreen.routeName: (ctx) => TvShowDetailsScreen(),
          },
        ),
      ),
    );
  }
}
