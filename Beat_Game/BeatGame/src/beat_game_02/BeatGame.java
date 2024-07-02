package beat_game_02;

import java.awt.Graphics;
import java.awt.Image;

import javax.swing.ImageIcon;
import javax.swing.JFrame;

public class BeatGame extends JFrame {

	/**
	 * 더블 버퍼링 프로그램 기법. 현재 프로그램의 전체 화면 크기에 맞는 이미지를 매 순간마다 생성해서 원하는 컴포넌트만 화면에 출력하는 방식
	 * 버퍼에 이미지를 담아서 매 순간마다 이미지를 갱신해주기 때문에 게임에서는 빠질 수 없는 기술
	 */
	// 더블 버퍼링을 위해 전체 화면의 이미지를 담는 두 인스턴스를 생성
	private Image screenImage;
	private Graphics screenGraphic;
	
	//이미지를 담을 수 있는 객체
	private Image introBackground;

	public BeatGame() {
		setTitle("Beat Game");
		setSize(Main.SCREEN_WIDTH, Main.SCREEN_HEIGHT);
		setResizable(false); // 창 크기 변경 불가
		setLocationRelativeTo(null); // 화면을 정중앙에 뜨게 함
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // 창을 닫으면 프로그램이 종료
		setVisible(true); // 화면이 정상적으로 출력되게 함
		
		// 메인 클래스의 위치를 기반으로 해서 리소스 즉 introBackground라는 이미지 파일을 가져온 뒤 그 이미지 인스턴스를 introBackground라는 변수에 초기화를 시키겠다는 뜻
		introBackground = new ImageIcon(Main.class.getResource("../images/introBackground(Title).jpg")).getImage();
	}
	
	// 
	public void paint(Graphics g) {
		// 1280 * 720 만큼의 이미지를 만들어서 screenImage에 넣어줌
		screenImage = createImage(Main.SCREEN_WIDTH, Main.SCREEN_HEIGHT);
		// 이 스크린 이미지를 이용해서 그래픽 객체를 가져옴
		screenGraphic = screenImage.getGraphics();
		// 
		screenDraw(screenGraphic);
		// 스크린 이미지를 0,0 위치에 그려줌
		g.drawImage(screenImage, 0, 0, null);
	}
	
	public void screenDraw(Graphics g) {
		// 전체 이미지 즉 스크린 이미지에 그려줄 수 있도록 함. introBackground를 0,0 위치에 그려줌
		g.drawImage(introBackground, 0, 0, null);
		// paint()는 JFrame을 상속받은 GUI 게임에서 가장 첫번째로 화면을 그려주는 메서드
		// repaint()는 다시 paint() 메서드를 불러옴. 전체 화면 이미지를 프로그램이 중료되는 시점까지 반복해서 그려줌
		this.repaint();
	}

}
