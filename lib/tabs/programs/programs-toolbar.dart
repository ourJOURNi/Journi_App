import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../programs/bloc/programs_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/models/model_barrel.dart';

void configCategoryLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.wave
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = true;
}

// ignore: must_be_immutable
class ProgramsToolbarWidget extends StatefulWidget {
  const ProgramsToolbarWidget({super.key});

  @override
  State<ProgramsToolbarWidget> createState() => _ProgramsToolbarState();
}

class _ProgramsToolbarState extends State<ProgramsToolbarWidget> {
  String category = 'All';

  void toolbarFocus(String category) {
    setState(() => {
      this.category = category,

      EasyLoading.instance
        ..displayDuration = const Duration(milliseconds: 2000)
        ..indicatorType = EasyLoadingIndicatorType.wave
        ..loadingStyle = EasyLoadingStyle.dark
        ..indicatorSize = 45.0
        ..radius = 10.0
        ..progressColor = Colors.yellow
        ..backgroundColor = Colors.green
        ..indicatorColor = Colors.yellow
        ..textColor = Colors.yellow
        ..maskColor = Colors.blue.withOpacity(0.5)
        ..userInteractions = true
        ..dismissOnTap = true,
      EasyLoading.show(status: 'Searching: $category'),
      Timer(const Duration(seconds: 2), () => { EasyLoading.dismiss(animation: true)})
      });
  }

  List<Program> allPrograms = [];
  bool searchEmpty = false;
  TextEditingController searchInputCTRL = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProgramsBloc, ProgramsState>(
      listener: (context, state) => {
        allPrograms = context.read<ProgramsBloc>().state.programs
      },
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 180,
          child: 
            DecoratedBox(
              decoration: BoxDecoration(
              color: const Color.fromARGB(240, 19, 119, 200),
              boxShadow: [
                BoxShadow(
                 color: const Color.fromARGB(113, 0, 0, 0).withOpacity(0.1),
                 spreadRadius: 2,
                 blurRadius: 7,
                 offset: const Offset(0, 3), // changes position of shadow
               ),
              ]
           ),
              child: 
                Column(
                  children: [
                    // Search Bar
                    const SizedBox(height: 60),
                    Row(
                      children:  [

                        // Searchbar
                        Expanded(child: 
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: TextField(
                              controller: searchInputCTRL,
                              onChanged: (String searchTerm) => {
                                // Filter Program [title] by text
                                // Create FiltedSearch Event on ProgramsBloc
                                if(searchTerm.isEmpty) searchEmpty == true,
                                context.read<ProgramsBloc>().add(SearchPrograms(allPrograms, true, searchTerm, searchEmpty))
                              },
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide: BorderSide(color: Color.fromARGB(255, 255, 173, 58), width: 2.0),
                                ),
                                hintStyle: TextStyle(color: Colors.white),
                                prefixIcon: Icon(Icons.search, color: Colors.white),
                                // suffixIcon: Icon(Icons.filter_list, color: Colors.white),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                                hintText: 'What are you looking for?'
                              ),
                          ),
                          )
                        ),
                        
                        // Filter Button
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ElevatedButton(
                            onPressed: () => {
                              showModalBottomSheet(
                                // Makes the modal fullsceen height
                                // isScrollControlled: true,
                                context: context, 
                                builder: (BuildContext newContext) {
                                    // getCamera();
                                    return Center(
                                      // heightFactor: 100.0,
                                      child: Column(
                                        children:  <Widget> [
                                          // Modal header
                                          const Padding(
                                            padding:  EdgeInsets.only(top: 20, bottom: 20),
                                            child: Text('Program Filters',
                                              style: TextStyle(
                                                fontSize: 25,
                                              ),
                                            ),
                                          ),

                                          // Buttons
                                          Expanded(
                                            child: 
                                            ListView(
                                              padding: const EdgeInsets.only(left: 50, right: 50),
                                              
                                              children: <Widget>[
                                                // Favorites Button
                                                ElevatedButton(
                                                  onPressed: () => {
                                                    print('Favorites button'),
                                                    // TODO: Hide Toolbar focus when looking at favorites
                                                    toolbarFocus('Favorites'),
                                                    context.read<ProgramsBloc>().add(GetProgramsByFavorites()),
                                                    Navigator.pop(context)
                                                  },
                                                  style: const ButtonStyle(),
                                                  child: const Center(child: Text('Favorites')),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () => {
                                                    print('Favorites button')
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    fixedSize: Size(40,20)
                                                  ),
                                                  child: Center(child: Text('Entry A')),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () => {
                                                    print('Favorites button')
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    fixedSize: Size(0,0)
                                                  ),
                                                  child: Center(child: Text('Entry A')),
                                                ),
                                              ],
                                            )
                                          ),

                                          // Space between cancel button
                                          // const Expanded(child: SizedBox(height: 0)),
                                          // Cancel Button
                                          ElevatedButton(
                                            onPressed: () => {
                                              Navigator.pop(context)
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.redAccent
                                            ),
                                            child: const Text('Cancel', style: TextStyle(
                                              color: Colors.white)
                                              )
                                          ),
                                          const SizedBox(height: 60.0),
                                        ],
                                      ),
                                    );
                                  }
                              )
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(30.0, 45.0)
                            ),
                            child: const Icon(Icons.filter_list, color: Colors.white)
                          )
                        )
                    ],
                  ),
              
