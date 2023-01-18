import 'package:flutter/material.dart';

class ProgramsToolbarWidget extends StatelessWidget {
  const ProgramsToolbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 210,
          child: 
            DecoratedBox(
              decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                 color: Color.fromARGB(113, 0, 0, 0).withOpacity(0.1),
                 spreadRadius: 2,
                 blurRadius: 7,
                 offset: Offset(0, 3), // changes position of shadow
               ),
              ]
           ),
              child: 
                Column(
            children: [
              // Search Bar
              const SizedBox(height: 60),
              Row(
                children: const [
                  Expanded(child: 
                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.filter_list),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                        hintText: 'What are you looking for?'
                      ),
                    ),)
                  )
                ],
              ),
              
              // Categories
              const SizedBox(height: 16),
              SizedBox(
                height: 80,
                child:   
                  ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      // Category 1
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                        children: const [
                          CircleAvatar(
                           backgroundColor: Colors.black,
                           radius: 23,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Cat 1',
                            style: TextStyle(color: Colors.black87, fontSize: 12),
                            textAlign: TextAlign.center
                          )
                        ]
                      ) 
                    ), 
                      // Category 1
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                        children: const [
                          CircleAvatar(
                           backgroundColor: Colors.black,
                           radius: 23,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Cat 1',
                            style: TextStyle(color: Colors.black87, fontSize: 12),
                            textAlign: TextAlign.center
                          )
                        ]
                      ) 
                    ), 
                      // Category 1
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                        children: const [
                          CircleAvatar(
                           backgroundColor: Colors.black,
                           radius: 23,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Cat 1',
                            style: TextStyle(color: Colors.black87, fontSize: 12),
                            textAlign: TextAlign.center
                          )
                        ]
                      ) 
                    ), 
                      // Category 1
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                        children: const [
                          CircleAvatar(
                           backgroundColor: Colors.black,
                           radius: 23,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Cat 1',
                            style: TextStyle(color: Colors.black87, fontSize: 12),
                            textAlign: TextAlign.center
                          )
                        ]
                      ) 
                    ), 
                      // Category 1
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                        children: const [
                          CircleAvatar(
                           backgroundColor: Colors.black,
                           radius: 23,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Cat 1',
                            style: TextStyle(color: Colors.black87, fontSize: 12),
                            textAlign: TextAlign.center
                          )
                        ]
                      ) 
                    ), 
                      // Category 1
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                        children: const [
                          CircleAvatar(
                           backgroundColor: Colors.black,
                           radius: 23,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Cat 1',
                            style: TextStyle(color: Colors.black87, fontSize: 12),
                            textAlign: TextAlign.center
                          )
                        ]
                      ) 
                    ), 
                      // Category 1
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                        children: const [
                          CircleAvatar(
                           backgroundColor: Colors.black,
                           radius: 23,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Cat 1',
                            style: TextStyle(color: Colors.black87, fontSize: 12),
                            textAlign: TextAlign.center
                          )
                        ]
                      ) 
                    ), 
                      // Category 1
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                        children: const [
                          CircleAvatar(
                           backgroundColor: Colors.black,
                           radius: 23,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Cat 1',
                            style: TextStyle(color: Colors.black87, fontSize: 12),
                            textAlign: TextAlign.center
                          )
                        ]
                      ) 
                    ), 
                      
                  ],
                ),
              )
            ])),
           
        );
  }
}