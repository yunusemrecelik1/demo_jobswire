import 'package:demo_jobswire/models/jobs.dart';
import 'package:flutter/material.dart';


class JobsNotifier with ChangeNotifier{

  List<Jobs> _jobList = [];

  setJobList(List<Jobs> jobList) {
    _jobList = [];
    _jobList = jobList;
    notifyListeners();
  }
  List<Jobs> getJobList() {
    return _jobList;
  }
}