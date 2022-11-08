import 'package:api_demo_http/services/jobs_service.dart';
import 'package:api_demo_http/utils/enums.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class JobsProvider extends ChangeNotifier {
  var jobsService = JobsService();

  var jobsStates = DATASTATE.IDLE;
  var jobsList =<User> [];
  var jobsErrorMessage = '';

  setDataState(DATASTATE datastate) {
    jobsStates = datastate;
    notifyListeners();
  }

  setError(String error) {
    jobsErrorMessage = error;
    notifyListeners();
  }

  setJobList(List<User> userList) {
    jobsList = userList;
    notifyListeners();
  }

  getJobsFromService() async {
    setDataState(DATASTATE.LOADING);
    try {
      var list = await jobsService.fetchUsers();
      setJobList(list);
      setDataState(DATASTATE.LOADED);
    } catch (e) {
      setDataState(DATASTATE.LOADED);
      setError(e.toString());
    }
  }
}
