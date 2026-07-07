import 'package:flutter/material.dart';

class DoctorListData extends StatefulWidget {
  final String name;
  final String categary;
  final String location;
  final double rating;
  final int reviewcount;

  final VoidCallback ontap;
  const DoctorListData({
    super.key,
    required this.categary,
    required this.location,
    required this.name,
    required this.rating,
    required this.reviewcount,
    required this.ontap,
  });

  @override
  State<DoctorListData> createState() => _DocterListDataState();
}

class _DocterListDataState extends State<DoctorListData> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      //  () {
      //   showModalBottomSheet(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return SizedBox(
      //         width: double.infinity,
      //         height: 350,
      //         child: Column(
      //           children: [
      //             SizedBox(height: 30),
      //             Center(
      //               child: Text(
      //                 "Remove from Favorites?",
      //                 style: TextStyle(
      //                   fontSize: 20,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(20.0),
      //               child: DocterListData(ontap: () {

      //               },),
      //             ),

      //             Padding(
      //               padding: const EdgeInsets.only(
      //                 top: 10,
      //                 left: 20,
      //                 right: 20,
      //               ),
      //               child: Row(
      //                 children: [
      //                   Expanded(
      //                     child: ElevatedButton(
      //                       style: ElevatedButton.styleFrom(
      //                         backgroundColor: Colors.grey.shade300,
      //                       ),
      //                       onPressed: () {
      //                         Navigator.pop(context);
      //                       },
      //                       child: Text(
      //                         "Cancel",
      //                         style: TextStyle(
      //                           fontSize: 14,
      //                           color: Colors.black,
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                   SizedBox(width: 20),
      //                   Expanded(
      //                     child: ElevatedButton(
      //                       style: ElevatedButton.styleFrom(
      //                         backgroundColor: Colors.black,
      //                       ),
      //                       onPressed: () {},
      //                       child: Text(
      //                         "Yes, Remove",
      //                         style: TextStyle(
      //                           fontSize: 14,
      //                           color: Colors.white,
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       );
      //     },
      //   );
      // },
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Container(
          width: double.infinity,
          //height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),

          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 109,
                      width: 109,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),

                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/skip_screen_image_c.png",
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            SizedBox(height: 1),
                            Divider(color: Colors.grey),

                            SizedBox(height: 1),
                            Text(
                              widget.categary,
                              style: TextStyle(
                                color: Colors.grey.shade700,

                                fontSize: 14,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.grey.shade500,
                                ),
                                Text(
                                  widget.location,
                                  style: TextStyle(
                                    color: Colors.grey.shade500,

                                    fontSize: 14,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 20),
                                Text(
                                  widget.rating.toString(),
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(width: 10),
                                Text("|", style: TextStyle(color: Colors.grey)),
                                SizedBox(width: 10),

                                Text(
                                  widget.reviewcount.toString(),
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  "Reviews",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
