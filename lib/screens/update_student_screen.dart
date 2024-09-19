

import 'package:flutter/material.dart';

import '../widgets/custom_tf.dart';

class UpdateStudentScreen extends StatefulWidget {
  const UpdateStudentScreen({super.key});

  @override
  State<UpdateStudentScreen> createState() => _UpdateStudentScreenState();
}

class _UpdateStudentScreenState extends State<UpdateStudentScreen> {

  var nameC = TextEditingController();
  var courseC = TextEditingController();
  var mobileC = TextEditingController();
  var totalFeeC = TextEditingController();
  var feePaid = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Update Student'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CustomTF(controller: nameC, hintText: 'Name',),

            const SizedBox(height: 16,),
            CustomTF(controller: courseC, hintText: 'Course',),
            const SizedBox(height: 16,),

            CustomTF(controller: mobileC, hintText: 'Mobile',),

            const SizedBox(height: 16,),
            CustomTF(controller: totalFeeC, hintText: 'Total Fee',),
            const SizedBox(height: 16,),

            CustomTF(controller: feePaid, hintText: 'Fee Paid',),

            const SizedBox(height: 16,),
            ElevatedButton(onPressed: (){}, child: const Text('Update')),
            const SizedBox(height: 16,),


          ],
        ),
      ),

    );
  }
}
