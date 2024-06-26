import '../../exports.dart';
import 'package:flutter/material.dart';

class ClockWidget extends StatelessWidget{
  @override
  const ClockWidget({
    required this.viewModel,
    super.key
});

  final ClockScreenModel viewModel;

  @override
  Widget build(BuildContext context){

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.5,
      height: height * 0.15,
      margin: EdgeInsets.only(
        top: height * 0.1,
        bottom: height * 0.7,
        left: width * 0.25,
        right: width * 0.25
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("assets/objects/clock.png"),
          fit: width > 800 ? BoxFit.fitHeight : BoxFit.fill
        )
      ),
      child: Stack(
        children: [
          // Hour and Minutes row
          Container(
            width: width * 0.35,
            height: width > 800 ? height * 0.07 : height * 0.05,
            margin: EdgeInsets.only(top: height * 0.08, bottom: height * 0.01, left: width > 800 ? width * 0.218 :  width * 0.13, right: width * 0.05 ),
            child: Text("${viewModel.additionalZeroHour}${viewModel.currentHour}:${viewModel.additionalZeroMinute}${viewModel.currentMinutes}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:  width > 800 ? 30 : 35),),
          ),

          // Day and Month
          Container(
            width: width * 0.2,
            height: height * 0.05,
            margin: EdgeInsets.only(top: width > 800 ? height * 0.015 : height * 0.017, bottom: height * 0.01, left: width > 800 ? width * 0.195 : width * 0.059, right: width * 0.15 ),
            child: viewModel.currentMonth < 10 ?
              Text("${viewModel.additionalZeroDay}${viewModel.currentDay}  ${viewModel.currentMonth}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:  width > 800 ? 25 : 30),) :
              Text("${viewModel.additionalZeroDay}${viewModel.currentDay}  ${viewModel.currentMonth}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:  width > 800 ? 20 : 25),),
          ),

          // Week Day
          Container(
            width: width * 0.1,
            height: width > 800 ? height * 0.05 : height * 0.03,
            margin: EdgeInsets.only(top: height * 0.03, bottom: height * 0.07, left: width > 800 ? width * 0.275 : width * 0.335, right: width * 0.02),
            child: Text(viewModel.currentWeekDay, style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
          ),

        ],
      ),
    );
  }

}