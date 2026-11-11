import 'character.dart';

void printSeparator() => print('─' * 40);

void fight(Character attacker, Character defender) {
  int damage = attacker.attack();
  int hpBefore = defender.hp;
  defender.takeDamage(damage);
  int actualDamage = hpBefore - defender.hp;
  print('${attacker.name} атакует ${defender.name} и наносит $actualDamage урона!');
}

void battle(Character player, Character enemy) {
  printSeparator();
  print('⚔️ НАЧАЛО БИТВЫ ⚔️');
  player.describe();
  enemy.describe();
  printSeparator();

  int round = 1;
  while (player.isAlive && enemy.isAlive) {
    print('\n--- Раунд $round ---');
    fight(player, enemy);

    if (enemy.isAlive) {
      fight(enemy, player);
    }

    print('\nСостояние бойцов:');
    print('${player.name}: ${player.hpBar}');
    print('${enemy.name}: ${enemy.hpBar}');
    printSeparator();
    round++;
  }

  if (player.isAlive) {
    print('🏆 Победа! ${player.name} одолел ${enemy.name}!');
  } else {
    print('💀 Поражение... ${enemy.name} оказался сильнее.');
  }
}
