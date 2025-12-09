import 'package:netflixclonenew/core/errors/main_failure.dart';
import 'package:netflixclonenew/core/utils/tvshow_category.dart';
import 'package:dartz/dartz.dart';
import 'package:netflixclonenew/feature/user/domain/entities/tv/tv_show.dart';
import 'package:netflixclonenew/feature/user/domain/entities/tv/tvshow_details.dart';

abstract class TvshowRepo {
  Future<Either<MainFailure, List<Tvshow>>> geTvShows(TvshowCategory category);
  Future<Either<MainFailure, TvshowDetails>> getTvShowDetails(int id);
    Future<Either<MainFailure, List<Tvshow>>> searchTv(String query);
}
