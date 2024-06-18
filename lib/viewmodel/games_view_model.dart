class GameListModel {
  final String gameName;
  final String gameImage;

  GameListModel({
    required this.gameName,
    required this.gameImage
  });

  static List<GameListModel> getGameList() {
    List<GameListModel> gameList = [];

    gameList.add(
        GameListModel(
          gameName: 'Cybermage',
          gameImage: 'assets/cybermage.png'
        )
    );

    gameList.add(
        GameListModel(
            gameName: 'Flutter Cave',
            gameImage: 'assets/flutter-cave.png'
        )
    );

    gameList.add(
        GameListModel(
          gameName: 'Frostfire Fury',
            gameImage: 'assets/frostfire-fury.png'

        )
    );

    gameList.add(
        GameListModel(
          gameName: 'Late for Meeting',
            gameImage: 'assets/late-for-meeting.png'
        )
    );

    gameList.add(
        GameListModel(
          gameName: 'Chrono-loop Escape',
            gameImage: 'assets/chrono-loop-escape.png'
        )
    );

    return gameList;
  }
}