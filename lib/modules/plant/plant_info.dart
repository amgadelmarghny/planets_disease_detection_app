// import 'package:flutter/material.dart';

// class CustomPlantInfo extends StatelessWidget {
//   const CustomPlantInfo({
//     super.key,
//     required this.text,
//   });
//   final String? text;
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         width: double.infinity,
//         clipBehavior: Clip.antiAlias,
//         padding: const EdgeInsets.all(1),
//         margin: const EdgeInsets.symmetric(horizontal: 2),
//         decoration: BoxDecoration(
//             color: Colors.black87,
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.grey.withOpacity(1),
//                   blurRadius: 3,
//                   spreadRadius: 2,
//                   offset: const Offset(0, 1))
//             ],
//             borderRadius: BorderRadius.circular(15)),
//         child: Container(
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             color: Theme.of(context).scaffoldBackgroundColor,
//           ),
//           child: ListView(children: [
//             if (text != null)
//               Text(
//                 text!,
//                 style: Theme.of(context).textTheme.bodySmall,
//               ),
//           ]),
//         ),
//       ),
//     );
//   }
// }