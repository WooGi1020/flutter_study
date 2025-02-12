import 'dart:convert';
import 'dart:math';

import 'package:flutter_study/models/webtoon_detail_model.dart';
import 'package:flutter_study/models/webtoon_episode_model.dart';
import 'package:flutter_study/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  // 서버의 baseUrl과 path 정의의
  static final String today = "today";
  static final String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';

  // js와 비슷한 async/await 형태의 함수 지정 및 dart가 제공하는 api 사용용
  static Future<List<WebtoonModel>> getTodaysToons() async {
    // 타입 정의 (제네릭을 활용한 모델링)
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    // 요청 성공 시 json 디코딩 및 for 문을 통해 미리 정의한 변수에 값 할당
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final toon = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(toon);
      }

      return webtoonInstances;
    } else {
      throw Error();
    }
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodeById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
