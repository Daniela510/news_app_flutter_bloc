import 'package:dartz/dartz.dart';

import '../../../../core/failures_successes/failures.dart';
import '../entities/news_info.dart';

abstract class FetchRepo {
  Future<Either<Failure, List<NewsInfo>>> fetchNews(String? searchText);
}
