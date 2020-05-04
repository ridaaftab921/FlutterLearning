import 'dart:io';

int calculate() {
  return 6 * 7;
}

void startProgram() {
  var lineNumber = 1;

  var lines = File('file.txt').readAsStringSync().split('\n');

  lines.forEach((String line) {
    var wordList = countWordsInLine(line.toLowerCase());
    if(wordList.isNotEmpty) {
      var words = [];
      var freq = 0;

      wordList.forEach((MapEntry entry) {
        words.add(entry.key); 
        freq = entry.value;
      });

      print('$words appear in line# $lineNumber for $freq times');    
    }
    
    lineNumber++;

  });
}

List<MapEntry> countWordsInLine(String sentence) {
    var words = sentence.split(' ');
    var frequenyMap = <String, int>{};
    var maxFrequency = 0;
    words.forEach( (String word) {
      if (frequenyMap.containsKey(word)) {
          frequenyMap[word]++;
      } else {
          frequenyMap[word] = 1;
      }
      if (maxFrequency < frequenyMap[word]) { 
         maxFrequency = frequenyMap[word];
      }
    }); 
    
    return frequenyMap.entries.where((e) => (e.value == maxFrequency && maxFrequency > 1)).toList();
}
