import 'package:docter_appointment_app/View/Authentication/componets/input_button.dart';
import 'package:docter_appointment_app/View/Authentication/componets/input_feild.dart';
import 'package:docter_appointment_app/View/Authentication/componets/normal_textfeild.dart';
import 'package:docter_appointment_app/View/home_screens/home_layout.dart';
import 'package:docter_appointment_app/View/home_screens/home_screen.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? selectedValue;
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
        
                NormalTextfeild(hind: AppLocalizations.of(context)!.editProfileName),
                NormalTextfeild(hind: AppLocalizations.of(context)!.editProfileName),
                NormalTextfeild(hind: AppLocalizations.of(context)!.editProfileEmail),
                InputFeild(hind: AppLocalizations.of(context)!.editProfileDpb, icon: Icons.calendar_month,controller: emailcontroller,),
                SizedBox(height: 20),
        
                Container(
                  
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                    border: BoxBorder.all(width: 2,
                    color: Colors.grey
                    )
                    
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      left: 20
                    ),
                    child: DropdownButton(
                      value: selectedValue,
                      isExpanded: true,
                      hint: Text(AppLocalizations.of(context)!.editProfileGender,style: TextStyle(
                        
                        color: Colors.grey
                      ),),
                    
                    
                      
                      items: ["Male", "Female", "Other"]
                          .map(
                            (item) =>
                                DropdownMenuItem(value: item, child: Text(item)),
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
        
                SizedBox(height: 20,),
        
                InputButton(inputText: AppLocalizations.of(context)!.save,
                nextpage: ()=> Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context)=> const HomeLayout()
                        )
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
