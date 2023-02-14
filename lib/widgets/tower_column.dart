import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:towerbox/models/box_data.dart';
import 'package:towerbox/widgets/box_widget.dart';
import 'package:towerbox/widgets/circle_butt.dart';
import 'package:towerbox/widgets/diamond_box.dart';
import 'package:towerbox/widgets/space_box.dart';

import '../controllers/button_controller.dart';

class TowerColumn extends StatelessWidget {
  TowerColumn({
    Key? key,
  }) : super(key: key);
  int index = 0;
  List items = List.from(Box.boxData).obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ButtonController(),
        builder: (controller) {
          return Container(
            color: Colors.grey[350],
            child: Center(
              child: Stack(fit: StackFit.expand, children: [
                Column(children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                        reverse: true,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                                color: Box.diamond[index].color,
                                                item: Box,
                                              ),
                                            ],
                                          )
                                        : const spacebox();
                                  },
                                )),
                            const spacebox(),
                            AnimatedList(
                              physics: const NeverScrollableScrollPhysics(),
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
                                            color: Box.boxData[index].color,
                                            item: Box,
                                          ),
                                        ],
                                      )
                                    : const SizedBox();
                              },
                            ),  const SizedBox(
                              height: 24,
                            ),
                          ],
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.normalDialogTap(context, 'วีธีใช้งาน',
                          'กดปุ่มสีที่ตรงกันค้างไว้ 2 วินาทีเพื่อทำลาย Block');
                    },
                    child: Container(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      height: 104,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          circleButt(
                            color: Colors.pink,
                            onpressed: () async {
                              controller.pinkButton(context);
                            },
                            ontap: () {
                              controller.normalDialogTap(context, 'วีธีใช้งาน',
                                  'กดปุ่มสีที่ตรงกันค้างไว้ 2 วินาทีเพื่อทำลาย Block');
                            },
                          ),
                          circleButt(
                            color: Colors.blue,
                            onpressed: () {
                              controller.blueButton(context);
                            },
                            ontap: () async {
                              controller.normalDialogTap(context, 'วีธีใช้งาน',
                                  'กดปุ่มสีที่ตรงกันค้างไว้ 2 วินาทีเพื่อทำลาย Block');
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ]),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 125, horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              ]),
            ),
          );
        });
  }
}
