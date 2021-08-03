import 'package:demo_jobswire/notifiers/jobs_notifier.dart';
import 'package:demo_jobswire/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_jobswire/screens/bottom_sheet.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    JobsNotifier jobsNotifier =
        Provider.of<JobsNotifier>(context, listen: false);
    ApiService.getJobs(jobsNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    JobsNotifier jobsNotifier = Provider.of<JobsNotifier>(context);

    return SafeArea(
      child: Scaffold(
        body: jobsNotifier.getJobList().length != 0
            ? ListView.builder(
                itemCount: jobsNotifier.getJobList().length,
                itemBuilder: (context, index) {
                  return index == 0
                      ? Container()
                      : InkWell(
                    onTap: (){
                      showModalBottomSheet<dynamic>(
                          isScrollControlled: true,
                          backgroundColor: Colors.green.withOpacity(0),
                          context: context,
                          builder: (BuildContext context) {
                            return BottomSheetScreen(jobs: jobsNotifier.getJobList()[index],);
                          });
                    },
                        child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              height: 75,
                              child: Row(
                                children: [
                                  Container(
                                    height: 75,
                                    width: 75,
                                    color: Colors.transparent,
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Image.network(jobsNotifier
                                          .getJobList()[index]
                                          .logo
                                          .toString()),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          jobsNotifier
                                              .getJobList()[index]
                                              .position
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Text(
                                          jobsNotifier
                                              .getJobList()[index]
                                              .location
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 13
                                          ),

                                        ),
                                        jobsNotifier
                                                    .getJobList()[index]
                                                    .tags
                                                    .length !=
                                                0
                                            ? Container(
                                                width: 250,
                                                height: 35,
                                                child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    shrinkWrap: true,
                                                    itemCount: jobsNotifier
                                                        .getJobList()[index]
                                                        .tags
                                                        .length,
                                                    itemBuilder: (context, index2) {
                                                      return Padding(
                                                        padding: const EdgeInsets.only(right: 8.0),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            color: Colors.white,
                                                              border: Border.all(color: Colors.blueAccent),
                                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                                          ),
                                                          child: Center(
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: Text(
                                                                jobsNotifier
                                                                    .getJobList()[index]
                                                                    .tags[index2]
                                                                    .toString(),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                              )
                                            : Container()
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      );
                },
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
