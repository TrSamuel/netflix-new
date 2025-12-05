import 'package:dartz/dartz.dart';
import 'package:netflixclonenew/core/errors/main_failure.dart';
import 'package:netflixclonenew/core/utils/tvshow_category.dart';
import 'package:netflixclonenew/feature/user/domain/entities/tv_show.dart';
import 'package:netflixclonenew/feature/user/domain/repositories/tvshow_repo.dart';

class GetTvshows {
  final TvshowRepo tvshowRepo;

  GetTvshows({required this.tvshowRepo});

  Future<Either<MainFailure,List<Tvshow>>> call(TvshowCategory category) =>
      tvshowRepo.geTvShows(category);
}
