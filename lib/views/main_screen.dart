import 'package:api_demo_http/providers/jobs_provider.dart';
import 'package:api_demo_http/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<JobsProvider>(context, listen: false).getJobsFromService();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Consumer<JobsProvider>(
        builder: (context, jobsProvider, child) {
          if (jobsProvider.jobsStates == DATASTATE.LOADING) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (jobsProvider.jobsErrorMessage.isNotEmpty) {
              return Text(jobsProvider.jobsErrorMessage);
            } else {
              return ListView.builder(
                itemCount: jobsProvider.jobsList.length,
                itemBuilder: (context, index) {
                  return Card(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(jobsProvider.jobsList[index].name),
                  ));
                },
              );
            }
          }
        },
      ),
    ));
  }
}
