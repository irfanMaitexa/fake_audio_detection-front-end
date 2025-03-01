import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reco/main.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class AudioUploadScreen extends StatefulWidget {
  AudioUploadScreen(
      {super.key,
      required this.gender,
      required this.outPut,
      required this.prediction});

  final String gender;

  final String outPut;
  final String prediction;

  @override
  State<AudioUploadScreen> createState() => _AudioUploadScreenState();
}

class _AudioUploadScreenState extends State<AudioUploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090b12),
      appBar: AppBar(
        title: Text(
          'Result',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularSeekBar(
              interactive: false,
              width: double.infinity,
              height: 250,
              progress: valueNotifier.value,
              barWidth: 8,
              startAngle: 45,
              sweepAngle: 270,
              strokeCap: StrokeCap.butt,
              progressGradientColors: const [
                Colors.red,
                Colors.orange,
                Colors.yellow,
                Colors.green,
                Colors.blue,
                Colors.indigo,
                Colors.purple
              ],
              innerThumbRadius: 5,
              innerThumbStrokeWidth: 3,
              innerThumbColor: Colors.white,
              outerThumbRadius: 5,
              outerThumbStrokeWidth: 10,
              outerThumbColor: Colors.blueAccent,
              dashWidth: 1,
              dashGap: 2,
              animation: true,
              valueNotifier: valueNotifier,
              child: Center(
                child: Text('${widget.outPut}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w700)),
                //  ValueListenableBuilder(
                //     valueListenable: valueNotifier,
                //     builder: (_, double value, __) => Column(
                //           mainAxisSize: MainAxisSize.min,
                //           children: [
                //             Text('${value.round()}%',
                //                 style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w700)),
                //             Text(widget.prediction,
                //                 style: TextStyle(color: Colors.white,fontSize: 20)),
                //           ],
                //         )),
              ),
            ),

            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 50,
                ),
                title: Text(
                  'The voice is  ${widget.outPut}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            SizedBox(height: 20),

            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 50,
                ),
                title: Text(
                  'Gender  ${widget.gender.toUpperCase()}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            // Expanded(child: Column(
            //   children: [

            //     Expanded(
            //       child: Container(
            //         alignment: Alignment.center,
            //         decoration: BoxDecoration(
            //           border: Border.all(color: Colors.white),
            //           borderRadius: BorderRadius.circular(15)
            //         ),
            //         child: ListTile(
            //           leading: Icon(Icons.person,color: Colors.white,size: 50,),
            //           title: Text(widget.gender,style: TextStyle(color: Colors.white),),
            //         ),
            //       ),
            //     ),
            //     SizedBox(height: 10,),
            //     Expanded(
            //       child: Container(
            //         alignment: Alignment.center,
            //         decoration: BoxDecoration(
            //           border: Border.all(color: Colors.white),
            //           borderRadius: BorderRadius.circular(15)
            //         ),
            //         child: ListTile(
            //           leading: Icon(Icons.message,color: Colors.white,size: 50,),
            //           title: Text(widget.outPut,style: TextStyle(color: Colors.white),),
            //         ),
            //       ),
            //     ),
            //     SizedBox(height: 10,)
            //   ],
            // ))
            SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              onPressed: _makeEmergencyCall,
              icon: const Icon(Icons.phone, color: Colors.white),
              label: const Text(
                'NCRP HELPLINE',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 203, 0, 0),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.home, color: Colors.white),
              label: const Text(
                'HOME',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _makeEmergencyCall() async {
    const emergencyNumber = 'tel:1930'; // Replace with your emergency number
    if (await canLaunch(emergencyNumber)) {
      await launch(emergencyNumber);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Unable to make a call. Please check your device settings.')),
      );
    }
  }
}
