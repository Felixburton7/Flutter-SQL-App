import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_testing_queries/presentation/bloc/bloc/classlist_bloc.dart';
import 'package:supabase_testing_queries/data/models/data_model.dart';
import 'package:supabase_testing_queries/presentation/views/Homepage_view_filtered.dart';
import 'package:supabase_testing_queries/presentation/views/Homepage_view_prefiltered_list.dart';
import 'package:supabase_testing_queries/presentation/views/homepage_view.dart';
import 'package:supabase_testing_queries/presentation/widgets/ButtonViewContainer.dart';
import 'package:supabase_testing_queries/presentation/widgets/HomepageTextFields.dart';

class MyHomePage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
      );

  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _childController = TextEditingController();

  late ClasslistBloc _classlistBloc;

  @override
  void initState() {
    super.initState();
    _classlistBloc = BlocProvider.of<ClasslistBloc>(context);
    _classlistBloc.add(ClasslistFetchData());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _childController.dispose();
    super.dispose();
  }

  void _addClasslist() {
    final name = _nameController.text;
    final email = _emailController.text;
    final child = _childController.text;

    if (name.isNotEmpty && email.isNotEmpty && child.isNotEmpty) {
      final newClasslist = Classlist(name: name, email: email, child: child);
      _classlistBloc.add(ClasslistUploadData(newClasslist));
      _nameController.clear();
      _emailController.clear();
      _childController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              _classlistBloc.add(ClasslistFetchData());
              Navigator.push(context, HomepageView.route());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            HomepageTextFields(
              controller: _nameController,
              labelText: 'Name',
            ),
            HomepageTextFields(
              controller: _emailController,
              labelText: 'Email',
            ),
            HomepageTextFields(
              controller: _childController,
              labelText: 'Child',
            ),
            ButtonViewContainer(
              onPressed: _addClasslist,
              text: 'Add new details to Classlist database',
              borderColor: Colors.blue,
            ),
            ButtonViewContainer(
              onPressed: () {
                _classlistBloc.add(ClasslistFetchData());
                Navigator.push(context, HomepageViewFiltered.route());
              },
              text: 'Filter List by Searching Names',
              borderColor: Colors.green,
            ),
            ButtonViewContainer(
              onPressed: () {
                _classlistBloc.add(ClasslistFetchData());
                Navigator.push(context, HomepageViewPreFiltered.route());
              },
              text: 'Pre-filtered List of only Names',
              borderColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
