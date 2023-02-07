import 'package:flutter/material.dart';
import 'package:layout/login/login-page.dart';
import '../home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../global-styles.dart';
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:skeleton_text/skeleton_text.dart';
import '../../custom-libs/onboarding.api.dart';
import '../programs/program-page/program-page.dart';
import 'package:video_player/video_player.dart';

final Map<String, String> faqs = {
    "What is the Front End Framework used in this app?": "Flutter! ?",
    "Question 2": "What is this question?",
    "Question 3": "What is this question?",
    "Question 4": "What is this question?",
    "Question 5": "What is this question?",
};


class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.asset(
      'assets/unreal_basecamp_video_1.mp4',
    );

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.setVolume(0.0);
    _controller.play();

    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {    

          print(state);
          return state.status.isSuccess 
            ? ListView(
                children: [
                 
                 // Welcome Header
                 Container(
                  height: 250,
                  decoration: const BoxDecoration(
                    // color: Colors.black45,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          FutureBuilder(
                            future: _initializeVideoPlayerFuture,
                            builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.done) {
                              // If the VideoPlayerController has finished initialization, use
                              // the data it provides to limit the aspect ratio of the video.
                              return AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                // Use the VideoPlayer widget to display the video.
                                child: VideoPlayer(_controller),
                              );
                            } else {
                              // If the VideoPlayerController is still initializing, show a
                              // loading spinner.
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 8, bottom: 8),
                            child: Image.asset(
                            'assets/journi_logo.png',
                              semanticLabel: "Journi Logo",
                              height: 20,
                          ),
                          )
                      ],
                      )
                      // const SizedBox(height: 20),
                      
                      // https://docs.flutter.dev/cookbook/plugins/play-video
                      // VideoPlayer(_videoController)
                    ],
                  ),
                  ),

                 Container(
                  height: 260,
                  alignment: Alignment.topLeft,
                  // margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(16),
                        child: Column(children: const [
                          Text('Welcome to The Journi App!', style: TextStyle(fontSize: 24, color: Color.fromARGB(240, 19, 119, 200))),
                          SizedBox(height: 16),
                          Text('This app is for demo purposes only. This is a home page dedicated to whatever needs your business logic needs. It is intended to capture and anticipate the most frequent things a user does in a given app, and places them all in one place so that many of the apps features are more accessible. ',
                            style: TextStyle(fontSize: 16)),
                        ],)
                      ),
                      const SizedBox(height: 50),
                      // Row(children: const [
                      //   Text('Any questions or concerns?', 
                      //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)
                      //   ),
                      //   SizedBox(width: 80),
                      //   ElevatedButton(
                      //     onPressed: null,
                      //     child: Text('Tap'))
                      // ],)
                    ],
                  ),
                  ),
                
                 // Latest
                 Container(
                  height: 80,
                  alignment: Alignment.topLeft,decoration: const BoxDecoration(
                    color: Color(0xFFF1F1F1)
                  ),
                  padding: const EdgeInsets.only(left: 20, top: 40),
                  child: const Text('Latest Things To Do', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 224, 131, 0))),
                  ),

                 // 5 closest Programs to current date
                  Container(
                  height: 550,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF1F1F1)
                  ),
                  child: ListView.builder(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                     return Container(
                       margin: const EdgeInsets.only(right: 10),
                        width: MediaQuery.of(context).size.width - 40,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 300,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                   image: NetworkImage(state.programs[index].photo),
                                   fit: BoxFit.cover
                                 )

                              ),
                            ),

                            const SizedBox(height: 20),
                            Container(
                              margin: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Text(state.programs[index].title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(240, 19, 119, 200))),
                                  const SizedBox(height: 16),
                                  Text(state.programs[index].summary,  style: const TextStyle(fontSize: 14)),
                                  // Text('${state.programs[index].date}', style: TextStyle(fontSize: 14)),
                                ],
                              ),
                            ),

                            const SizedBox(height: 16),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 224, 131, 0)),
                              onPressed: () => {
                              Navigator.of(context).push(
                                 MaterialPageRoute(
                                   builder: (context) =>  ProgramPage(program: state.programs[index], userEmail: loginEmail),
                                 ),
                               )
                            }, child: Text('Tap'))
                          ],
                        ),
                      );
                    }
                    ,
                  ),
                ),

                  // Photos
                  // 1000x850
                  Container(
                  height: 50,
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, top: 20),
                  child: const Text('Photos', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 224, 131, 0))),
                  ),

                  Container(
                  height: 340,
                  decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black12))),
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        width: MediaQuery.of(context).size.width - 20,
                        child: Stack(
                          // alignment: Alignment.bottomRight,
                          children: [
                            Image.asset(
                            'assets/demo_photo_1.png',
                              semanticLabel: "Journi Logo",
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              margin: const EdgeInsets.only(right: 8, bottom: 40),
                              child: Image.asset(
                              'assets/journi_logo.png',
                                semanticLabel: "Journi Logo",
                                height: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        width: MediaQuery.of(context).size.width - 20,
                        child: Stack(
                          textDirection: TextDirection.ltr,
                          children: [
                            Image.asset(
                            'assets/demo_photo_2.png',
                              semanticLabel: "Journi Logo",
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              margin: const EdgeInsets.only(right: 8, bottom: 40),
                              child: Image.asset(
                              'assets/journi_logo.png',
                                semanticLabel: "Journi Logo",
                                height: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        width: MediaQuery.of(context).size.width - 20,
                        child: Stack(
                          textDirection: TextDirection.ltr,
                          children: [
                            Image.asset(
                            'assets/demo_photo_3.png',
                              semanticLabel: "Journi Logo",
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              margin: const EdgeInsets.only(right: 8, bottom: 40),
                              child: Image.asset(
                              'assets/journi_logo.png',
                                semanticLabel: "Journi Logo",
                                height: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        width: MediaQuery.of(context).size.width - 20,
                        child: Stack(
                          textDirection: TextDirection.ltr,
                          children: [
                            Image.asset(
                            'assets/demo_photo_4.png',
                              semanticLabel: "Journi Logo",
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              margin: const EdgeInsets.only(right: 8, bottom: 40),
                              child: Image.asset(
                              'assets/journi_logo.png',
                                semanticLabel: "Journi Logo",
                                height: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 8),
                        width: MediaQuery.of(context).size.width - 20,
                        child: Stack(
                          textDirection: TextDirection.ltr,
                          children: [
                            Image.asset(
                            'assets/demo_photo_5.png',
                              semanticLabel: "Journi Logo",
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              margin: const EdgeInsets.only(right: 8, bottom: 40),
                              child: Image.asset(
                              'assets/journi_logo.png',
                                semanticLabel: "Journi Logo",
                                height: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                      
                    ],
                  )
                ),

                  // FAQ
                  Container(
                    height: 650,
                    decoration: const BoxDecoration(
                    // color: Colors.black,
                  ),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(16),
                        child: const Text('FAQs', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 224, 131, 0))),
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
                            headerBackgroundColorOpened: Color.fromARGB(255, 218, 127, 0),
                            header: Text('What is Journi?', style:  TextStyle(color: Colors.white, fontSize: 17),),
                            content: Text('We are a non-profit organization dedicated to equipping communities with the skills and know-how to jump start local economies; to allow those communities to become globally competitive.'),
                            contentHorizontalPadding: 20,
                            contentBorderWidth: 1,
                            // onOpenSection: () => print('onOpenSection ...'),
                            // onCloseSection: () => print('onCloseSection ...'),
                          ),
                          AccordionSection(
                            isOpen: true,
                            leftIcon: const Icon(Icons.add, color: Colors.white),
                            headerBackgroundColor: Color.fromARGB(240, 19, 119, 200),
                            headerBackgroundColorOpened: Color.fromARGB(255, 218, 127, 0),
                            header: Text('What is the Front End Tech used in this app?', style:  TextStyle(color: Colors.white, fontSize: 17),),
                            content: Text('This app was built with Flutter, an open source framework by Google for building, natively compiled, multi-platform applications from a single codebase. In other words, this app can be built to be displayed on an iPhone, an Android, a Web Browser, and even apps for TVs. \n\nFlutter uses the language Dart, another open source project from Google. Dart is Object Oriented, designed for client side development,  and can be used in Mobile Apps, Web Apps, etc.'),
                            contentHorizontalPadding: 20,
                            contentBorderWidth: 1,
                            // onOpenSection: () => print('onOpenSection ...'),
                            // onCloseSection: () => print('onCloseSection ...'),
                          ),
                          AccordionSection(
                            isOpen: true,
                            leftIcon: const Icon(Icons.add, color: Colors.white),
                            headerBackgroundColor: Color.fromARGB(240, 19, 119, 200),
                            headerBackgroundColorOpened: Color.fromARGB(255, 218, 127, 0),
                            header: Text('What is the Back End Tech used in this app', style:  TextStyle(color: Colors.white, fontSize: 17),),
                            content: Text('On the server side, this is a NodeJS application. Node.js is a cross-platform, open-source server environment that can run on Windows, Linux, Unix, macOS, and more. Node.js is a back-end JavaScript runtime environment, runs on the V8 JavaScript Engine, and executes JavaScript code outside a web browser. \n\nInstead of being written in JavaScript, this server is written in TypeScript for better performance. TypeScript is a free and open source high-level programming language developed and maintained by Microsoft. It is a strict syntactical superset of JavaScript and adds optional static typing to the language. It is designed for the development of large applications and transpiles to JavaScript.'),
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
                  ? ListView.builder(
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
                  )
                : state.status.isError 
                  ? const Text('There was an Error') : const Text('???');
        } 
    );
  }
}