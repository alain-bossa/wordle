import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _scoresKey = 'game_scores';

  Future<void> saveScore(int score) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> scoresList = prefs.getStringList(_scoresKey) ?? [];
    scoresList.add(score.toString());
    await prefs.setStringList(_scoresKey, scoresList);
  }

  Future<List<int>> getScores() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> scoresList = prefs.getStringList(_scoresKey) ?? [];
    return scoresList.map((e) => int.parse(e)).toList();
  }

  Future<void> clearScores() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_scoresKey);
  }
}