package beat_game_16;

public class Main {

	// HD 해상도 1280 * 720
	public static final int SCREEN_WIDTH = 1280;
	public static final int SCREEN_HEIGHT = 720;
	public static final int NOTE_SPEED = 3; // 노트가 떨어지는 속도
	public static final int SLEEP_TIME = 10;
	public static final int REACH_TIME = 2; // 노트가 생성되고 판정라인에 도달하기까지의 시간

	public static void main(String[] args) {

		new BeatGame();

	}

}
