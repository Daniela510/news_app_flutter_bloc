import 'package:clean_architecture/core/constants/strings.dart';
import 'package:clean_architecture/core/failures_successes/exceptions.dart';
import 'package:clean_architecture/core/services/api_services.dart';
import 'package:clean_architecture/core/services_locator.dart';
import 'package:clean_architecture/features/show_news/data/models/news_info_model.dart';
import 'package:clean_architecture/features/show_news/domain/entities/news_info.dart';

abstract class FetchFromRemoteDS {
  Future<List<NewsInfoModel>> fetchNews(String? searchText);
}

class FetchFromRemoteDSImpl implements FetchFromRemoteDS {
  final ApiService apiService = serviceLocator<ApiService>();

  // the api service is now injected with the get it package so this is obsolete
  // const FetchFromRemoteDSImpl({required this.apiService});

  @override
  Future<List<NewsInfoModel>> fetchNews(String? searchText) async {
    try {
      Map<String, dynamic> data = await apiService.getData(
          searchText != null ? Strings.apiEverything : Strings.apiTop, {
        'apiKey': Strings.API_key,
        if (searchText == null) 'country': 'us',
        if (searchText == null) 'q': searchText,
      });

      List list = data['articles'];
      List<Map<String, dynamic>> mapList = [];
      //this converts the JSON data into Flutter List
      for (int i = 0; i < list.length; i++) {
        Map<String, dynamic> mapPair = list[i] as Map<String, dynamic>;
        mapList.add(mapPair);
      }

      List<NewsInfoModel> news = [];
      //This converts Flutter list into a class based on the model
      for (int i = 0; i < mapList.length; i++) {
        NewsInfoModel newsInfoModel = NewsInfoModel.fromMap(mapList[i]);
        news.add(newsInfoModel);
      }

      return news;
    } catch (e) {
      throw FetchException(message: 'Failed to get data');
    }
  }
}
