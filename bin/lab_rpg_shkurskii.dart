import 'dart:io';
import 'package:lab_rpg_shkurskii/character.dart';
import 'package:lab_rpg_shkurskii/characters.dart';
import 'package:lab_rpg_shkurskii/battle.dart';

void showClasses() {
  print('Доступные классы:');
  print('1. ⚔️ Воин (120 HP, броня снижает входящий урон)');
  print('2. 🔮 Маг (70 HP, огромный урон пока есть мана)');
  print('3. 🏹 Лучник (95 HP, 30% шанс критического удара)');
}

Character selectCharacter(String prompt) {
  print('\n$prompt');
  stdout.write('Введите имя персонажа: ');
  String? inputName = stdin.readLineSync()?.trim();
  String name = (inputName == null || inputName.isEmpty) ? 'Безымянный' : inputName;

  showClasses();
  while (true) {
    stdout.write('Выберите класс (1-3): ');
    String? choice = stdin.readLineSync()?.trim();
    switch (choice) {
      case '1':
        return Warrior(name: name);
      case '2':
        return Mage(name: name);
      case '3':
        return Archer(name: name);
      default:
        print('Неверный ввод. Введите 1, 2 или 3.');
    }
  }
}

void main() {
  print('=== ДОБРО ПОЖАЛОВАТЬ В RPG-БИТВУ ===');

  while (true) {
    Character player = selectCharacter('Создание вашего персонажа:');
    Character enemy = selectCharacter('Создание противника:');

    battle(player, enemy);

    stdout.write('\nХотите сыграть ещё раз? (да/нет): ');
    String? answer = stdin.readLineSync()?.trim().toLowerCase();
    if (answer != 'да') {
      print('Спасибо за игру!');
      break;
    }
  }
}
