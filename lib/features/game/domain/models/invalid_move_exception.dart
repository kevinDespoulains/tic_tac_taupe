abstract class InvalidMoveException implements Exception {
  const InvalidMoveException();

  String? get message;
}

/// Indicates that the user has provided an invalid input.
class BadUserInputException implements InvalidMoveException {
  const BadUserInputException({
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  String get message => errorMessage;
}

/// Indicates that there are no more legal moves available.
class NoMoreLegalMoveException implements InvalidMoveException {
  const NoMoreLegalMoveException();

  @override
  String? get message => null;
}

/// Indicates that it is not the player's turn to play.
class WrongPlayerTurnException implements InvalidMoveException {
  const WrongPlayerTurnException();

  @override
  String get message => "Ce n'est pas à ton tour de jouer !";
}
