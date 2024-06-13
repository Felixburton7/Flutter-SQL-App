import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_testing_queries/presentation/bloc/bloc/classlist_bloc.dart';

class HomepageViewPreFiltered extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomepageViewPreFiltered(),
      );

  const HomepageViewPreFiltered({super.key});

  @override
  _HomepageViewPreFilteredState createState() =>
      _HomepageViewPreFilteredState();
}

class _HomepageViewPreFilteredState extends State<HomepageViewPreFiltered> {
  @override
  void initState() {
    super.initState();
    context.read<ClasslistBloc>().add(ClasslistFetchFilteredData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtered Names by Search Classlist'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ClasslistBloc, ClasslistState>(
              builder: (context, state) {
                if (state is ClasslistLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ClasslistFilteredDisplaySuccess) {
                  if (state.filteredClasslists.isEmpty) {
                    return Center(child: Text('No data matches the filter'));
                  }

                  return ListView.builder(
                    itemCount: state.filteredClasslists.length,
                    itemBuilder: (context, index) {
                      final classlist = state.filteredClasslists[index];
                      return ListTile(
                        title: Text(classlist.name),
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
