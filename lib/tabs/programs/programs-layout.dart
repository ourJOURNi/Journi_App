import 'package:flutter/material.dart';
import 'package:layout/custom-libs/onboarding.api.dart';
import 'package:layout/login/login-page.dart';
import 'package:layout/tabs/programs/bloc/programs_bloc.dart';
import 'package:path/path.dart';
import 'programs-toolbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_text/skeleton_text.dart';
import './program-page/program-page.dart';
import 'dart:async';
import 'package:flutter_easyloading/flutter_easyloading.dart';


  class ProgramsLayout extends StatelessWidget {
    const ProgramsLayout({super.key});

    final categoryID = "cat_1";

    @override
    Widget build(BuildContext context) {
      
      return BlocBuilder<ProgramsBloc, ProgramsState>(
        builder: (context, state) {

          return state.status.isSuccess
            ? Stack(
                children: [
                  ListView.builder(
                    padding: const EdgeInsets.only(top: 180, bottom: 50),
                    itemCount: state.programs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 20),
                          Container(
                            height: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('${state.programs[index].photo}'),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(state.programs[index].title, style: const TextStyle(fontSize: 20, color: Color.fromARGB(240, 19, 119, 200)),),
                              Text(state.programs[index].date, style: const TextStyle(color: Colors.grey)),
                              const SizedBox(height: 20),
                              Text(state.programs[index].summary, style: const TextStyle(fontSize: 16)),
                              const SizedBox(height: 20),
                            ],
                          ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 224, 131, 0)),
                                onPressed: () {                              
                                    EasyLoading.showInfo('loading program...', duration: const Duration(seconds: 1))
                                      .then((value) => {
                                      
                                        Timer(const Duration(seconds: 1), () => {
                                          EasyLoading.dismiss(),
  
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>  ProgramPage(program: state.programs[index], userEmail: loginEmail),
                                            ),
                                          ),
                                        })
                                      }
                                    );
                                },
                                child: const Text('View'),
                              ),

                              const SizedBox(width: 16),
                            ],
                          ),
                          const SizedBox(height: 16),
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
                    ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(20),
                                   //  boxShadow: shadowList,
                                  ),
                                  margin: EdgeInsets.only(top: 40),
                                ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 0, bottom: 20),
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                 //  boxShadow: shadowList,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15.0, bottom: 5.0),
                                      child: SkeletonAnimation(
                                        borderRadius: BorderRadius.circular(10.0),
                                        shimmerColor: index % 2 != 0 ? Color.fromARGB(83, 255, 125, 49) : Color.fromARGB(129, 82, 163, 255),
                                        child: Container(
                                          height: 30,
                                          width: MediaQuery.of(context).size.width * 0.35,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),
                                              color: Colors.grey[300]),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15.0),
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 5.0),
                                        child: SkeletonAnimation(
                                          borderRadius: BorderRadius.circular(10.0),
                                          shimmerColor: index % 2 != 0 ? Colors.grey : Colors.white54,
                                          child: Container(
                                            width: 60,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10.0),
                                                color: Colors.grey[300]),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
                      ) 
                : const Text('??');
                  }
        );
  }
}


         