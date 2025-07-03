import 'dart:math';
import 'entity.dart';
import 'character.dart';

class Monster extends Entity {
  // 생성자: 공격력 랜덤 생성
  Monster(String name, int health, int maxAttackPower)
    : super(name, health, max(maxAttackPower, 0), 0) {
    attackPower = Random().nextInt(maxAttackPower) + 1;
  }

  // 캐릭터에게 공격 (캐릭터 방어력 반영))
  int attackCharacter(Character character) {
    int damage = attackPower - character.defensePower;
    damage = damage < 0 ? 0 : damage;

    character.health -= damage;
    if (character.health < 0) character.health = 0;

    print('$name이(가) ${character.name}에게 $damage의 데미지를 입혔습니다!');
    return damage; //데미지 반환
  }

  // 도전 기능: 3턴마다 방어력 +2 증가 메서드
  void increaseDefense() {
    defensePower += 2;
    print('$name의 방어력이 증가했습니다! 현재 방어력: $defensePower');
  }

  // 몬스터 상태 출력
  @override
  void showStatus() {
    print('$name - 체력: $health, 공격력: $attackPower');
  }
}
