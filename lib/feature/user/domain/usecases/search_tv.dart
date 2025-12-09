import 'package:dartz/dartz.dart';
import 'package:netflixclonenew/core/errors/main_failure.dart';
import 'package:netflixclonenew/feature/user/domain/entities/tv/tv_show.dart';
import 'package:netflixclonenew/feature/user/domain/repositories/tvshow_repo.dart';

class SearchTv {
  final TvshowRepo tvshowRepo;

  SearchTv({required this.tvshowRepo});

  Future<Either<MainFailure, List<Tvshow>>> call(String query) => tvshowRepo.searchTv(query);
}
