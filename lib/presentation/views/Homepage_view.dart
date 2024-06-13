import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_testing_queries/presentation/bloc/bloc/classlist_bloc.dart';

class HomepageView extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomepageView(),
      );

  const HomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classlist'),
      ),
      body: BlocBuilder<ClasslistBloc, ClasslistState>(
        builder: (context, state) {
          if (state is ClasslistLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ClasslistDisplaySuccess) {
            return ListView.builder(
              itemCount: state.classlists.length,
              itemBuilder: (context, index) {
                final classlist = state.classlists[index];
                return ListTile(
                  title: Text(classlist.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email: ${classlist.email}'),
                      Text('Child: ${classlist.child}'),
                    ],
                  ),
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
    );
  }
}
