import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile(
      {this.title,
      this.checkBox,
      this.ontap,
      this.deleteIcon,
      this.deleteFunction});

  final Widget checkBox;
  final Widget title;
  final Function ontap;
  final Widget deleteIcon;
  final Function deleteFunction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      leading: checkBox,
      trailing: IconButton(
        icon: deleteIcon,
        onPressed: deleteFunction,
      ),
      onTap: ontap,
    );
  }
}

// return ListTile(
//   title: Text(
//     res.task == null ? '' : res.task,
//     style: TextStyle(
//       fontSize: 18.0,
//       fontWeight: FontWeight.w500,
//     ),
//   ),
//   leading: res.complete
//       ? Icon(
//           Icons.check_box,
//           color: Colors.lightBlueAccent,
//         )
//       : Icon(
//           Icons.check_box_outline_blank,
//           color: Colors.lightBlueAccent,
//         ),
//   onTap: () {
//     res.complete = !res.complete;
//     res.save();
//   },
//   trailing: IconButton(
//     icon: Icon(Icons.delete),
//     onPressed: () {
//       res.delete();
//       setState(() {
//         count = box.length;
//       });
//     },
//   ),
// );
