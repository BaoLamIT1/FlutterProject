import 'package:doctor_appointment/Model/doctor.dart';
import 'package:flutter/material.dart';

class ListOfDoctors extends StatelessWidget {
  final Doctor doctor;
  const ListOfDoctors({super.key, required this.doctor,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width/2.24,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Color(doctor.color),
            backgroundImage: NetworkImage(doctor.image),
          ),
          const SizedBox(height: 5),
          Text(doctor.name,
            style: TextStyle(
                letterSpacing: 0,
                color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(doctor.specialist,
            style: TextStyle(
              letterSpacing: 0,
              color: Colors.black12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellowAccent ,
                  size: 20,
                ),
                SizedBox(width: 5),
                Text(
                    rate(doctor).toStringAsFixed(1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
