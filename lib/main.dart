import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/jokes_bloc/bloc/jokes_bloc.dart';
import 'networking/repositories/jokesrepository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[900],
        backgroundColor: Colors.grey[900],
        scaffoldBackgroundColor: Colors.grey[900],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.grey[900],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider(
        create: (context) => JokesRepository(),
        child: const JokesScreen(),
      ),
    );
  }
}

class JokesScreen extends StatefulWidget {
  const JokesScreen({super.key});

  @override
  State<JokesScreen> createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JokesBloc(
        RepositoryProvider.of(context),
      )..add(JokesLoadEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('The Joke App'),
        ),
        body: BlocBuilder<JokesBloc, JokesState>(
          builder: (context, state) {
            // State is Loading
            if (state is JokesLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            // State is Loaded
            if (state is JokesLoadedState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ExpansionTile(
                      title: Text(
                        "${state.jokesModel.setup}",
                        textAlign: TextAlign.center,
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${state.jokesModel.delivery}",
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<JokesBloc>(context)
                            .add(JokesLoadEvent());
                      },
                      child: const Text('Load New Joke'),
                    ),
                  ],
                ),
              );
            }

            // State caught Error
            if (state is JokesErrorState) {
              return Center(
                child: Text(state.error),
              );
            }

            // Else Return Blank Container
            return Container();
          },
        ),
      ),
    );
  }
}
