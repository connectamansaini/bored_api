import 'package:bored/src/bored/bloc/bored_bloc.dart';
import 'package:bored/src/bored/repository/bored_repository.dart';
import 'package:bored/src/core/presentation/theme.dart';
import 'package:bored/src/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => BoredRepository(),
      child: BlocProvider(
        create: (context) => BoredBloc(context.read<BoredRepository>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          home: const HomeView(),
        ),
      ),
    );
  }
}
