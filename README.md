If you just want to download the built files, see the Releases page: https://github.com/Euophrys/Kana-Keyboard-Trainer/releases

If you're paranoid, you can download Godot at https://godotengine.org/ and run it in the engine or build it yourself.

I'd never used Godot before this so it might not fit with normal Godot conventions.

If you want to change the words/kanji that appear, see Scripts/Buttons/WordPool.gd and Scripts/Buttons/KanjiPool.gd. For the WordPool, you can just change the contents of the array, should be straight forward. For the KanjiPool, you have to give the hiragana as well in a subarray, ["Kanji", "Hiragana"]. You could also do this in the WordsArray if you wanted katakana words, like ["コーヒー", "こーひー"]. You can mix and match paired things like that and regular words.
