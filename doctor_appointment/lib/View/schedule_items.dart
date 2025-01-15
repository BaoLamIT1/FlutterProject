import 'package:doctor_appointment/Model/doctor.dart';
import 'package:doctor_appointment/Model/schedule.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class ScheduleItems extends StatelessWidget {
  final Schedule schedule;
  const ScheduleItems({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: Offset.zero,
            color: Colors.grey.withOpacity(0.3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Dr. ${schedule.doctor.name}", style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height: 5),
                  Text(schedule.doctor.specialist),
                ],
              ),
              CircleAvatar(radius: 25,
                backgroundColor: Color(schedule.doctor.color),
                backgroundImage: NetworkImage(schedule.doctor.image),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Divider(),
          const SizedBox(height: 10),
          Row(
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_month_outlined, color: Colors.grey,),
                  Text(DateFormat("d/MM/y").format(schedule.time),
                  ),
                ],
              ),
              SizedBox(width: 15),
              Row(
                children: [
                  Icon(Icons.alarm, color: Colors.grey,),
                  Text(DateFormat("jm").format(schedule.time)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
