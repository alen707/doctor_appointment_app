import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fa.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fa'),
  ];

  /// Title displayed on onboarding screen A
  ///
  /// In en, this message translates to:
  /// **'Meet Doctors Online'**
  String get screenAtitle;

  /// No description provided for @screenAdiscription.
  ///
  /// In en, this message translates to:
  /// **'Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.'**
  String get screenAdiscription;

  /// No description provided for @screenBtitle.
  ///
  /// In en, this message translates to:
  /// **'Connect with Specialists'**
  String get screenBtitle;

  /// No description provided for @screenBdiscription.
  ///
  /// In en, this message translates to:
  /// **'Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.'**
  String get screenBdiscription;

  /// No description provided for @screenCtitle.
  ///
  /// In en, this message translates to:
  /// **'Thousands of Online Specialists'**
  String get screenCtitle;

  /// No description provided for @screenCdiscription.
  ///
  /// In en, this message translates to:
  /// **' Explore a Vast Array of Online Medical Specialists, Offering an Extensive Range of Expertise Tailored to Your Healthcare Needs.'**
  String get screenCdiscription;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @fillYourProfile.
  ///
  /// In en, this message translates to:
  /// **'Fill Your Profile'**
  String get fillYourProfile;

  /// No description provided for @editProfileName.
  ///
  /// In en, this message translates to:
  /// **'Michael Jordan'**
  String get editProfileName;

  /// No description provided for @editProfileNickname.
  ///
  /// In en, this message translates to:
  /// **'Nickname'**
  String get editProfileNickname;

  /// No description provided for @editProfileEmail.
  ///
  /// In en, this message translates to:
  /// **'name@example.com'**
  String get editProfileEmail;

  /// No description provided for @editProfileDpb.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get editProfileDpb;

  /// No description provided for @editProfileGender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get editProfileGender;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget Password?'**
  String get forgetPassword;

  /// No description provided for @forgotPasswordDiscription.
  ///
  /// In en, this message translates to:
  /// **'Enter your Email, we will send you a verification code.'**
  String get forgotPasswordDiscription;

  /// No description provided for @yourMail.
  ///
  /// In en, this message translates to:
  /// **'Your Email'**
  String get yourMail;

  /// No description provided for @health.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get health;

  /// No description provided for @pal.
  ///
  /// In en, this message translates to:
  /// **'Pal'**
  String get pal;

  /// No description provided for @sendCode.
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get sendCode;

  /// No description provided for @createAcount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAcount;

  /// No description provided for @loginDiscription.
  ///
  /// In en, this message translates to:
  /// **'We are here to help you!'**
  String get loginDiscription;

  /// No description provided for @youerName.
  ///
  /// In en, this message translates to:
  /// **'Your Name'**
  String get youerName;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @google.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get google;

  /// No description provided for @facebook.
  ///
  /// In en, this message translates to:
  /// **'Continue with Facebook'**
  String get facebook;

  /// No description provided for @signin.
  ///
  /// In en, this message translates to:
  /// **' Sign In'**
  String get signin;

  /// No description provided for @signinDiscription.
  ///
  /// In en, this message translates to:
  /// **'Do you have an account ?'**
  String get signinDiscription;

  /// No description provided for @createNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Create new password'**
  String get createNewPassword;

  /// No description provided for @newPasswordDiscription.
  ///
  /// In en, this message translates to:
  /// **'Your new password must be different form previously used password'**
  String get newPasswordDiscription;

  /// No description provided for @conFormPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get conFormPassword;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @verifyCode.
  ///
  /// In en, this message translates to:
  /// **'Verify Code'**
  String get verifyCode;

  /// No description provided for @verifyCodeDiscription.
  ///
  /// In en, this message translates to:
  /// **'Enter the the code we just sent you on your registered Email'**
  String get verifyCodeDiscription;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **' Resend '**
  String get resend;

  /// No description provided for @resendDiscriprion.
  ///
  /// In en, this message translates to:
  /// **'Didn’t get the Code?'**
  String get resendDiscriprion;

  /// No description provided for @hi.
  ///
  /// In en, this message translates to:
  /// **'Hi, Welcome Back! '**
  String get hi;

  /// No description provided for @hiDiscription.
  ///
  /// In en, this message translates to:
  /// **'Hope you’re doing fine.'**
  String get hiDiscription;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **' Sign up'**
  String get signup;

  /// No description provided for @signupdiscription.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account yet?'**
  String get signupdiscription;

  /// No description provided for @forgetPasswordHi.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgetPasswordHi;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @serchDocter.
  ///
  /// In en, this message translates to:
  /// **'Search doctor...'**
  String get serchDocter;

  /// No description provided for @lockingfor.
  ///
  /// In en, this message translates to:
  /// **'Looking for'**
  String get lockingfor;

  /// No description provided for @specialistDocters.
  ///
  /// In en, this message translates to:
  /// **'Specialist Doctors?'**
  String get specialistDocters;

  /// No description provided for @shedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule an appointment with our'**
  String get shedule;

  /// No description provided for @ourdoc.
  ///
  /// In en, this message translates to:
  /// **'top doctors.'**
  String get ourdoc;

  /// No description provided for @categosies.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categosies;

  /// No description provided for @seeall.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeall;

  /// No description provided for @dentistry.
  ///
  /// In en, this message translates to:
  /// **'Dentistry'**
  String get dentistry;

  /// No description provided for @cardio.
  ///
  /// In en, this message translates to:
  /// **'Cardiolo..'**
  String get cardio;

  /// No description provided for @pulmono.
  ///
  /// In en, this message translates to:
  /// **'Pulmono..'**
  String get pulmono;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @neurology.
  ///
  /// In en, this message translates to:
  /// **'Neurology'**
  String get neurology;

  /// No description provided for @gastroen.
  ///
  /// In en, this message translates to:
  /// **'Gastroen..'**
  String get gastroen;

  /// No description provided for @laborato.
  ///
  /// In en, this message translates to:
  /// **'Laborato..'**
  String get laborato;

  /// No description provided for @vaccinat.
  ///
  /// In en, this message translates to:
  /// **'Vaccinat..'**
  String get vaccinat;

  /// No description provided for @nearbyMedicalCender.
  ///
  /// In en, this message translates to:
  /// **'Nearby Medical Centers'**
  String get nearbyMedicalCender;

  /// No description provided for @searchdochos.
  ///
  /// In en, this message translates to:
  /// **'Search Doctor, Hospital'**
  String get searchdochos;

  /// No description provided for @alldocters.
  ///
  /// In en, this message translates to:
  /// **'All Doctors'**
  String get alldocters;

  /// No description provided for @searchdoc.
  ///
  /// In en, this message translates to:
  /// **'Search doctor...'**
  String get searchdoc;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @defalt.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get defalt;

  /// No description provided for @found.
  ///
  /// In en, this message translates to:
  /// **'532 founds'**
  String get found;

  /// No description provided for @docdetails.
  ///
  /// In en, this message translates to:
  /// **'Doctor Details'**
  String get docdetails;

  /// No description provided for @patients.
  ///
  /// In en, this message translates to:
  /// **'patients'**
  String get patients;

  /// No description provided for @experience.
  ///
  /// In en, this message translates to:
  /// **'experience'**
  String get experience;

  /// No description provided for @rating.
  ///
  /// In en, this message translates to:
  /// **'rating'**
  String get rating;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'reviews'**
  String get reviews;

  /// No description provided for @aboutme.
  ///
  /// In en, this message translates to:
  /// **'About me'**
  String get aboutme;

  /// No description provided for @workingtime.
  ///
  /// In en, this message translates to:
  /// **'Working Time'**
  String get workingtime;

  /// No description provided for @reviewsss.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviewsss;

  /// No description provided for @bookappointment.
  ///
  /// In en, this message translates to:
  /// **'Book Appointment'**
  String get bookappointment;

  /// No description provided for @selectdate.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectdate;

  /// No description provided for @selecthour.
  ///
  /// In en, this message translates to:
  /// **'Select Hour'**
  String get selecthour;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @t1.
  ///
  /// In en, this message translates to:
  /// **'09.00 AM'**
  String get t1;

  /// No description provided for @t2.
  ///
  /// In en, this message translates to:
  /// **'09.30 AM'**
  String get t2;

  /// No description provided for @t3.
  ///
  /// In en, this message translates to:
  /// **'10.00 AM'**
  String get t3;

  /// No description provided for @t4.
  ///
  /// In en, this message translates to:
  /// **'10.30 AM'**
  String get t4;

  /// No description provided for @t5.
  ///
  /// In en, this message translates to:
  /// **'11.00 AM'**
  String get t5;

  /// No description provided for @t6.
  ///
  /// In en, this message translates to:
  /// **'11.30 AM'**
  String get t6;

  /// No description provided for @t7.
  ///
  /// In en, this message translates to:
  /// **'3.00 PM'**
  String get t7;

  /// No description provided for @t8.
  ///
  /// In en, this message translates to:
  /// **'3.30 PM'**
  String get t8;

  /// No description provided for @t9.
  ///
  /// In en, this message translates to:
  /// **'4.00 PM'**
  String get t9;

  /// No description provided for @t10.
  ///
  /// In en, this message translates to:
  /// **'4.30 PM'**
  String get t10;

  /// No description provided for @t11.
  ///
  /// In en, this message translates to:
  /// **'5.00 PM'**
  String get t11;

  /// No description provided for @t12.
  ///
  /// In en, this message translates to:
  /// **'5.30 PM'**
  String get t12;

  /// No description provided for @mybookings.
  ///
  /// In en, this message translates to:
  /// **'My Bookings'**
  String get mybookings;

  /// No description provided for @upcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get upcoming;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @canceled.
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get canceled;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @reschedule.
  ///
  /// In en, this message translates to:
  /// **'Reschedule'**
  String get reschedule;

  /// No description provided for @rebook.
  ///
  /// In en, this message translates to:
  /// **'Re-Book'**
  String get rebook;

  /// No description provided for @addreview.
  ///
  /// In en, this message translates to:
  /// **'Add Review'**
  String get addreview;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @doctors.
  ///
  /// In en, this message translates to:
  /// **'Doctors'**
  String get doctors;

  /// No description provided for @hospitals.
  ///
  /// In en, this message translates to:
  /// **'Hospitals'**
  String get hospitals;

  /// No description provided for @removefromfavorites.
  ///
  /// In en, this message translates to:
  /// **'Remove from Favorites?'**
  String get removefromfavorites;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Yes, Remove'**
  String get remove;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @editprofile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editprofile;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @helpandsupport.
  ///
  /// In en, this message translates to:
  /// **'Help and Support'**
  String get helpandsupport;

  /// No description provided for @termsandconditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get termsandconditions;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'LogOut'**
  String get logout;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @yesLogout.
  ///
  /// In en, this message translates to:
  /// **'Yes, Logout'**
  String get yesLogout;

  /// No description provided for @logoutdiscription.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logoutdiscription;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fa'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fa':
      return AppLocalizationsFa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
