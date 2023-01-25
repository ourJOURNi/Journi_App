import 'package:flutter/material.dart';
import 'package:layout/tabs/profile/bloc/profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../profile/profile-modals.dart';
import '../../global-styles.dart';
 

  class ProfilesLayout extends StatelessWidget {
    const ProfilesLayout({super.key});

    @override
    Widget build(BuildContext context) {
      return BlocBuilder<ProfilesBloc, ProfilesState>(
        builder: (blocContext, state) {
          return state.status.isSuccess
            ? Scaffold(
              body: ListView(
               padding: const EdgeInsets.all(20),
               children: [ 
                 Column(
                   children: [
                     // const Text('Journi Profile', style: profileNameHeaderStyle),
                       // Logo
                       Container(
                         height: 40,
                         margin: const EdgeInsets.only(bottom: 50, top: 50),
                         child: Image.asset(
                           'assets/journi_logo.png',
                           semanticLabel: "Journi Logo",
                         ),
                       ),
                     transparentDivider,
                  ],
          ),
          Text(state.profile.email),
          Text(state.profile.firstName),
          Text(state.profile.lastName),
          Text(state.profile.dateRegistered),
          transparentDivider,
          transparentDivider,
          updatePhotoModal(context, blocContext),
          updateNameModal(context, blocContext, state.profile.email, state.profile.firstName, state.profile.lastName),
          updateEmailModal(context, state, state.profile.email),
          updatePasswordModal(context, blocContext, state.profile.email),
          logoutModal(context)
        ],
      ),
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
                        ],
                      ): const Text('??');
                          }
        );
  }
}
