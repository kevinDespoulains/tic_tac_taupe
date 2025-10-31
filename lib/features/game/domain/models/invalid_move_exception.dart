abstract class InvalidMoveException implements Exception {
  const InvalidMoveException();
}

/// Indicates that the user has provided an invalid input.
class BadUserInputException implements InvalidMoveException {
  const BadUserInputException();
}

/// Indicates that there are no more legal moves available.
class NoMoreLegalMoveException implements InvalidMoveException {
  const NoMoreLegalMoveException();
}

/// Indicates that it is not the player's turn to play.
class WrongPlayerTurnException implements InvalidMoveException {
  const WrongPlayerTurnException();
}
