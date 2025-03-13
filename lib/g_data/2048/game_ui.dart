import 'package:flutter/material.dart';
import 'game_logic.dart';

// 定义一个2048游戏的页面
class Game2048Page extends StatelessWidget {
  const Game2048Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2048 Game'),
        backgroundColor: const Color.fromRGBO(102, 107, 141, 1),
      ),
      body: const GameHomePage(),
    );
  }
}

// 定义一个游戏主页的StatefulWidget
class GameHomePage extends StatefulWidget {
  const GameHomePage({super.key});

  @override
  State<GameHomePage> createState() => _GameHomePageState();
}

// 定义一个游戏主页的状态
class _GameHomePageState extends State<GameHomePage> {
  // 定义一个游戏对象
  late Game2048 _game;
  // 定义一个Scaffold的key
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // 初始化游戏对象，并传入游戏结束的回调函数
    _game = Game2048(onGameOver: _handleGameOver);
  }

  // 游戏结束的回调函数
  void _handleGameOver(int score) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Game Over!'),
            content: Text('Final Score: $score'),
            actions: [
              TextButton(
                onPressed: () {
                  // 重置游戏
                  _game.resetGame();
                  Navigator.pop(context);
                },
                child: const Text('New Game'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Stack(
            children: [
              _buildBackground(),
              _buildGameBoard(context),
              _buildScore(),
            ],
          );
        },
      ),
    );
  }

  // 构建背景
  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFFfaf8ef),
            const Color.fromRGBO(187, 173, 160, 0.8),
          ],
        ),
      ),
    );
  }

  // 构建游戏板
  Widget _buildGameBoard(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              if (details.primaryDelta! < -10) {
                _game.move(Direction.up);
              } else if (details.primaryDelta! > 10) {
                _game.move(Direction.down);
              }
            },
            onHorizontalDragUpdate: (details) {
              if (details.primaryDelta! < -10) {
                _game.move(Direction.left);
              } else if (details.primaryDelta! > 10) {
                _game.move(Direction.right);
              }
            },
            child: AnimatedBuilder(
              animation: _game,
              builder: (context, _) {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: 16,
                  itemBuilder: (context, index) {
                    final x = index ~/ 4;
                    final y = index % 4;
                    return _buildTile(_game.grid[x][y]);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // 构建游戏板上的每个格子
  Widget _buildTile(int value) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOutQuad,
      decoration: BoxDecoration(
        color: _getTileColor(value),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          child:
              value != 0
                  ? Text(
                    '$value',
                    style: TextStyle(
                      fontSize: _getFontSize(value),
                      fontWeight: FontWeight.bold,
                      color: value > 4 ? Colors.white : const Color(0xFF776e65),
                    ),
                  )
                  : const SizedBox.shrink(),
        ),
      ),
    );
  }

  // 构建分数
  Widget _buildScore() {
    return Positioned(
      top: 40,
      left: 16,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFbbada0),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          'Score: ${_game.score}',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // 根据格子的值获取格子的颜色
  Color _getTileColor(int value) {
    const colors = {
      0: Color(0xFFcdc1b4),
      2: Color(0xFFeee4da),
      4: Color(0xFFede0c8),
      8: Color(0xFFf2b179),
      16: Color(0xFFf59563),
      32: Color(0xFFf67c5f),
      64: Color(0xFFf65e3b),
      128: Color(0xFFedcf72),
      256: Color(0xFFedcc61),
      512: Color(0xFFedc850),
      1024: Color(0xFFedc53f),
      2048: Color(0xFFedc22e),
    };
    return colors[value] ?? colors[0]!;
  }

  double _getFontSize(int value) {
    if (value < 100) return 32;
    if (value < 1000) return 28;
    return 24;
  }
}
