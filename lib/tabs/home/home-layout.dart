import 'package:flutter/material.dart';
import '../home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../global-styles.dart';
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';


final Map<String, String> faqs = {
    "Question_1": "What is this question?",
    "Question 2": "What is this question?",
    "Question 3": "What is this question?",
    "Question 4": "What is this question?",
    "Question 5": "What is this question?",
};

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {    

          print(state);
          return state.status.isSuccess 
            ? ListView(
                children: [
                 
                 // Welcome Header
                 Container(
                  height: 575,
                  margin: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    // color: Colors.black45,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text('Welcome to the App!', style: 
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)
                      ),
                      const SizedBox(height: 20),
                      Image.asset(
                        'assets/det_skyline.jpeg',
                        semanticLabel: "Journi Logo",
                      ),
                      const SizedBox(height: 50),
                      const Text('This app is for demo purposes only. This is a home page dedicated to whatever needs your business logic needs. It is intended to capture and anticipate the most frequent things a user does in a given app, and places them all in one place so that many of the apps features are more accessible. '),
                      const SizedBox(height: 50),
                      Row(children: const [
                        Text('Any questions or concerns?', 
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)
                        ),
                        SizedBox(width: 80),
                        ElevatedButton(
                          onPressed: null,
                          child: Text('Tap'))
                      ],)
                    ],
                  ),
                ),

                 // Latest things To Do
                 Container(
                  height: 50,
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 20, top: 100),
                  child: const Text('Latest Things To Do', style: TextStyle(fontSize: 20)),
                ),

                // 5 closest Programs to current date
                 Container(
                  height: 450,
                  decoration: const BoxDecoration(
                  ),
                  child: ListView.builder(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                     return Container(
                       alignment: Alignment.topLeft,
                        width: MediaQuery.of(context).size.width - 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                            'assets/det_skyline.jpeg',
                              semanticLabel: "Journi Logo",
                            ),

                            SizedBox(height: 50),
                            Container(
                              child: Column(
                                children: [
                                  Text('${state.programs[index].title}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                  Text('${state.programs[index].date}', style: TextStyle(fontSize: 14,)),
                                  Text('${state.programs[index].summary}',  style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),

                            SizedBox(height: 16),
                            ElevatedButton(onPressed: null, child: Text('Tap'))
                          ],
                        ),
                      );
                    }
                    ,
                  ),
                ),

                Container(
                  height: 50,
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 20, top: 50),
                  child: const Text('Photos', style: TextStyle(fontSize: 20)),
                ),

                 // Photos
                 Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    // color: Colors.black54,
                  ),
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      
                      Container(
                        width: MediaQuery.of(context).size.width - 20,
                        child: Column(
                          textDirection: TextDirection.ltr,
                          children: [
                            Image.asset(
                            'assets/det_skyline.jpeg',
                              semanticLabel: "Journi Logo",
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 20,
                        child: Column(
                          textDirection: TextDirection.ltr,
                          children: [
                            Image.asset(
                            'assets/det_skyline.jpeg',
                              semanticLabel: "Journi Logo",
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 20,
                        child: Column(
                          textDirection: TextDirection.ltr,
                          children: [
                            Image.asset(
                            'assets/det_skyline.jpeg',
                              semanticLabel: "Journi Logo",
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 20,
                        child: Column(
                          textDirection: TextDirection.ltr,
                          children: [
                            Image.asset(
                            'assets/det_skyline.jpeg',
                              semanticLabel: "Journi Logo",
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 20,
                        child: Column(
                          textDirection: TextDirection.ltr,
                          children: [
                            Image.asset(
                            'assets/det_skyline.jpeg',
                              semanticLabel: "Journi Logo",
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 20,
                        child: Column(
                          textDirection: TextDirection.ltr,
                          children: [
                            Image.asset(
                            'assets/det_skyline.jpeg',
                              semanticLabel: "Journi Logo",
                            ),
                          ],
                        ),
                      ),
                      
                    ],
                  )
                ),

                 // FAQ
                 Container(
                  height: 600,
                  decoration: const BoxDecoration(
                    // color: Colors.black,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(16),
                        child: Text('FAQs', style: TextStyle(fontSize: 20)),
                      ),
                      Accordion(
                        maxOpenSections: 1,
                        headerBackgroundColorOpened: Colors.black54,
                        scaleWhenAnimating: true,
                        openAndCloseAnimation: true,
                        headerPadding:
                            const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                        sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                        sectionClosingHapticFeedback: SectionHapticFeedback.light,
                        children: [

                          AccordionSection(
                            isOpen: true,
                            leftIcon: const Icon(Icons.add, color: Colors.white),
                            headerBackgroundColor: Color.fromARGB(240, 19, 119, 200),
                            headerBackgroundColorOpened: const Color.fromARGB(255, 255, 173, 58),
                            header: Text('Question_1', style:  TextStyle(color: Colors.white, fontSize: 17),),
                            content: Text('What is this question?'),
                            contentHorizontalPadding: 20,
                            contentBorderWidth: 1,
                            // onOpenSection: () => print('onOpenSection ...'),
                            // onCloseSection: () => print('onCloseSection ...'),
                          ),
                          AccordionSection(
                            isOpen: true,
                            leftIcon: const Icon(Icons.add, color: Colors.white),
                            headerBackgroundColor: Color.fromARGB(240, 19, 119, 200),
                            headerBackgroundColorOpened: const Color.fromARGB(255, 255, 173, 58),
                            header: Text('Question_2', style:  TextStyle(color: Colors.white, fontSize: 17),),
                            content: Text('What is this question?'),
                            contentHorizontalPadding: 20,
                            contentBorderWidth: 1,
                            // onOpenSection: () => print('onOpenSection ...'),
                            // onCloseSection: () => print('onCloseSection ...'),
                          ),
                          AccordionSection(
                            isOpen: true,
                            leftIcon: const Icon(Icons.add, color: Colors.white),
                            headerBackgroundColor: Color.fromARGB(240, 19, 119, 200),
                            headerBackgroundColorOpened: const Color.fromARGB(255, 255, 173, 58),
                            header: Text('Question_3', style:  TextStyle(color: Colors.white, fontSize: 17),),
                            content: Text('What is this question?'),
                            contentHorizontalPadding: 20,
                            contentBorderWidth: 1,
                            // onOpenSection: () => print('onOpenSection ...'),
                            // onCloseSection: () => print('onCloseSection ...'),
                          ),
                          AccordionSection(
                            isOpen: true,
                            leftIcon: const Icon(Icons.add, color: Colors.white),
                            
                            headerBackgroundColor: Color.fromARGB(240, 19, 119, 200),
                            headerBackgroundColorOpened: const Color.fromARGB(255, 255, 173, 58),
                            header: Text('Question_4', style:  TextStyle(color: Colors.white, fontSize: 17),),
                            content: Text('What is this question?'),
                            contentHorizontalPadding: 20,
                            contentBorderWidth: 1,
                            // onOpenSection: () => print('onOpenSection ...'),
                            // onCloseSection: () => print('onCloseSection ...'),
                          ),
                          AccordionSection(
                            isOpen: true,
                            leftIcon: const Icon(Icons.add, color: Colors.white),
                            headerBackgroundColor: Color.fromARGB(240, 19, 119, 200),
                            headerBackgroundColorOpened: const Color.fromARGB(255, 255, 173, 58),
                            header: Text('Question_5', style:  TextStyle(color: Colors.white, fontSize: 17),),
                            content: Text('What is this question?'),
                            contentHorizontalPadding: 20,
                            contentBorderWidth: 1,
                            // onOpenSection: () => print('onOpenSection ...'),
                            // onCloseSection: () => print('onCloseSection ...'),
                          ),
                          
                          ]
                       )
                    ],
                  ),
                )
                ],
              ) : state.status.isLoading 
                  ? const Text('Loading')
                : state.status.isError 
                  ? const Text('There was an Error') : const Text('???');
        } 
    );
  }
}