import 'package:flutter/material.dart';
import 'package:flutter_study/models/webtoon_model.dart';
import 'package:flutter_study/services/api_services.dart';
import 'package:flutter_study/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiServices.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          '오늘의 웹툰',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      // 원래 state를 통해 비동기로 실행한 api를 받아와야 하지만,
      // FutureBuilder를 통해 state 없이 로직을 실행하고 렌더링 가능능
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          // 데이터를 받아올 시
          if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: makeList(snapshot),
                )
              ],
            );
            // 로딩 시
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  // api로 받아온 웹툰 리스트를 배열형태로 매핑하여 렌더링해주는 View
  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      // 스크롤 방향 결정
      scrollDirection: Axis.horizontal,
      // 배열 길이 지정
      itemCount: snapshot.data!.length,
      // 배열 요소 사용
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return WebtoonWidget(
            title: webtoon.title, thumb: webtoon.thumb, id: webtoon.id);
      },
      // ListView 내부에서 gap을 주는 메서드
      separatorBuilder: (context, index) {
        return SizedBox(
          width: 40,
        );
      },
    );
  }
}
