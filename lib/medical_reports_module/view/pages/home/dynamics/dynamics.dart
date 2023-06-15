import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medtrack/medical_reports_module/view/pages/home/dynamics/widgets/dynamics_item.dart';
import 'package:medtrack/routes/routes_constants.dart';

class Dynamics extends StatelessWidget {
  Dynamics({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children:  [
          DynamicsItems(
            onTap: (){
              Get.toNamed(RouteNames.bodyVitals);
            },
            icon:  const Icon(Icons.bloodtype, color: Colors.red,
              size: 50,
            ),
            label: 'Body Vitals',
          ),
            const SizedBox(height: 20,),
            DynamicsItems(
              onTap: (){
                Get.toNamed(RouteNames.weightInput);
              },
              icon:  const Icon(Icons.balance, color: Colors.deepOrangeAccent,
                size: 50,
              ),
              label: 'Weight',
            ),
          ],
        ),
      ),
    );
  }
}


