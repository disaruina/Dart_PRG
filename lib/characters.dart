import 'dart:math';
import 'character.dart';

class Warrior extends Character {
  final int armor;

  Warrior({required String name, this.armor = 5}) : super(name: name, hp: 120);

  @override
  int attack() {
    return 15 + Random().nextInt(11); // 15..25
  }

  @override
  void takeDamage(int damage) {
    int reduced = (damage - armor).clamp(0, damage);
    super.takeDamage(reduced);
  }

  @override
  String toString() => '⚔️ Воин $name (Броня: $armor)';
}

class Mage extends Character {
  int mana;
  final int maxMana;

  Mage({required String name, this.mana = 60})
      : maxMana = mana,
        super(name: name, hp: 70);

  @override
  int attack() {
    if (mana >= 15) {
      mana -= 15;
      return 25 + Random().nextInt(16); // 25..40
    }
    return 5 + Random().nextInt(6); // 5..10 без маны
  }

  @override
  String toString() => '🔮 Маг $name (Мана: $mana/$maxMana)';
}

class Archer extends Character {
  final double critChance;

  Archer({required String name, this.critChance = 0.3})
      : super(name: name, hp: 95);

  @override
  int attack() {
    int baseDamage = 14 + Random().nextInt(9); // 14..22
    if (Random().nextDouble() < critChance) {
      print('💥 Критический выстрел!');
      return (baseDamage * 1.8).round();
    }
    return baseDamage;
  }

  @override
  String toString() => '🏹 Лучник $name (Крит: ${(critChance * 100).round()}%)';
}
