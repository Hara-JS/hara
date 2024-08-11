package beat_game_16;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.util.ArrayList;

import javax.swing.ImageIcon;

public class Game extends Thread {

	private Image noteRouteLineImage = new ImageIcon(Main.class.getResource("../images/noteRouteLine.png")).getImage();
	private Image judgementLineImage = new ImageIcon(Main.class.getResource("../images/judgementLine.png")).getImage();
	private Image gameInfoImage = new ImageIcon(Main.class.getResource("../images/gameInfo.png")).getImage();

	private Image noteRouteSImage = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
	private Image noteRouteDImage = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
	private Image noteRouteFImage = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
	private Image noteRouteSpace1Image = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
	private Image noteRouteSpace2Image = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
	private Image noteRouteJImage = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
	private Image noteRouteKImage = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
	private Image noteRouteLImage = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
	
	private Image blueFlareImage;
	private Image judgeImage; //판정 이미지
	private Image keyPadSImage = new ImageIcon(Main.class.getResource("../images/keyPadBasic.png")).getImage();
	private Image keyPadDImage = new ImageIcon(Main.class.getResource("../images/keyPadBasic.png")).getImage();
	private Image keyPadFImage = new ImageIcon(Main.class.getResource("../images/keyPadBasic.png")).getImage();
	private Image keyPadSpace1Image = new ImageIcon(Main.class.getResource("../images/keyPadBasic.png")).getImage();
	private Image keyPadSpace2Image = new ImageIcon(Main.class.getResource("../images/keyPadBasic.png")).getImage();
	private Image keyPadJImage = new ImageIcon(Main.class.getResource("../images/keyPadBasic.png")).getImage();
	private Image keyPadKImage = new ImageIcon(Main.class.getResource("../images/keyPadBasic.png")).getImage();
	private Image keyPadLImage = new ImageIcon(Main.class.getResource("../images/keyPadBasic.png")).getImage();

	private String titleName; // 현재 실행할 곡의 이름
	private String difficulty; // 난이도 설정
	private String musicTitle; // 현재 선택된 곡의 제목
	private Music gameMusic; // 게임 음악

	ArrayList<Note> noteList = new ArrayList<Note>();

	public Game(String titleName, String difficulty, String musicTitle) {
		this.titleName = titleName;
		this.difficulty = difficulty;
		this.musicTitle = musicTitle;
		gameMusic = new Music(this.musicTitle, false);
	}

	public void screenDraw(Graphics2D g) {
		g.drawImage(noteRouteSImage, 228, 30, null);
		g.drawImage(noteRouteDImage, 332, 30, null);
		g.drawImage(noteRouteFImage, 436, 30, null);
		g.drawImage(noteRouteSpace1Image, 540, 30, null);
		g.drawImage(noteRouteSpace2Image, 640, 30, null);
		g.drawImage(noteRouteJImage, 744, 30, null);
		g.drawImage(noteRouteKImage, 848, 30, null);
		g.drawImage(noteRouteLImage, 952, 30, null);

		g.drawImage(noteRouteLineImage, 224, 30, null);
		g.drawImage(noteRouteLineImage, 328, 30, null);
		g.drawImage(noteRouteLineImage, 432, 30, null);
		g.drawImage(noteRouteLineImage, 536, 30, null);
		g.drawImage(noteRouteLineImage, 740, 30, null);
		g.drawImage(noteRouteLineImage, 844, 30, null);
		g.drawImage(noteRouteLineImage, 948, 30, null);
		g.drawImage(noteRouteLineImage, 1052, 30, null);

		g.drawImage(gameInfoImage, 0, 660, null);
		g.drawImage(judgementLineImage, 0, 580, null);

		for (int i = 0; i < noteList.size(); i++) {
			Note note = noteList.get(i);
			// 현재의 y좌표가 620보다 크면(노트가 넘어간 경우) judgeImage를 judgeMiss 이미지로 바꿔줌
			if(note.getY() > 620) {
				judgeImage  = new ImageIcon(Main.class.getResource("../images/judgeMiss.png")).getImage();
			}
			// 현재 노트가 작동하는 상태가 아니라면 노트를 지워줌. 사용되지 않는 노트를 화면에서 지워줌
			if(!note.isProceeded()) {
				noteList.remove(i);
				i--;
			} else {
				note.screenDraw(g);
			}
		}

		g.setColor(Color.white);
		g.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON); // 텍스트가 깨짐 없이 출력
		g.setColor(Color.white);
		g.setFont(new Font("Arial", Font.BOLD, 30));
		g.drawString(titleName, 20, 702);
		g.drawString(difficulty, 1190, 700);
		g.setFont(new Font("Arial", Font.PLAIN, 26));
		g.setColor(Color.DARK_GRAY);
		g.drawString("S", 270, 609);
		g.drawString("D", 374, 609);
		g.drawString("F", 478, 609);
		g.drawString("Space bar", 580, 609);
		g.drawString("J", 784, 609);
		g.drawString("K", 889, 609);
		g.drawString("L", 993, 609);
		g.setColor(Color.LIGHT_GRAY);
		g.setFont(new Font("Elephant", Font.BOLD, 30));
		g.drawString("000000", 565, 702); // 게임 점수
		
