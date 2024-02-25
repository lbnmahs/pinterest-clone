import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pinterest_clone/bloc/images_bloc.dart';
import 'package:pinterest_clone/data/provider/image_data_provider.dart';
import 'package:pinterest_clone/data/repository/image_repository.dart';
import 'package:pinterest_clone/views/screens/home_tab.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.red.shade800,
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
  textTheme: GoogleFonts.latoTextTheme(),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    titleTextStyle: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey.shade600,
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ImageRepository(ImageDataProvider()),
      child: BlocProvider(
        create: (context) => ImagesBloc(context.read<ImageRepository>()),
        child: MaterialApp(
          title: 'Pinterest',
          theme: theme,
          home: const HomeTab(),
        ),
      ),
    );
  }
}
