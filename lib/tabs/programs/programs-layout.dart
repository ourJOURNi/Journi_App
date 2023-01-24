import 'package:flutter/material.dart';
import 'package:layout/tabs/programs/bloc/programs_bloc.dart';
import '../programs/programs-toolbar/programs-toolbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

  class ProgramsLayout extends StatelessWidget {
    const ProgramsLayout({super.key});

    @override
    Widget build(BuildContext context) {
      return BlocBuilder<ProgramsBloc, ProgramsState>(
        builder: (context, state) {
          if(state.programs.isNotEmpty) {
            print(state.programs[0].title);
          }
          return state.status.isSuccess
            ? Stack(
                children: [
                  ListView.builder(
                    padding: const EdgeInsets.only(top: 150),
                    itemCount: state.programs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 360,
                            child: Image.asset('assets/det_skyline.jpeg'),
                          ),
                           ListTile(
                            title: Text(state.programs[index].title),
                            subtitle: Text('${state.programs[index].date}\n${state.programs[index].summary}'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              const SizedBox(width: 8),
                              TextButton(
                                child: const Text('Sign Up'),
                                onPressed: () {/* ... */},
                              ),
                            ],
                          ),
                        ],
                      ),
                    );  
                    }
                ),
                
                  const SizedBox(height: 150),
                  const ProgramsToolbarWidget()
                  ],
              ) : state.status.isLoading
                ? Stack(
                  children: [
                    ListView(
                      padding: const EdgeInsets.all(8),
                      children: const <Widget>[
                        SizedBox(height: 200),
                        Text('Loading...')
                      ],
                    ),
                    const ProgramsToolbarWidget()
                    ],
                  )
                : state.status.isError
                    ? Stack(
                      children: [
                        ListView(
                          padding: const EdgeInsets.all(8),
                          children: const <Widget>[
                            SizedBox(height: 200),
                            Text('Error...')
                          ],
                        ),
                        const ProgramsToolbarWidget()
                        ],
                      ): const Text('??');
                  }
        );
  }
}


         