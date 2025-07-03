import 'entity.dart';
import 'monster.dart';

class Character extends Entity {
  bool hasUsedItem = false; // 아이템 사용 여부 변수 추가

  Character(String name, int health, int attackPower, int defensePower)
    : super(name, health, attackPower, defensePower);

  // 아이템 사용 여부에 따라 공격력 2배 적용
  void attackMonster(Monster monster, {bool useItem = false}) {
    int damage = useItem ? attackPower * 2 : attackPower;

    // 몬스터 방어력 적용
    damage -= monster.defensePower;
    damage = damage < 0 ? 0 : damage;

    monster.health -= damage;
    if (monster.health < 0) monster.health = 0;

    print('$name이(가) ${monster.name}을(를) 공격했습니다! [$damage 데미지]');
  }

  // (아이템 사용 시 호출) 한 번만 사용 가능
  void useSpecialItem() {
    hasUsedItem = true;
    print('$name이(가) 특수 아이템을 사용했습니다! 이번 공격은 2배 데미지를 줍니다.');
  }

  // 방어시 몬스터 데미지만큼 체력 회복
  void defend(int damage) {
    health += damage;
    print('$name이(가) 방어 태세를 취하여 $damage 만큼 체력을 얻었습니다.');
  }

  //캐릭터 상태 출력
  @override
  void showStatus() {
    print('$name - 체력: $health, 공격력: $attackPower, 방어력: $defensePower');
  }
}
