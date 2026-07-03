import 'package:docter_appointment_app/View/Authentication/componets/input_button.dart';
import 'package:docter_appointment_app/View/home_screens/componets/book_appoinment_timeselection.dart';
import 'package:docter_appointment_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class BookAppoinmentScreen extends StatefulWidget {
  const BookAppoinmentScreen({super.key});

  @override
  State<BookAppoinmentScreen> createState() => _BookAppoinmentScreenState();
}

class _BookAppoinmentScreenState extends State<BookAppoinmentScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  
  @override
  Widget build(BuildContext context) {
    List<String> time = [
  AppLocalizations.of(context)!.t1,
  AppLocalizations.of(context)!.t2,
  AppLocalizations.of(context)!.t3,
  AppLocalizations.of(context)!.t4,
  AppLocalizations.of(context)!.t5,
  AppLocalizations.of(context)!.t6,
  AppLocalizations.of(context)!.t7,
  AppLocalizations.of(context)!.t8,
  AppLocalizations.of(context)!.t9,
  AppLocalizations.of(context)!.t10,
  AppLocalizations.of(context)!.t11,
  AppLocalizations.of(context)!.t12,
];
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            AppLocalizations.of(context)!.bookappointment,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

        leading: Icon(Icons.arrow_back),
        actions: [SizedBox(width: 30)],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.selectdate,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  todayTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),

                  selectedDecoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  selectedTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: false,
                ),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
              ),
              SizedBox(height: 10),

              Text(
                AppLocalizations.of(context)!.selecthour,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Colors.grey.shade300
              //     // border: Border.all(
              //     //   width: 2
              //     // )

              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Text("10:00"),
              //   ),

              // )
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.5,
                ),
                itemCount: time.length,
                itemBuilder: (context, index) {
                  return BookAppoinmentTmeselection(time: time[index]);
                },
              ),

              InputButton(inputText:  AppLocalizations.of(context)!.confirm, nextpage: () {
                  showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: const Text("Appointment Confirmed"),
    content: const Text(
      "Your appointment has been booked successfully.",
    ),
    actions: [
      
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text("OK"),
      ),
    ],
  ),
) ;
            
          },),
            ],
          ),
        ),
      ),
    );
  }
}
