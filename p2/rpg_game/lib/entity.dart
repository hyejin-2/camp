// Entity 추상 클래스 - 캐릭터와 몬스터 공통 속성 정의
abstract class Entity {
  String name;
  int health;
  int attackPower;
  int defensePower;

  // 공통 생성자
  Entity(this.name, this.health, this.attackPower, this.defensePower);

  // 상태 출력 메서드 (각 클래스에서 override)
  void showStatus();
}
