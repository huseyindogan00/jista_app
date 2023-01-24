import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';

FloatingActionBubble categoriesFAB(Animation animation, AnimationController animationController) {
  const Color iconColor = Colors.black;
  final Color bubbleColor = Colors.amber.shade400;

  return FloatingActionBubble(
    iconColor: Colors.white,
    backGroundColor: Colors.lightBlue.shade900,
    iconData: Icons.info_outline,
    animation: animation,
    items: <Bubble>[
      Bubble(
        icon: Icons.square_foot_outlined,
        iconColor: iconColor,
        title: 'Ölçü Bilgilerim',
        titleStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        bubbleColor: bubbleColor,
        onPress: () {},
      ),
      Bubble(
        icon: Icons.local_shipping_outlined,
        iconColor: iconColor,
        title: 'Kargo Adreslerim',
        titleStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        bubbleColor: bubbleColor,
        onPress: () {},
      ),
      Bubble(
        icon: Icons.supervised_user_circle,
        iconColor: iconColor,
        title: 'Mutemet İşlemlerim',
        titleStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        bubbleColor: bubbleColor,
        onPress: () {},
      ),
    ],
    onPress: () {
      animationController.isCompleted ? animationController.reverse() : animationController.forward();
    },
  );
}
