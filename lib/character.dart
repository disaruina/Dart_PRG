import 'dart:math';

abstract class Character {
  final String name;
  int hp;
  final int maxHp;
  final Random _random = Random();

  Character({
    required this.name,
    required this.hp,
  }) : maxHp = hp;

  int attack();

  void takeDamage(int damage) {
    hp = (hp - damage).clamp(0, maxHp);
  }

  bool get isAlive => hp > 0;

  String get hpBar {
    const int totalBars = 10;
    int filled = ((hp / maxHp) * totalBars)
        .round()
        .clamp(0, totalBars);
    int empty = totalBars - filled;
    return '${'█' * filled}${'░' * empty} ($hp/$maxHp HP)';
  }

  void describe() {
    print('$this — $hpBar');
  }

  @override
  String toString();
}
