import 'package:demo_jobswire/models/jobs.dart';
import 'package:flutter/material.dart';

class BottomSheetScreen extends StatelessWidget {
  BottomSheetScreen({required this.jobs});

  Jobs jobs = Jobs();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(32), topLeft: Radius.circular(32)),
          boxShadow: [BoxShadow()]),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                jobs.position.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                jobs.description.toString(),
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
