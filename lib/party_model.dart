
import 'package:flutter/foundation.dart';
import 'adventurer.dart';

class PartyModel extends ChangeNotifier {
  final List<Adventurer> _party = [];

  List<Adventurer> get party =>
      List.unmodifiable(_party);

  int get partyCount => _party.length;

  int get totalCost {
    return _party.fold(
      0,
          (sum, adventurer) => sum + adventurer.goldCost,
    );
  }

  void addAdventurer(Adventurer adventurer) {
    _party.add(adventurer);
    notifyListeners();
  }

  void removeAdventurer(Adventurer adventurer) {
    if (_party.remove(adventurer)) {
      notifyListeners();
    }
  }
}
