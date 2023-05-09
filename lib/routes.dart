import 'package:flutter/material.dart';
import 'package:flutter_1/screens/add_post_screen.dart';
import 'package:flutter_1/screens/best_movies.dart';
import 'package:flutter_1/screens/events_screen.dart';
import 'package:flutter_1/screens/list_favorites_cloud.dart';
import 'package:flutter_1/screens/list_gifs.dart';
import 'package:flutter_1/screens/list_popular_videos.dart';
import 'package:flutter_1/screens/login_screen.dart';
import 'package:flutter_1/screens/maps_screen.dart';
import 'package:flutter_1/screens/modify_event_screen.dart';
import 'package:flutter_1/screens/more_gifs.dart';
import 'package:flutter_1/screens/preferencest_screen.dart';
import 'package:flutter_1/screens/register_screen.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_1/screens/register_screen.dart';
import 'package:flutter_1/screens/dashboard_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/main': (BuildContext context) => const LoginScreen(),
    '/register': (BuildContext context) => const RegisterScreen(),
    '/preferencestTheme': (BuildContext context) => PreferencestScreen(),
    '/dash': (BuildContext context) => const DashboardScreen(),
    '/add': (BuildContext context) => AddPostScreen(),
    '/events': (BuildContext context) => EventScreen(),
    '/modify': (BuildContext context) => ModifyEvent(),
    '/popular': (BuildContext context) => const ListPopularVideos(),
    '/gif': (BuildContext context) => const ListGifs(),
    '/moreAboutGiph': (BuildContext context) => const MoreGifs(),
    '/favorites': (BuildContext context) => const ListFavoritesCloud(),
    '/best': (BuildContext context) => const BestMovies(),
    '/maps': (BuildContext context) => const MapSample()
  };
}
