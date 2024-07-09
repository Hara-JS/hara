package beat_game_15;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;

import javazoom.jl.player.Player;

public class Music extends Thread {

	private Player player;
	// 현재 곡이 무한반복인지 아닌지를 설정하는 변수
	private boolean isLoop;
	private File file;
	private FileInputStream fis;
	private BufferedInputStream bis;

	// 곡 제목, 해당 곡이 무한반복인지를 매개변수로 받음
	public Music(String name, boolean isLoop) {
		try {
			this.isLoop = isLoop;
			// Music 이라는 폴더 안에 있는 해당 이름의 파일을 실행. toURI로 해당 파일의 위치를 가져옴
			file = new File(Main.class.getResource("../music/" + name).toURI());
			// 해당 파일을 버퍼에 담아서 가져옴
			fis = new FileInputStream(file);
			bis = new BufferedInputStream(fis);
			player = new Player(bis);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	// 현재 실행되고 있는 음악이 어떤 위치에서 실행되고 있는지를 알려줌
	// 0.001초 단위까지 알려줌
	public int getTime() {
		if (player == null)
			return 0;
		return player.getPosition();
	}

	// 음악이 실행되고 있어도 언제든지 안정적으로 종료할 수 있도록 해줌
	public void close() {
		isLoop = false;
		player.close();
		// 해당 Thread를 중지 상태로 만들어 줌
		this.interrupt();
	}

	@Override
	// Thread 상속시 무조건 사용
	public void run() {
		try {
			// 곡을 실행. isLoop가 true면 무한반복
			do {
				player.play();
				fis = new FileInputStream(file);
				bis = new BufferedInputStream(fis);
				player = new Player(bis);
			} while (isLoop);

		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
	}

}