                  // Categories
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 55,
                    child:   
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          // All Programs
                          Padding(
                            padding: const EdgeInsets.only(left: 23, right: 23),
                            child: Column(
                            children:  [
                              GestureDetector(
                                onTap: () => {
                                  print('All'),
                                  toolbarFocus('All'),
                                  searchInputCTRL.clear(),
                                  context.read<ProgramsBloc>().add(GetPrograms())
                                },
                                child: 
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(width: 4.0, color: category == 'All' ? Color.fromARGB(255, 255, 173, 58): Colors.transparent),
                                      )
                                    ),
                                    child: Column(
                                      children: const [
                                        Icon(Icons.camera, color: Colors.white, size: 32),
                                        SizedBox(height: 4),
                                        Text(
                                          'All',
                                          style: TextStyle(color: Colors.white, fontSize: 8),
                                          textAlign: TextAlign.center
                                        ),
                                        SizedBox(height: 5),
                                      ],
                                  )
                                  )
                              ),
                            ]
                          ) 
                          ), 
                          // Category 1
                          Padding(
                            padding: const EdgeInsets.only(left: 23, right: 23),
                            child: Column(
                            children:  [
                              GestureDetector(
                                onTap: () => {
                                  print('Category 1'),
                                  toolbarFocus('Category 1'),
                                  searchInputCTRL.clear(),
                                  context.read<ProgramsBloc>().add(GetProgramsByCategoryOne())
                                },
                                child: 
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(width: 4.0, color: category == 'Category 1' ? Color.fromARGB(255, 255, 173, 58): Colors.transparent),
                                      )
                                    ),
                                    child: Column(
                                      children: const [
                                        Icon(Icons.camera, color: Colors.white, size: 32),
                                        SizedBox(height: 4),
                                        Text(
                                          'Category 1',
                                          style: TextStyle(color: Colors.white, fontSize: 8),
                                          textAlign: TextAlign.center
                                        ),
                                        SizedBox(height: 5),
                                      ],
                                  )
                                  )
                              ),
                            ]
                          ) 
                          ), 
                          // Category 2
                          Padding(
                            padding: const EdgeInsets.only(left: 23, right: 23),
                            child: Column(
                            children:  [
                              GestureDetector(
                                onTap: () => {
                                  print('Category 2'),
                                  toolbarFocus('Category 2'),
                                  searchInputCTRL.clear(),
                                  context.read<ProgramsBloc>().add(GetProgramsByCategoryTwo())
                                },
                                child: 
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(width: 4.0, color: category == 'Category 2' ? Color.fromARGB(255, 255, 173, 58): Colors.transparent),
                                      )
                                    ),
                                    child: Column(
                                      children: const [
                                        Icon(Icons.camera, color: Colors.white, size: 32),
                                        SizedBox(height: 4),
                                        Text(
                                          'Category 2',
                                          style: TextStyle(color: Colors.white, fontSize: 8),
                                          textAlign: TextAlign.center
                                        ),
                                        SizedBox(height: 5),
                                      ],
                                  )
                                  )
                              ),
                            ]
                          ) 
                          ), 
                          // Category 3
                          Padding(
                            padding: const EdgeInsets.only(left: 23, right: 23),
                            child: Column(
                            children:  [
                              GestureDetector(
                                onTap: () => {
                                  print('Category 3'),
                                  toolbarFocus('Category 3'),
                                  searchInputCTRL.clear(),
                                  context.read<ProgramsBloc>().add(GetProgramsByCategoryThree())
                                },
                                child: 
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(width: 4.0, color: category == 'Category 3' ? Color.fromARGB(255, 255, 173, 58): Colors.transparent),
                                      )
                                    ),
                                    child: Column(
                                      children: const [
                                        Icon(Icons.camera, color: Colors.white, size: 32),
                                        SizedBox(height: 4),
                                        Text(
                                          'Category 3',
                                          style: TextStyle(color: Colors.white, fontSize: 8),
                                          textAlign: TextAlign.center
                                        ),
                                        SizedBox(height: 5),
                                      ],
                                  )
                                  )
                              ),
                            ]
                          ) 
                          ), 
                          // Category 4
                          Padding(
                            padding: const EdgeInsets.only(left: 23, right: 23),
                            child: Column(
                            children:  [
                              GestureDetector(
                                onTap: () => {
                                  print('Category 4'),
                                  toolbarFocus('Category 4'),
                                  searchInputCTRL.clear(),
                                  context.read<ProgramsBloc>().add(GetProgramsByCategoryFour())
                                },
                                child: 
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(width: 4.0, color: category == 'Category 4' ? Color.fromARGB(255, 255, 173, 58): Colors.transparent),
                                      )
                                    ),
                                    child: Column(
                                      children: const [
                                        Icon(Icons.camera, color: Colors.white, size: 32),
                                        SizedBox(height: 4),
                                        Text(
                                          'Category 4',
                                          style: TextStyle(color: Colors.white, fontSize: 8),
                                          textAlign: TextAlign.center
                                        ),
                                        SizedBox(height: 5),
                                      ],
                                  )
                                  )
                              ),
                            ]
                          ) 
                          ), 
                          // Category 5
                          Padding(
                            padding: const EdgeInsets.only(left: 23, right: 23),
                            child: Column(
                            children:  [
                              GestureDetector(
                                onTap: () => {
                                  print('Category 5'),
                                  toolbarFocus('Category 5'),
                                  searchInputCTRL.clear(),
                                  context.read<ProgramsBloc>().add(GetProgramsByCategoryFive())
                                },
                                child: 
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(width: 4.0, color: category == 'Category 5' ? Color.fromARGB(255, 255, 173, 58): Colors.transparent),
                                      )
                                    ),
                                    child: Column(
                                      children: const [
                                        Icon(Icons.camera, color: Colors.white, size: 32),
                                        SizedBox(height: 4),
                                        Text(
                                          'Category 5',
                                          style: TextStyle(color: Colors.white, fontSize: 8),
                                          textAlign: TextAlign.center
                                        ),
                                        SizedBox(height: 5),
                                      ],
                                  )
                                  )
                              ),
                            ]
                          ) 
                          ), 
                          // Category 6
                          Padding(
                            padding: const EdgeInsets.only(left: 23, right: 23),
                            child: Column(
                            children:  [
                              GestureDetector(
                                onTap: () => {
                                  print('Category 6'),
                                  toolbarFocus('Category 6'),
                                  searchInputCTRL.clear(),
                                  context.read<ProgramsBloc>().add(GetProgramsByCategorySix())
                                },
                                child: 
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(width: 4.0, color: category == 'Category 6' ? Color.fromARGB(255, 255, 173, 58): Colors.transparent),
                                      )
                                    ),
                                    child: Column(
                                      children: const [
                                        Icon(Icons.camera, color: Colors.white, size: 32),
                                        SizedBox(height: 4),
                                        Text(
                                          'Category 6',
                                          style: TextStyle(color: Colors.white, fontSize: 8),
                                          textAlign: TextAlign.center
                                        ),
                                        SizedBox(height: 5),
                                      ],
                                  )
                                  )
                              ),
                            ]
                          ) 
                          ), 
                          // Category 7
                          Padding(
                            padding: const EdgeInsets.only(left: 23, right: 23),
                            child: Column(
                            children:  [
                              GestureDetector(
                                onTap: () => {
                                  print('Category 7'),
                                  toolbarFocus('Category 7'),
                                  searchInputCTRL.clear(),
                                  context.read<ProgramsBloc>().add(GetProgramsByCategorySeven())
                                },
                                child: 
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(width: 4.0, color: category == 'Category 7' ? Color.fromARGB(255, 255, 173, 58): Colors.transparent),
                                      )
                                    ),
                                    child: Column(
                                      children: const [
                                        Icon(Icons.camera, color: Colors.white, size: 32),
                                        SizedBox(height: 4),
                                        Text(
                                          'Category 7',
                                          style: TextStyle(color: Colors.white, fontSize: 8),
                                          textAlign: TextAlign.center
                                        ),
                                        SizedBox(height: 5),
                                      ],
                                  )
                                  )
                              ),
                            ]
                          ) 
                          ), 
                          // Category 8
                          Padding(
                            padding: const EdgeInsets.only(left: 23, right: 23),
                            child: Column(
                            children:  [
                              GestureDetector(
                                onTap: () => {
                                  print('Category 8'),
                                  toolbarFocus('Category 8'),
                                  searchInputCTRL.clear(),
                                  context.read<ProgramsBloc>().add(GetProgramsByCategoryEight())
                                },
                                child: 
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(width: 4.0, color: category == 'Category 8' ? Color.fromARGB(255, 255, 173, 58): Colors.transparent),
                                      )
                                    ),
                                    child: Column(
                                      children: const [
                                        Icon(Icons.camera, color: Colors.white, size: 32),
                                        SizedBox(height: 4),
                                        Text(
                                          'Category 8',
                                          style: TextStyle(color: Colors.white, fontSize: 8),
                                          textAlign: TextAlign.center
                                        ),
                                        SizedBox(height: 5),
                                      ],
                                  )
                                  )
                              ),
                            ]
                          ) 
                          ), 
                        ],
                      ),
                  )
            ])),
           
        ),
    );
  }
}