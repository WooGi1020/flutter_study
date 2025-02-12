import 'package:flutter/material.dart';
import 'package:flutter_study/screens/home_screen.dart';
// import 'package:flutter_study/screens/home_screen_for_study.dart';
// import 'package:flutter_study/widgets/button.dart';
// import 'package:flutter_study/widgets/card.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // StatelessWidget 부모 클래스에 key 전달
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         theme: ThemeData(
//           scaffoldBackgroundColor: Color(0xFFE7626C),
//           textTheme: TextTheme(
//               headlineLarge: TextStyle(
//             color: Color(0xFF232B55),
//           )),
//           cardColor: Color(0xFFF4EDDB),
//         ),
//         home: HomeScreen());
//   }
// }

// context를 이용한 부모 요소 접근
// class MyLageTitle extends StatefulWidget {
//   const MyLageTitle({
//     super.key,
//   });

//   @override
//   State<MyLageTitle> createState() => _MyLageTitleState();
// }

// class _MyLageTitleState extends State<MyLageTitle> {
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       'Large Title',
//       style: TextStyle(
//         fontSize: 32,
//         color: Theme.of(context).textTheme.titleLarge?.color,
//       ),
//     );
//   }
// }

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           backgroundColor: Color(0xFF181818),
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 40),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 70,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Text(
//                             '안녕, 우기!',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 34,
//                               fontWeight: FontWeight.w800,
//                             ),
//                           ),
//                           Text(
//                             "돌아온 걸 환영해!",
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Colors.white.withValues(alpha: 0.8),
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 80,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         '전재산',
//                         style: TextStyle(
//                           color: Colors.white.withValues(alpha: 0.8),
//                           fontSize: 24,
//                         ),
//                       ),
//                       Text(
//                         '3,000원',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 44,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Button(
//                               text: 'Transfer',
//                               bgColor: Colors.amber,
//                               textColor: Colors.black),
//                           Button(
//                               text: 'Request',
//                               bgColor: Color(0xFF1F2133),
//                               textColor: Colors.white)
//                         ],
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 100,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         '지갑',
//                         style: TextStyle(
//                           fontSize: 36,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       Text(
//                         '전체 보기',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.white.withValues(alpha: 0.8),
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   CurrencyCard(
//                       name: '엔',
//                       code: 'Yen',
//                       amount: '1 351',
//                       icon: Icons.currency_yen),
//                   CurrencyCard(
//                       name: '비트코인',
//                       code: 'Bitcoin',
//                       amount: '6 134',
//                       isInverted: true,
//                       order: 2,
//                       icon: Icons.currency_bitcoin),
//                   CurrencyCard(
//                       name: '파운드',
//                       code: 'Pound',
//                       amount: '5 121',
//                       order: 4,
//                       icon: Icons.currency_pound),
//                 ],
//               ),
//             ),
//           )),
//     );
//   }
// }
