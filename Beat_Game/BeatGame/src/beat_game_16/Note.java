package beat_game_16;

import java.awt.Graphics2D;
import java.awt.Image;

import javax.swing.ImageIcon;

public class Note extends Thread {

	private Image noteBasicImage = new ImageIcon(Main.class.getResource("../images/noteBasic.png")).getImage();
	private int x, y = 500 - (1000 / Main.SLEEP_TIME * Main.NOTE_SPEED) * Main.REACH_TIME;
	private String noteType;
	private boolean proceeded = true; // 현재 노트의 진행 여부

	public String getNoteType() {
		return noteType;
	}

	// 현재 진행이 되고 있는지 getter 함수
	public boolean isProceeded() {
		return proceeded;
	}

	// 현재 노트가 움직이지 않게 해주는 함수
	public void close() {
		proceeded = false;
	}

	public Note(String noteType) {
		if (noteType.equals("S")) {
			x = 228;
		} else if (noteType.equals("D")) {
			x = 332;
		} else if (noteType.equals("F")) {
			x = 436;
		} else if (noteType.equals("Space")) {
			x = 540;
		} else if (noteType.equals("J")) {
			x = 744;
		} else if (noteType.equals("K")) {
			x = 848;
		} else if (noteType.equals("L")) {
			x = 952;
		}
		this.noteType = noteType;
	}

	// 노트를 그려주는 메서드
	public void screenDraw(Graphics2D g) {
		if (!noteType.equals("Space")) {
			g.drawImage(noteBasicImage, x, y, null);
		} else {
			// 스페이스는 2개
			g.drawImage(noteBasicImage, x, y, null);
			g.drawImage(noteBasicImage, x + 100, y, null);
		}

	}

	// 노트를 NOTE_SPEED 만큼 아래로 떨어뜨리게 함
	public void drop() {
		y += Main.NOTE_SPEED;
		// 노트가 판정바를 벗어나면 Miss를 출력하고 close()
		if (y > 620) {
			System.out.println("Miss");
			close();
		}
	}

	@Override
	public void run() {
		try {
			while (true) {
				drop();
				// 현재 노트가 움직이는 중이면 반복적으로 쉬면서 내려올 수 있게 처리
				if (proceeded) {
					Thread.sleep(Main.SLEEP_TIME); // 한번 노트를 떨어뜨리고 SLEEP_TIME 만큼 쉬게 하고 다시 떨어뜨림
				} else {
					interrupt();
					break;
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	// 판정 기준 설정. String으로 해당 판정이 특정한 반환값을 가질 수 있도록 설정
	public String judge() {
		if (y >= 613) {
			System.out.println("Late");
			close();
			return "Late";
		} else if (y >= 600) {
			System.out.println("Good");
			close();
			return "Good";
		} else if (y >= 587) {
			System.out.println("Great");
			close();
			return "Great";
		} else if (y >= 573) {
			System.out.println("Perfect");
			close();
			return "Perpect";
		} else if (y >= 565) {
			System.out.println("Great");
			close();
			return "Great";
		} else if (y >= 550) {
			System.out.println("Good");
			close();
			return "Good";
		} else if (y >= 535) {
			System.out.println("Early");
			close();
			return "Early";
		}
		return "None"; // 해당되지 않는 경우 판정이 없다고 리턴
	}

	// 현재의 y좌표 반환
	public int getY() {
		return y;
	}

}
