import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_testing_queries/presentation/bloc/bloc/classlist_bloc.dart';

class HomepageViewFiltered extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomepageViewFiltered(),
      );

  const HomepageViewFiltered({super.key});

  @override
  _HomepageViewState createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageViewFiltered> {
  String _filter = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtered Names by Search Classlist'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Filter by name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _filter = value;
                });
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<ClasslistBloc, ClasslistState>(
              builder: (context, state) {
                if (state is ClasslistLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ClasslistDisplaySuccess) {
                  final filteredClasslists = state.classlists
                      .where((classlist) => classlist.name
                          .toLowerCase()
                          .contains(_filter.toLowerCase()))
                      .toList();

                  if (filteredClasslists.isEmpty) {
                    return Center(child: Text('No data matches the filter'));
                  }

                  return ListView.builder(
                    itemCount: filteredClasslists.length,
                    itemBuilder: (context, index) {
                      final classlist = filteredClasslists[index];
                      return ListTile(
                        title: Text(classlist.name),
                        subtitle:
                            Text('${classlist.email} - ${classlist.child}'),
                      );
                    },
                  );
                } else if (state is ClasslistUploadFailure) {
                  return Center(child: Text(state.error));
                } else {
                  return Center(child: Text('No Data'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
