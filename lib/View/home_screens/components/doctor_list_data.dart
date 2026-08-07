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

      child: Container(
        width: double.infinity,
        //height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
             BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
            // BoxShadow(
            //   color: Colors.grey.shade400,
            //   spreadRadius: 1,
            //   blurRadius: 6,
            //   offset: const Offset(0, 5),
            // ),
          ],
        ),

        child: Container(
          //color: Colors.deepOrange,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                 
                  height: 112,
                  width: 112,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                            
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/skip_screen_image_c.png",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
          
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    // left: 8,
                    right: 8
                    ),
                  child: Container(
                    
                    // color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                widget.name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  overflow: TextOverflow.ellipsis,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                        
                            ImageIcon(
                              AssetImage("assets/icon/Like-icon.png"),
                              size: 20,
                            ),
                          ],
                        ),
                        SizedBox(height: 1),
                        Divider(color: Colors.grey.shade300),
                    
                        Text(
                          widget.categary,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                                              
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                         SizedBox(height: 4),
                                              
                        Row(
                          children: [
                            // Icon(
                            //   Icons.location_on,
                            //   color: Colors.grey.shade500,
                            // ),
                            ImageIcon(
                              AssetImage("assets/icon/location.png"),
                              color: Colors.grey.shade700,
                              size: 16,
                            ),
                            SizedBox(width: 4),
                                              
                            Expanded(
                              child: Text(
                                widget.location,
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  overflow: TextOverflow.ellipsis,
                              
                                  fontSize: 14,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                                SizedBox(height: 5),              
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            Text(
                              widget.rating.toString(),
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "|",
                              style: TextStyle(color: Colors.grey.shade300),
                            ),
                            SizedBox(width: 10),
                                              
                            Text(
                              widget.reviewcount.toString(),
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                            Expanded(
                              child: Text(
                                "Reviews",
                                style: TextStyle(color: Colors.grey.shade700),
                                 overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
