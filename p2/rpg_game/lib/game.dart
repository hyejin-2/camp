import 'dart:io';
import 'dart:math';
import 'character.dart';
import 'monster.dart';

class Game {
  late Character character; //게임에 사용할 캐릭터 인스턴스
  List<Monster> monsters = []; //전투할 몬스터 리스트
  int defeatedCount = 0; //물리친 몬스터 수

  Game(); //

  void startGame() {
    _loadCharacter(); //캐릭터 정보 로딩 및 이름 입력
    _loadMonsters(); //몬스터 리스트 로딩

    print('게임을 시작합니다!');
    character.showStatus(); // 캐릭터 상태 출력 추가

    //캐릭터 체력이 남아있고, 아직 모든 몬스터를 물리치지 않았다면 반복
    while (character.health > 0 && defeatedCount < monsters.length) {
      Monster monster = _getRandomMonster(); //랜덤 몬스터 선택

      print('\n새로운 몬스터가 나타났습니다!');
      monster.showStatus(); // 몬스터 상태 출력 추가

      bool result = _battle(monster); //전투 시작

      if (!result) break; //캐릭터 사망 시 반복 종료

      defeatedCount++; //몬스터를 물리친 경우 카운트 증가
      monsters.remove(monster); //해당 몬스터 제거

      //다음 몬스터와 계속 싸울지 사용자에게 묻기
      if (defeatedCount < monsters.length) {
        stdout.write('다음 몬스터와 대결하시겠습니까? (y/n)');
        String? choice = stdin.readLineSync();
        if (choice?.toLowerCase() != 'y') break;
      }
    }

    //게임 종료 후 결과 판단 및 저장
    if (character.health <= 0) {
      print('게임 오버! 패배했습니다.');
      _saveResult("패배");
    } else if (defeatedCount >= monsters.length) {
      print('축하합니다! 게임에서 승리했습니다.');
      _saveResult("승리");
    } else {
      print('게임을 중단했습니다.');
      _saveResult("중단");
    }
  }

  bool _battle(Monster monster) {
    int turn = 1;

    //전투 루프: 캐릭터 또는 몬스터가 죽을 때까지 반복
    while (character.health > 0 && monster.health > 0) {
      print('\n${character.name}의 턴');
      //캐릭터 상태 출력하지 않음 (삭제함..)

      //사용자 입력
      stdout.write('행동을 선택하세요 (1: 공격, 2: 방어, 3: 아이템 사용): ');
      String? input = stdin.readLineSync();

      if (input == '1') {
        // 일반 공격
        character.attackMonster(monster);
      } else if (input == '2') {
        // 방어: 몬스터가 입힐 데미지를 계산하고, 그 데미지만큼 체력 회복
        int damage = monster.attackPower - character.defensePower;
        damage = damage < 0 ? 0 : damage;

        character.defend(damage); // 회복
        print('${monster.name}의 공격을 방어했습니다!');
        turn++;
        continue;
      } else if (input == '3') {
        // 아이템 사용 (한 번만 가능)
        if (!character.hasUsedItem) {
          character.useSpecialItem();
          character.attackMonster(monster, useItem: true);
        } else {
          print('이미 아이템을 사용했습니다!');
          continue;
        }
      } else {
        print('잘못된 입력입니다.');
        continue;
      }

      // 몬스터가 살아있으면 반격
      if (monster.health > 0) {
        print('\n${monster.name}의 턴');
        int damage = monster.attackPower - character.defensePower;
        damage = damage < 0 ? 0 : damage;

        character.health -= damage;
        print('${monster.name}이(가) ${character.name}에게 $damage의 데미지를 입혔습니다.');

        // 캐릭터 상태 출력
        print(
          '${character.name} - 체력: ${character.health}, 공격력: ${character.attackPower}, 방어력: ${character.defensePower}',
        );
        print(
          '${monster.name} - 체력: ${monster.health}, 공격력: ${monster.attackPower}',
        );
      }

      // 3턴마다 몬스터 방어력 증가
      if (turn % 3 == 0) {
        monster.increaseDefense();
      }

      turn++;
    }

    return character.health > 0;
  }

  //몬스터 리스트 랜덤하게 하나 선택
  Monster _getRandomMonster() {
    return monsters[Random().nextInt(monsters.length)];
  }

  // 캐릭터 로딩: 파일 읽기 + 사용자 이름 입력
  void _loadCharacter() {
    try {
      stdout.write('캐릭터 이름을 입력하세요: ');
      String? name = stdin.readLineSync();

      //이름 유효성 검사: 한글/영문만 허용
      if (name == null || !RegExp(r'^[a-zA-Z가-힣]+$').hasMatch(name)) {
        throw FormatException('올바르지 않은 이름입니다.');
      }

      final file = File('characters.txt');
      final contents = file.readAsStringSync();
      final stats = contents.split(',');
      if (stats.length != 3) throw FormatException('캐릭터 데이터 형식 오류');

      character = Character(
        name,
        int.parse(stats[0]), //체력
        int.parse(stats[1]), //공격력
        int.parse(stats[2]), //방어력
      );

      // 도전 기능: 30% 확률로 체력 +10
      if (Random().nextInt(100) < 30) {
        character.health += 10;
        print('보너스 체력을 얻었습니다! 현재 체력: ${character.health}');
      }
    } catch (e) {
      print('캐릭터 데이터를 불러오는 데 실패했습니다: $e');
      exit(1);
    }
  }

  //monsters.txt 로부터 몬스터 목록 읽기
  void _loadMonsters() {
    try {
      final file = File('monsters.txt');
      final lines = file.readAsLinesSync();

      for (String line in lines) {
        final parts = line.split(',');
        if (parts.length != 3) continue;

        //이름, 체력, 공격력 최대값
        monsters.add(
          Monster(parts[0], int.parse(parts[1]), int.parse(parts[2])),
        );
      }
    } catch (e) {
      print('몬스터 데이터를 불러오는 데 실패했습니다: $e');
      exit(1);
    }
  }

  //게임 결과 저장 기능
  void _saveResult(String result) {
    stdout.write('결과를 저장하시겠습니까? (y/n)');
    String? input = stdin.readLineSync();
    if (input?.toLowerCase() == 'y') {
      final file = File('result.txt');
      file.writeAsStringSync(
        '캐릭터: ${character.name}, 남은 체력: ${character.health}, 게임 결과: $result\n',
        mode: FileMode.append,
      );
      print('결과가 저장되었습니다.');
    }
  }
}
