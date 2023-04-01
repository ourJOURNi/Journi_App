import 'package:flutter/material.dart';
import 'package:layout/login/register-page.dart';
import 'package:layout/tabs/profile/bloc/profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../profile/profile-modals.dart';
import '../../global-styles.dart';
import 'package:skeleton_text/skeleton_text.dart';

  class ProfilesLayout extends StatelessWidget {
    const ProfilesLayout({super.key});

    @override
    Widget build(BuildContext context) {
      return BlocBuilder<ProfilesBloc, ProfilesState>(
        builder: (blocContext, state) {
          return state.status.isSuccess
            ? Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: const Color.fromARGB(239, 115, 158, 194),
                shadowColor: Colors.transparent,
              ),
              body: ListView(
               children: [ 
                
                Container(
                  color: const Color.fromARGB(239, 115, 158, 194),
                  height: 250,
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(120)),
                        child: CircleAvatar(
                        radius: 75,
                        backgroundImage: NetworkImage(state.profile.profilePicture)
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        // decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black12))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${state.profile.firstName} ${state.profile.lastName}', style: const TextStyle(fontSize: 24, color: Colors.white)),
                            Text(state.profile.email, style: const TextStyle(fontSize: 13, color: Colors.white60))
                          ]
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                updatePhotoModal(context, blocContext, state.profile.profilePicture),
                updateNameModal(context, blocContext, state.profile.email, state.profile.firstName, state.profile.lastName),
                updateEmailModal(context, state, state.profile.email),
                updatePasswordModal(context, blocContext, state.profile.email),
                deleteProfileModal(context, email),
                logoutModal(context)
              ],
              ),
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
                  ? Stack(
                    children: [
                      ListView(
                          padding: const EdgeInsets.all(8),
                          children: const <Widget>[
                            SizedBox(height: 200),
                            Text('Error...')
                          ],
                        ),
                    ],
                  ): const Text('??');
                }
        );
  }
}
