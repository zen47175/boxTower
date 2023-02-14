import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:towerbox/models/box_data.dart';
import 'package:towerbox/widgets/box_widget.dart';
import 'package:towerbox/widgets/circle_butt.dart';
import 'package:towerbox/widgets/diamond_box.dart';
import 'package:towerbox/widgets/space_box.dart';

import '../controllers/button_controller.dart';

class TowerRow extends StatelessWidget {
  TowerRow({
    Key? key,
  }) : super(key: key);
  int index = 0;
  List items = List.from(Box.boxData).obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ButtonController(),
        builder: (controller) {
          return Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        circleButt(
                          color: Colors.pink,
                          ontap: () {
                            controller.normalDialogTap(context, 'วีธีใช้งาน',
                                'กดปุ่มสีที่ตรงกันค้างไว้ 2 วินาทีเพื่อทำลาย Block');
                          },
                          onpressed: () {
                            controller.pinkButton(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 640,
                    color: Colors.grey[350],
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            reverse: true,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 35),
                                  child: AnimatedList(
                                    shrinkWrap: true,
                                    reverse: true,
                                    key: controller.key2,
                                    initialItemCount: Box.diamond.length,
                                    itemBuilder: (context, index, animation) {
                                      return Box.diamond.length == 1
                                          ? Column(
                                              children: <Widget>[
                                                DiamondBox(
                                                  animation: animation,
                                                  color:
                                                      Box.diamond[index].color,
                                                  item: Box,
                                                ),
                                              ],
                                            )
                                          : const spacebox();
                                    },
                                  ),
                                ),
                                const spacebox(),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 35),
                                  child: AnimatedList(
                                    shrinkWrap: true,
                                    reverse: true,
                                    key: controller.key,
                                    initialItemCount: items.length,
                                    itemBuilder: (context, index, animation) {
                                      return items.isNotEmpty
                                          ? Column(
                                              children: <Widget>[
                                                BoxColumn(
                                                  animation: animation,
                                                  color:
                                                      Box.boxData[index].color,
                                                  item: Box,
                                                ),
                                              ],
                                            )
                                          : const SizedBox();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        circleButt(
                          color: Colors.blue,
                          ontap: () {
                            controller.normalDialogTap(context, 'วีธีใช้งาน',
                                'กดปุ่มสีที่ตรงกันค้างไว้ 2 วินาทีเพื่อทำลาย Block');
                          },
                          onpressed: () {
                            controller.blueButton(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 60,
                top: 60,
                right: 100,
                left: 100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        'assets/images/cursor_left.svg',
                        height: 24,
                        width: 24,
                      ),
                      SvgPicture.asset(
                        'assets/images/cursor_right.svg',
                        height: 24,
                        width: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}

// Container(
//             color: Colors.grey[350],
//             child: Center(
//               child: Stack(fit: StackFit.expand, children: [
//                 Column(children: <Widget>[
//                   Expanded(
//                     flex: 2,
//                     child: SingleChildScrollView(
//                         reverse: true,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 35),
//                                 child: AnimatedList(
//                                   shrinkWrap: true,
//                                   reverse: true,
//                                   key: controller.key2,
//                                   initialItemCount: Box.diamond.length,
//                                   itemBuilder: (context, index, animation) {
//                                     return Box.diamond.length == 1
//                                         ? Column(
//                                             children: <Widget>[
//                                               DiamondBox(
//                                                 animation: animation,
//                                                 color: Box.diamond[index].color,
//                                                 item: Box,
//                                               ),
//                                             ],
//                                           )
//                                         : spacebox();
//                                   },
//                                 )),
//                             const spacebox(),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 20),
//                               child: AnimatedList(
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 shrinkWrap: true,
//                                 reverse: true,
//                                 key: controller.key,
//                                 initialItemCount: items.length,
//                                 itemBuilder: (context, index, animation) {
//                                   return items.isNotEmpty
//                                       ? Column(
//                                           children: <Widget>[
//                                             BoxColumn(
//                                               animation: animation,
//                                               color: Box.boxData[index].color,
//                                               item: Box,
//                                             ),
//                                           ],
//                                         )
//                                       : SizedBox();
//                                 },
//                               ),
//                             )
//                           ],
//                         )),
//                   ),
//                   // const SizedBox(
//                   //   height: 30,
//                   // ),
//                 ]),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       circleButt(
//                         color: Colors.pink,
//                         onpressed: () async {
//                           controller.pinkButton(context);
//                         },
//                         ontap: () {
//                           controller.normalDialogTap(context, 'วีธีใช้งาน',
//                               'กดปุ่มสีที่ตรงกันค้างไว้ 2 วินาทีเพื่อทำลาย Block');
//                         },
//                       ),
//                       circleButt(
//                         color: Colors.blue,
//                         onpressed: () {
//                           controller.blueButton(context);
//                         },
//                         ontap: () async {
//                           controller.normalDialogTap(context, 'วีธีใช้งาน',
//                               'กดปุ่มสีที่ตรงกันค้างไว้ 2 วินาทีเพื่อทำลาย Block');
//                         },
//                       )
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 40, horizontal: 200),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       SvgPicture.asset(
//                         'assets/images/cursor_left.svg',
//                         height: 24,
//                         width: 24,
//                       ),
//                       SvgPicture.asset(
//                         'assets/images/cursor_right.svg',
//                         height: 24,
//                         width: 24,
//                       ),
//                     ],
//                   ),
//                 ),
//               ]),
//             ),
//           )
