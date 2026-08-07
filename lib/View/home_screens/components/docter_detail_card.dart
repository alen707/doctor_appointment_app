import 'package:docter_appointment_app/Modal/docter_details_modal.dart';
import 'package:flutter/material.dart';

class DocterDtetailCard extends StatelessWidget {
  const DocterDtetailCard({
    super.key,
    required this.docter,
  });

  final DocterDetailsModal? docter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
             BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 5),
            ),
        ],
      ),
    
      child: Padding(
                 padding: const EdgeInsets.only(
            left: 12,
            right: 12,
            top: 10,
            bottom: 10,
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                 height: 125,
                    width: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
    
                  image: DecorationImage(
                        image: AssetImage(
                          "assets/images/skip_screen_image_c.png",
                        ),
                        fit: BoxFit.fill,
                      ),
                  ),
                ),
    
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
    
                      children: [
                        Text(
                          docter?.data.name ?? "error",
                          overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  decoration: TextDecoration.none,
                                ),
                        ),
                        SizedBox(height: 1),
                        Divider(color: Colors.grey.shade300),
    
                        SizedBox(height: 1),
                        Text(
                          docter?.data.specialization ?? "",
                         style: TextStyle(
                                  color: Colors.grey.shade700,

                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                          ImageIcon(AssetImage("assets/icon/location.png"),color: Colors.grey.shade700,size: 16,),
                          SizedBox(width: 5,),
                            Expanded(
                              child: Text(
                                docter?.data.location ?? "",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey.shade700,
    
                                  fontSize: 15,
                                  decoration: TextDecoration.none,
                                ),
                              ),
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
    );
  }
}
