import 'package:flutter/material.dart';
import 'dart:math';

// 定义2048游戏类，继承自ChangeNotifier，用于通知UI更新
class Game2048 with ChangeNotifier {
  // 定义游戏网格，初始值为0
  List<List<int>> grid = List.generate(4, (_) => List.filled(4, 0));
  // 定义游戏得分，初始值为0
  int score = 0;
  // 定义游戏结束回调函数
  final Function(int)? onGameOver;

  // 构造函数，初始化游戏网格和得分，并添加两个初始方块
  Game2048({this.onGameOver}) {
    _addNewTile();
    _addNewTile();
  }

  // 移动函数，根据方向参数移动方块
  void move(Direction direction) {
    bool moved = false;
    // 创建一个新的网格，用于存储移动后的方块
    final newGrid = List.generate(4, (_) => List.filled(4, 0));

    // 根据方向参数，移动方块
    switch (direction) {
      case Direction.left:
        for (int i = 0; i < 4; i++) {
          newGrid[i] = _mergeRow(grid[i]);
        }
        break;
      case Direction.right:
        for (int i = 0; i < 4; i++) {
          newGrid[i] = _mergeRow(grid[i].reversed.toList()).reversed.toList();
        }
        break;
      case Direction.up:
        for (int j = 0; j < 4; j++) {
          final column = [grid[0][j], grid[1][j], grid[2][j], grid[3][j]];
          final merged = _mergeRow(column);
          for (int i = 0; i < 4; i++) {
            newGrid[i][j] = merged[i];
          }
        }
        break;
      case Direction.down:
        for (int j = 0; j < 4; j++) {
          final column = [grid[3][j], grid[2][j], grid[1][j], grid[0][j]];
          final merged = _mergeRow(column);
          for (int i = 0; i < 4; i++) {
            newGrid[3 - i][j] = merged[i];
          }
        }
        break;
    }

    // 如果移动后的网格和移动前的网格不同，则更新网格
    if (newGrid.toString() != grid.toString()) {
      grid = newGrid;
      moved = true;
      _addNewTile();
    }

    // 如果移动了方块，则通知UI更新，并检查是否有可移动的方块
    if (moved) {
      notifyListeners();
      if (!_hasMoves()) {
        onGameOver?.call(score);
      }
    }
  }

  // 合并行函数，将一行中的方块合并
  List<int> _mergeRow(List<int> row) {
    // 将行中的0去除，并存储在nonZero列表中
    List<int> nonZero = row.where((n) => n != 0).toList();
    // 创建一个空列表，用于存储合并后的方块
    List<int> merged = [];

    // 遍历nonZero列表，合并相邻的相同方块
    for (int i = 0; i < nonZero.length; i++) {
      if (i < nonZero.length - 1 && nonZero[i] == nonZero[i + 1]) {
        merged.add(nonZero[i] * 2);
        score += nonZero[i] * 2;
        i++;
      } else {
        merged.add(nonZero[i]);
      }
    }

    // 将合并后的方块和0填充到merged列表中，使其长度为4
    return merged + List.filled(4 - merged.length, 0);
  }

  // 添加新方块函数，在空格中随机添加一个2或4
  void _addNewTile() {
    // 创建一个空列表，用于存储空格的位置
    final emptyCells = <Point<int>>[];
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        if (grid[i][j] == 0) {
          emptyCells.add(Point(i, j));
        }
      }
    }

    // 如果有空格，则在空格中随机添加一个2或4
    if (emptyCells.isNotEmpty) {
      final random = Random();
      final pos = emptyCells[random.nextInt(emptyCells.length)];
      grid[pos.x][pos.y] = random.nextDouble() < 0.9 ? 2 : 4;
    }
  }

  // 检查是否有可移动的方块函数，如果有空格或相邻的方块相同，则返回true
  bool _hasMoves() {
    // Check empty cells
    for (final row in grid) {
      if (row.contains(0)) return true;
    }

    // Check possible merges
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        if ((i < 3 && grid[i][j] == grid[i + 1][j]) ||
            (j < 3 && grid[i][j] == grid[i][j + 1])) {
          return true;
        }
      }
    }
    return false;
  }

  void resetGame() {
    grid = List.generate(4, (_) => List.filled(4, 0));
    score = 0;
    _addNewTile();
    _addNewTile();
    notifyListeners();
  }
}

enum Direction { up, down, left, right }
