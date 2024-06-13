import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_testing_queries/core/secrets/secrets.dart';
import 'package:supabase_testing_queries/data/datasources/data_from_supabase.dart';
import 'package:supabase_testing_queries/presentation/bloc/bloc/classlist_bloc.dart';
import 'package:supabase_testing_queries/presentation/views/Homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: SUPABASE_URL,
    anonKey: SUPABASE_ANON_KEY,
  );
  runApp(BlocProvider(
    create: (_) => ClasslistBloc(
        dataSource: DataSourceImpl(supabase: Supabase.instance.client)),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Supabase Methods'),
    );
  }
}
