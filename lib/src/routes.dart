library routes;

abstract class Routes {
  static final String _base = 'https://grunt.api.dotapi.gg';

  static final String medals =
      '$_base/games/halo-infinite/metadata/multiplayer/medals';

  static final String teams =
      '$_base/games/halo-infinite/metadata/multiplayer/teams';

  static final String seasons =
      '$_base/games/halo-infinite/metadata/multiplayer/seasons';

  static final String maps =
      '$_base/games/halo-infinite/metadata/multiplayer/maps';

  static final String manufacturers =
      '$_base/games/halo-infinite/metadata/multiplayer/manufacturers';

  static final String careerRanks =
      '$_base/games/halo-infinite/metadata/multiplayer/career-ranks';

  static final String currencies =
      '$_base/games/halo-infinite/metadata/multiplayer/currencies';

  static final String weeklyReward =
      '$_base/games/halo-infinite/metadata/multiplayer/weekly-reward';

  static final String categories =
      '$_base/games/halo-infinite/metadata/multiplayer/modes/categories';

  static final String engineVariants =
      '$_base/games/halo-infinite/metadata/multiplayer/modes/engine-variants';

  static final String matchStats =
      '$_base/games/halo-infinite/stats/multiplayer/matches/{matchId}';

  /// type in {all, matchmaking, custom, local}
  static final String playerMatches =
      '$_base/games/halo-infinite/stats/multiplayer/players/{gamertag}/matches?&offset={offset}&type={type}&count={count}';

  ///filter in {all, ranked, social}
  static final playerGlobalStats =
      '$_base/games/halo-infinite/stats/multiplayer/players/{gamertag}/service-record/matchmade?filter={filter}';

  static final playerCsrs =
      '$_base/games/halo-infinite/stats/multiplayer/players/{gamertag}/csrs';

  static final playerAppearance =
      '$_base/games/halo-infinite/appearance/players/{gamertag}/spartan-id';

  static final playerCareerRank =
      '$_base/games/halo-infinite/stats/multiplayer/players/{gamertag}/career-rank';

  static final toolingToken = '$_base/tooling/api/users/me/benefits';
  static final toolingUserInfo = '$_base/tooling/api/users/me';
}
