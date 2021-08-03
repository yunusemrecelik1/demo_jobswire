import 'dart:convert';
import 'package:demo_jobswire/models/jobs.dart';
import 'package:demo_jobswire/notifiers/jobs_notifier.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String API_ENDPOINT =
      "https://remoteok.io/api";

  static getJobs(JobsNotifier jobsNotifier) async {
    List<Jobs> jobList = [];
    http.get(Uri.parse(API_ENDPOINT)).then((response) {
      List jobs = jsonDecode(response.body);
      jobs.forEach((data) {
        jobList.add(Jobs.fromMap(data));
      });
      jobsNotifier.setJobList(jobList);
    });
  }
}