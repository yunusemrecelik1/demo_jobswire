

import 'package:demo_jobswire/models/jobs.dart';

class JobsViewModel  {
  Jobs? _jobs;

  setPost(Jobs jobs) {
    _jobs = jobs;
  }

  Jobs? get jobs => _jobs;
}