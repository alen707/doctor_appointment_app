import 'package:docter_appointment_app/View/Authentication/componets/input_button.dart';
import 'package:docter_appointment_app/View/Authentication/componets/input_field.dart';
import 'package:docter_appointment_app/View/Authentication/componets/normal_textfield.dart';
import 'package:docter_appointment_app/View/home_screens/home_layout.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EditProfileScreen extends StatefulWidget {
  final String? from;
  const EditProfileScreen({super.key, required this.from});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? selectedValue;
  bool navi = true;

  final TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text(
          AppLocalizations.of(context)!.fillYourProfile,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 200,
                      height: 200,

                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/profile-avatar.png"),
                          colorFilter: ColorFilter.mode(
                            Colors.grey,
                            BlendMode.srcATop,
                          ),
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 120, left: 140),
                      child: IconButton(
                        onPressed: () {},
                        icon: ImageIcon(
                          AssetImage("assets/icon/edit_profile.png"),
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),

                NormalTextfield(
                  hind: AppLocalizations.of(context)!.editProfileName,
                ),
                NormalTextfield(
                  hind: AppLocalizations.of(context)!.editProfileName,
                ),
                NormalTextfield(
                  hind: AppLocalizations.of(context)!.editProfileEmail,
                ),
                InputField(
                  hind: AppLocalizations.of(context)!.editProfileDpb,
                  icon: Icons.calendar_month,
                  controller: emailcontroller,
                ),
                SizedBox(height: 20),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                    border: BoxBorder.all(width: 2, color: Colors.grey),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, left: 20),
                    child: DropdownButton(
                      value: selectedValue,
                      isExpanded: true,
                      hint: Text(
                        AppLocalizations.of(context)!.editProfileGender,
                        style: TextStyle(color: Colors.grey),
                      ),

                      items: ["Male", "Female", "Other"]
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                  ),
                ),

                SizedBox(height: 20),

                InputButton(
                  inputText: AppLocalizations.of(context)!.confirm,
                  nextpage: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Column(
                          children: [
                            Image.asset(
                              "assets/images/popupimage.png",
                              width: 130,
                              height: 130,
                            ),
                            SizedBox(height: 20),

                            const Text(
                              "Congratulations!",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: const Text(
                                "Your account is ready to use. You will be redirected to the Home Page in a few seconds....",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          const SpinKitCircle(color: Colors.blue, size: 50),
                        ],
                      ),
                    );

                    Future.delayed(Duration(seconds: 3), () {
                      //Navigator.pop(context);

                      if (widget.from == "profile") {
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeLayout(initialIndex: 3),
                          ),
                        );
                      } else {
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeLayout()),
                        );
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
