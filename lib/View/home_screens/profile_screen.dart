import 'package:docter_appointment_app/View/Authentication/edit_profile_screen.dart';
import 'package:docter_appointment_app/View/Authentication/signin_screen.dart';
import 'package:docter_appointment_app/View/home_screens/components/profile_data_button.dart';
import 'package:docter_appointment_app/View/home_screens/favorites_layout.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.profile,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 168,
                          height: 168,

                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/profile_photo.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),

                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                            onPressed: () {},
                            icon: ImageIcon(
                              AssetImage("assets/icon/message-edit-new.png"),
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Daniel Martinez",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "+123 856479683",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ProfileDataButton(
              icons: AssetImage("assets/icon/user-edit.png"),
              title: AppLocalizations.of(context)!.editprofile,
              nextpage: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfileScreen(from: "profile"),
                ),
              ),
            ),
            ProfileDataButton(
              icons: AssetImage("assets/icon/heart.png"),
              title: AppLocalizations.of(context)!.favorites,
              nextpage: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesLayout()),
              ),
            ),
            ProfileDataButton(
              icons: AssetImage("assets/icon/notification.png"),
              title: AppLocalizations.of(context)!.notifications,
              nextpage: () {},
            ),
            ProfileDataButton(
              icons: AssetImage("assets/icon/setting-.png"),
              title: AppLocalizations.of(context)!.settings,
              nextpage: () {},
            ),
            ProfileDataButton(
              icons: AssetImage("assets/icon/message-question.png"),
              title: AppLocalizations.of(context)!.helpandsupport,
              nextpage: () {},
            ),
            ProfileDataButton(
              icons: AssetImage("assets/icon/security-safe.png"),
              title: AppLocalizations.of(context)!.termsandconditions,
              nextpage: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Text(
                                AppLocalizations.of(context)!.logout,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),

                              Text(
                                AppLocalizations.of(context)!.loginDiscription,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.grey.shade300,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          AppLocalizations.of(context)!.cancel,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SignUpScreen(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          AppLocalizations.of(
                                            context,
                                          )!.yesLogout,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ImageIcon(
                            AssetImage("assets/icon/logout.png"),
                            size: 24,
                          ),
                          SizedBox(width: 20),
                          Text(
                            AppLocalizations.of(context)!.logout,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
