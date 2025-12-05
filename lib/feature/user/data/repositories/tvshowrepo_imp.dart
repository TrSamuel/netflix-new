import 'package:dartz/dartz.dart';
import 'package:netflixclonenew/core/errors/main_failure.dart';
import 'package:netflixclonenew/core/utils/tvshow_category.dart';
import 'package:netflixclonenew/feature/user/data/source/remote/tvshow_api_service.dart';
import 'package:netflixclonenew/feature/user/domain/entities/tv_show.dart';
import 'package:netflixclonenew/feature/user/domain/repositories/tvshow_repo.dart';

class TvshowrepoImp extends TvshowRepo {
  final TvshowService tvshowService;

  TvshowrepoImp({required this.tvshowService});

  @override
  Future<Either<MainFailure, List<Tvshow>>> geTvShows(
    TvshowCategory category,
  ) async => await tvshowService.getTvShows(category);
}
