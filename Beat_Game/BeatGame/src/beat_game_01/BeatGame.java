package beat_game_01;

import javax.swing.JFrame;

public class BeatGame extends JFrame {

	public BeatGame() {
		setTitle("Beat Game");
		setSize(Main.SCREEN_WIDTH, Main.SCREEN_HEIGHT);
		setResizable(false); // 창 크기 변경 불가
		setLocationRelativeTo(null); // 화면을 정중앙에 뜨게 함
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // 창을 닫으면 프로그램이 종료
		setVisible(true); // 화면이 정상적으로 출력되게 함
	}

}