		g.drawImage(blueFlareImage, 300, 400, null);
		g.drawImage(judgeImage, 460, 400, null);
		
		g.drawImage(keyPadSImage, 228, 580, null);
		g.drawImage(keyPadDImage, 332, 580, null);
		g.drawImage(keyPadFImage, 436, 580, null);
		g.drawImage(keyPadSpace1Image, 540, 580, null);
		g.drawImage(keyPadSpace2Image, 640, 580, null);
		g.drawImage(keyPadJImage, 744, 580, null);
		g.drawImage(keyPadKImage, 848, 580, null);
		g.drawImage(keyPadLImage, 952, 580, null);
	}

	// 키보드를 눌렀을 때와 뗐을 때의 메서드
	public void pressS() {
		judge("S");
		noteRouteSImage = new ImageIcon(Main.class.getResource("../images/noteRoutePressed.png")).getImage(); // 키보드를 눌렀을 때 노트 경로 이미지
		keyPadSImage = new ImageIcon(Main.class.getResource("../images/keyPadPressed.png")).getImage(); // 키 패드를 눌렀을 때 이미지
		new Music("drumSmall1.mp3", false).start(); // 키보드를 눌렀을 때 소리. false로 반복하지 않음
	}

	public void releaseS() {
		noteRouteSImage = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage(); // 키보드에서 뗐을 때 노트 경로 이미지
		keyPadSImage = new ImageIcon(Main.class.getResource("../images/keyPadBasic.png")).getImage(); // 키 패드에서 뗐을 때 이미지
	}

	public void pressD() {
		judge("D");
		noteRouteDImage = new ImageIcon(Main.class.getResource("../images/noteRoutePressed.png")).getImage();
		keyPadDImage = new ImageIcon(Main.class.getResource("../images/keyPadPressed.png")).getImage();
		new Music("drumSmall1.mp3", false).start();
	}

	public void releaseD() {
		noteRouteDImage = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
		keyPadDImage = new ImageIcon(Main.class.getResource("../images/keyPadBasic.png")).getImage();
	}

	public void pressF() {
		judge("F");
		noteRouteFImage = new ImageIcon(Main.class.getResource("../images/noteRoutePressed.png")).getImage();
		keyPadFImage = new ImageIcon(Main.class.getResource("../images/keyPadPressed.png")).getImage();
		new Music("drumSmall1.mp3", false).start();
	}

	public void releaseF() {
		noteRouteFImage = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
		keyPadFImage = new ImageIcon(Main.class.getResource("../images/keyPadBasic.png")).getImage();
	}

	public void pressSpace() {
		judge("Space");
		noteRouteSpace1Image = new ImageIcon(Main.class.getResource("../images/noteRoutePressed.png")).getImage();
		noteRouteSpace2Image = new ImageIcon(Main.class.getResource("../images/noteRoutePressed.png")).getImage();
		keyPadSpace1Image = new ImageIcon(Main.class.getResource("../images/keyPadPressed.png")).getImage();
		keyPadSpace2Image = new ImageIcon(Main.class.getResource("../images/keyPadPressed.png")).getImage();
		new Music("drumBig1.mp3", false).start();
	}

	public void releaseSpace() {
		noteRouteSpace1Image = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
		noteRouteSpace2Image = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
		keyPadSpace1Image = new ImageIcon(Main.class.getResource("../images/keyPadBasic.png")).getImage();
		keyPadSpace2Image = new ImageIcon(Main.class.getResource("../images/keyPadBasic.png")).getImage();
	}

	public void pressJ() {
		judge("J");
		noteRouteJImage = new ImageIcon(Main.class.getResource("../images/noteRoutePressed.png")).getImage();
		keyPadJImage = new ImageIcon(Main.class.getResource("../images/keyPadPressed.png")).getImage();
		new Music("drumSmall1.mp3", false).start();
	}

	public void releaseJ() {
		noteRouteJImage = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
		keyPadJImage = new ImageIcon(Main.class.getResource("../images/keyPadBasic.png")).getImage();
	}

	public void pressK() {
		judge("K");
		noteRouteKImage = new ImageIcon(Main.class.getResource("../images/noteRoutePressed.png")).getImage();
		keyPadKImage = new ImageIcon(Main.class.getResource("../images/keyPadPressed.png")).getImage();
		new Music("drumSmall1.mp3", false).start();
	}

	public void releaseK() {
		noteRouteKImage = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
		keyPadKImage = new ImageIcon(Main.class.getResource("../images/keyPadBasic.png")).getImage();
	}

	public void pressL() {
		judge("L");
		noteRouteLImage = new ImageIcon(Main.class.getResource("../images/noteRoutePressed.png")).getImage();
		keyPadLImage = new ImageIcon(Main.class.getResource("../images/keyPadPressed.png")).getImage();
		new Music("drumSmall1.mp3", false).start();
	}

	public void releaseL() {
		noteRouteLImage = new ImageIcon(Main.class.getResource("../images/noteRoute.png")).getImage();
		keyPadLImage = new ImageIcon(Main.class.getResource("../images/keyPadBasic.png")).getImage();
	}

	@Override
	public void run() {
		dropNotes(this.titleName);
	}

	// 실행되고 있는 게임 쓰레드를 종료
	public void close() {
		gameMusic.close();
		this.interrupt();
	}

	public void dropNotes(String titleName) {
		Beat[] beats = null;
		// 해당 곡의 이름과 난이도를 가져와서 노트를 곡에 맞게 출력함
		if(titleName.equals("Grey_Morning_Piano_Ver") && difficulty.equals("Easy")) {
			int startTime = 4460 - Main.REACH_TIME * 1000;
			int gap = 125; // 최소 박자의 간격
			beats = new Beat[] {
					new Beat(startTime, "S"),
					new Beat(startTime + gap * 2, "D"),
					new Beat(startTime + gap * 4, "S"),
					new Beat(startTime + gap * 6, "D"),
					new Beat(startTime + gap * 8, "S"),
					new Beat(startTime + gap * 10, "D"),
					new Beat(startTime + gap * 12, "S"),
					new Beat(startTime + gap * 14, "D"),
					new Beat(startTime + gap * 18, "J"),
					new Beat(startTime + gap * 20, "K"),
					new Beat(startTime + gap * 22, "J"),
					new Beat(startTime + gap * 24, "K"),
					new Beat(startTime + gap * 26, "J"),
					new Beat(startTime + gap * 28, "K"),
					new Beat(startTime + gap * 30, "J"),
					new Beat(startTime + gap * 32, "K"),
					new Beat(startTime + gap * 36, "S"),
					new Beat(startTime + gap * 38, "D"),
					new Beat(startTime + gap * 40, "S"),
					new Beat(startTime + gap * 42, "D"),
					new Beat(startTime + gap * 44, "S"),
					new Beat(startTime + gap * 46, "D"),
					new Beat(startTime + gap * 48, "J"),
					new Beat(startTime + gap * 49, "K"),
					new Beat(startTime + gap * 50, "L"),
					new Beat(startTime + gap * 52, "F"),
					new Beat(startTime + gap * 52, "Space"),
					new Beat(startTime + gap * 52, "J"),
					new Beat(startTime + gap * 54, "S"),
					new Beat(startTime + gap * 56, "D"),
					new Beat(startTime + gap * 59, "F"),
					new Beat(startTime + gap * 59, "Space"),
					new Beat(startTime + gap * 59, "J"),
					new Beat(startTime + gap * 61, "L"),
					new Beat(startTime + gap * 63, "J"),
					new Beat(startTime + gap * 65, "F"),
					new Beat(startTime + gap * 65, "Space"),
					new Beat(startTime + gap * 65, "J"),
					new Beat(startTime + gap * 70, "S"),
					new Beat(startTime + gap * 72, "S"),
					new Beat(startTime + gap * 74, "S"),
					new Beat(startTime + gap * 78, "J"),
					new Beat(startTime + gap * 79, "K"),
					new Beat(startTime + gap * 80, "L"),
					new Beat(startTime + gap * 83, "Space"),
					new Beat(startTime + gap * 85, "S"),
					new Beat(startTime + gap * 87, "D"),
					new Beat(startTime + gap * 89, "S"),
					new Beat(startTime + gap * 91, "D"),
					new Beat(startTime + gap * 93, "F"),
					new Beat(startTime + gap * 96, "Space"),
					new Beat(startTime + gap * 98, "L"),
					new Beat(startTime + gap * 100, "Space"),
					new Beat(startTime + gap * 102, "S"),
					new Beat(startTime + gap * 104, "D"),
					new Beat(startTime + gap * 106, "Space"),
					new Beat(startTime + gap * 109, "Space"),
					new Beat(startTime + gap * 112, "Space"),
					new Beat(startTime + gap * 118, "Space")
			};
		} else if(titleName.equals("Grey_Morning_Piano_Ver") && difficulty.equals("Hard")) {
			int startTime = 4460 - Main.REACH_TIME * 1000;
			int gap = 125;
			beats = new Beat[] {
					new Beat(startTime, "S"),
					new Beat(startTime + gap * 15, "D"),
					new Beat(startTime + gap * 15, "S"),
					new Beat(startTime + gap * 16, "D"),
					new Beat(startTime + gap * 17, "S"),
					new Beat(startTime + gap * 18, "D"),
					new Beat(startTime + gap * 18, "S"),
					new Beat(startTime + gap * 19, "D"),
					new Beat(startTime + gap * 20, "J"),
					new Beat(startTime + gap * 21, "K"),
					new Beat(startTime + gap * 22, "J"),
					new Beat(startTime + gap * 24, "K"),
					new Beat(startTime + gap * 26, "J"),
					new Beat(startTime + gap * 28, "K"),
					new Beat(startTime + gap * 30, "J"),
					new Beat(startTime + gap * 32, "K"),
					new Beat(startTime + gap * 36, "S"),
					new Beat(startTime + gap * 38, "D"),
					new Beat(startTime + gap * 40, "S"),
					new Beat(startTime + gap * 42, "D"),
					new Beat(startTime + gap * 44, "S"),
					new Beat(startTime + gap * 46, "D"),
					new Beat(startTime + gap * 48, "J"),
					new Beat(startTime + gap * 49, "K"),
					new Beat(startTime + gap * 50, "L"),
					new Beat(startTime + gap * 52, "F"),
					new Beat(startTime + gap * 52, "Space"),
					new Beat(startTime + gap * 52, "J"),
					new Beat(startTime + gap * 54, "S"),
					new Beat(startTime + gap * 56, "D"),
					new Beat(startTime + gap * 59, "F"),
					new Beat(startTime + gap * 59, "Space"),
					new Beat(startTime + gap * 59, "J"),
					new Beat(startTime + gap * 61, "L"),
					new Beat(startTime + gap * 63, "J"),
					new Beat(startTime + gap * 65, "F"),
					new Beat(startTime + gap * 65, "Space"),
					new Beat(startTime + gap * 65, "J"),
					new Beat(startTime + gap * 70, "S"),
					new Beat(startTime + gap * 72, "S"),
					new Beat(startTime + gap * 74, "S"),
					new Beat(startTime + gap * 78, "J"),
					new Beat(startTime + gap * 79, "K"),
					new Beat(startTime + gap * 80, "L"),
					new Beat(startTime + gap * 83, "Space"),
					new Beat(startTime + gap * 85, "S"),
					new Beat(startTime + gap * 87, "D"),
					new Beat(startTime + gap * 89, "S"),
					new Beat(startTime + gap * 91, "D"),
					new Beat(startTime + gap * 93, "F"),
					new Beat(startTime + gap * 96, "Space"),
					new Beat(startTime + gap * 98, "L"),
					new Beat(startTime + gap * 100, "Space"),
					new Beat(startTime + gap * 102, "S"),
					new Beat(startTime + gap * 104, "D"),
					new Beat(startTime + gap * 106, "Space"),
					new Beat(startTime + gap * 109, "Space"),
					new Beat(startTime + gap * 112, "Space"),
					new Beat(startTime + gap * 118, "Space")
			};
		}
		else if(titleName.equals("In_My_Planet") && difficulty.equals("Easy")) {
			int startTime = 1000;
			beats = new Beat[] {
					new Beat(startTime, "Space"),
			};
		} else if(titleName.equals("In_My_Planet") && difficulty.equals("Hard")) {
			int startTime = 1000;
			beats = new Beat[] {
					new Beat(startTime, "Space"),
			};
		} else if(titleName.equals("Kairos") && difficulty.equals("Easy")) {
			int startTime = 1000;
			beats = new Beat[] {
					new Beat(startTime, "Space"),
			};
		} else if(titleName.equals("Kairos") && difficulty.equals("Hard")) {
			int startTime = 1000;
			beats = new Beat[] {
					new Beat(startTime, "Space"),
			};
		}
		int i = 0;
		
		// 배열이 초기화되는 시간에서 오는 시간 격차를 줄이기 위해 while문 위에서 호출. 초기화가 끝나고 나서 음악이 실행되게 처리
		gameMusic.start();
		while(i < beats.length && !isInterrupted()) {
			boolean dropped = false;
			// 비트가 떨어지는 시간대가 게임 뮤직 시간보다 작으면 한개의 노트를 선언해서 현재의 비트에서 노트 네임을 가져오고 start()로 노트가 떨어질 수 있도록 함
			if(beats[i].getTime() <= gameMusic.getTime()) {
				Note note = new Note(beats[i].getNoteName());
				note.start();
				noteList.add(note); // 노트를 하나씩 추가
				i++;
				dropped = true;
			}
			if(!dropped) {
				try {
					Thread.sleep(5);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	// 판정 함수
	public void judge(String input) {
		// 인덱스를 앞에서 부터 탐색하기 때문에 가장 먼저 떨어진 노트를 찾음. 해당하는 노트가 없으면 무시
		for(int i = 0; i < noteList.size(); i++) {
			Note note = noteList.get(i);
			if(input.equals(note.getNoteType())) {
				judgeEvent(note.judge());
				break; // 해당 노트를 찾자마자 break로 반복문을 탈출
			}
		}
	}

	// 판정에 대한 이미지를 넣어주는 함수
	public void judgeEvent(String judge) {
		if(!judge.equals("None")) {
			blueFlareImage = new ImageIcon(Main.class.getResource("../images/blueFlare.png")).getImage();
		}
		if(judge.equals("Miss")) {
			judgeImage  = new ImageIcon(Main.class.getResource("../images/judgeMiss.png")).getImage();
		} else if(judge.equals("Late")) {
			judgeImage  = new ImageIcon(Main.class.getResource("../images/judgeLate.png")).getImage();
		} else if(judge.equals("Good")) {
			judgeImage  = new ImageIcon(Main.class.getResource("../images/judgeGood.png")).getImage();
		} else if(judge.equals("Great")) {
			judgeImage  = new ImageIcon(Main.class.getResource("../images/judgeGreat.png")).getImage();
		} else if(judge.equals("Perpect")) {
			judgeImage  = new ImageIcon(Main.class.getResource("../images/judgePerpect.png")).getImage();
		} else if(judge.equals("Early")) {
			judgeImage  = new ImageIcon(Main.class.getResource("../images/judgeEarly.png")).getImage();
		}
	}

}
