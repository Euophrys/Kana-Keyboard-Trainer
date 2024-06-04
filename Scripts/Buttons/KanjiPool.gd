extends CheckButton

const kanji = [["五","ご"],["口","くち"],["左","ひだり"],["三","さん"],["山","やま"],["子","こ"],["四","よん"],["漢字","かんじ"],
["学校","がっこう"],["耳","みみ"],["七","しち"],["車","くるま"],["手","て"],["十","じゅう"],["女","おんな"],["男","おとこ"],
["上","うえ"],["下","した"],["森","もり"],["水","みず"],["青","あお"],["赤","あか"],["白","しろ"],["黒","くろ"],
["先","さき"],["草","くさ"],["足","あし"],["犬","いぬ"],["猫","ねこ"],["中","なか"],["虫","むし"],["天","てん"],
["二","に"],["六","ろく"],["八","はち"],["九","きゅう"],["百","ひゃく"],["本当","ほんとう"],["私","わたし"],["右","みぎ"],
["一","いち"],["雨","あめ"],["円","えん"],["音","おと"],["花","はな"],["月","つき"],["金","きん"],["空","そら"],
["何","なに"],["無理","むり"],["出口","でぐち"],["綺麗","きれい"],["今","いま"],["明日","あした"],["今日","きょう"],["秋","あき"],
["朝","あさ"],["天気","てんき"],["誰","だれ"],["友達","ともだち"],["彼","かれ"],["火曜日","かようび"],["大丈夫","だいじょうぶ"],["学生","がくせい"],
["部屋","へや"],["店","みせ"],["髪","かみ"],["寿司","すし"],["肉","にく"],["英語","えいご"],["日本","にほん"],["失礼","しつれい"],
["頭","あたま"],["会社","かいしゃ"],["仕事","しごと"],["大変","たいへん"],["簡単","かんたん"],["夜","よる"],["先週","せんしゅう"],["先生","せんせい"]]

func _ready():
	if (Global.current_target == "kanji"):
		Global.targetPool = kanji;
		button_pressed = true;
		
func _pressed():
	Global.targetPool = kanji;
	Global.current_target = "kanji";
