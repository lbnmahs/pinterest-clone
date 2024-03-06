import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pinterest_clone/data/provider/image_data_provider.dart';
import 'package:pinterest_clone/middleware/images_bloc/images_bloc.dart';
import 'package:pinterest_clone/data/repository/image_repository.dart';
import 'package:pinterest_clone/middleware/images_search_bloc/image_search_bloc.dart';
import 'package:pinterest_clone/views/screens/home_tab.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ImageRepository>(
          create: (context) => ImageRepository(ImageDataProvider()),
        ),
        RepositoryProvider<ImageSearchRepository>(
          create: (context) => ImageSearchRepository(ImageSearchDataProvider()),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final imagesBloc = ImagesBloc(context.read<ImageRepository>());
            imagesBloc.add(ImagesFetched());
            return imagesBloc;
          },
        ),
        BlocProvider(
          create: (context) {
            final imageSearchBloc = ImageSearchBloc(context.read<ImageSearchRepository>());
            imageSearchBloc.add(SearchImageEvent(''));
            return imageSearchBloc;
          }
        )
      ], 
      child: MaterialApp(
        title: 'Pinterest',
        theme: theme,
        home: MultiBlocListener(
          listeners: [
            BlocListener<ImagesBloc, ImagesState>(
              listener: (context, state) {
                if (state is ImagesInitial) {
                  context.read<ImagesBloc>().add(ImagesFetched());
                }
              },
            ),
            BlocListener<ImageSearchBloc, ImageSearchState>(
              listener: (context, state) {
                if (state is ImageSearchInitial) {
                  context.read<ImageSearchBloc>().add(SearchImageEvent(''));
                }
              },
            ),
          ],
          child: const HomeTab()
        ),
      )
    );
  }
}
