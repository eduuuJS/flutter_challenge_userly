enum ActionType {
  create,
  update,
}

extension ActionTypeExtension on ActionType {
  String get labelTitle {
    switch (this) {
      case ActionType.create:
        return 'Nuevo';
      case ActionType.update:
        return 'Editar';
    }
  }
}
