package beat_game_09;

import java.awt.Color;
import java.awt.Cursor;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionAdapter;
import java.util.ArrayList;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class BeatGame extends JFrame {

	/**
	 * 더블 버퍼링 프로그램 기법. 현재 프로그램의 전체 화면 크기에 맞는 이미지를 매 순간마다 생성해서 원하는 컴포넌트만 화면에 출력하는 방식
	 * 버퍼에 이미지를 담아서 매 순간마다 이미지를 갱신해주기 때문에 게임에서는 빠질 수 없는 기술
	 */
	// 더블 버퍼링을 위해 전체 화면의 이미지를 담는 두 인스턴스를 생성
	private Image screenImage;
	private Graphics screenGraphic;

	private ImageIcon exitButtonEnteredImage = new ImageIcon(Main.class.getResource("../images/exitButtonEntered.png"));
	private ImageIcon exitButtonBasicImage = new ImageIcon(Main.class.getResource("../images/exitButtonBasic.png"));

	// 시작하기 버튼에 마우스가 올라갔을 때의 이미지
	private ImageIcon startButtonEnteredImage = new ImageIcon(
			Main.class.getResource("../images/startButtonEntered.png"));
	// 시작하기 버튼 기본 이미지
	private ImageIcon startButtonBasicImage = new ImageIcon(Main.class.getResource("../images/startButtonBasic.png"));
	// 종료하기 버튼에 마우스가 올라갔을 때의 이미지
	private ImageIcon quitButtonEnteredImage = new ImageIcon(Main.class.getResource("../images/quitButtonEntered.png"));
	// 종료하기 버튼 기본 이미지
	private ImageIcon quitButtonBasicImage = new ImageIcon(Main.class.getResource("../images/quitButtonBasic.png"));

	// 좌우 이동 버튼
	private ImageIcon leftButtonEnteredImage = new ImageIcon(Main.class.getResource("../images/leftButtonEntered.png"));
	private ImageIcon leftButtonBasicImage = new ImageIcon(Main.class.getResource("../images/leftButtonBasic.png"));
	private ImageIcon rightButtonEnteredImage = new ImageIcon(
			Main.class.getResource("../images/rightButtonEntered.png"));
	private ImageIcon rightButtonBasicImage = new ImageIcon(Main.class.getResource("../images/rightButtonBasic.png"));

	private ImageIcon easyButtonEnteredImage = new ImageIcon(Main.class.getResource("../images/easyButtonEntered.png"));
	private ImageIcon easyButtonBasicImage = new ImageIcon(Main.class.getResource("../images/easyButtonBasic.png"));
	private ImageIcon hardButtonEnteredImage = new ImageIcon(Main.class.getResource("../images/hardButtonEntered.png"));
	private ImageIcon hardButtonBasicImage = new ImageIcon(Main.class.getResource("../images/hardButtonBasic.png"));
	private ImageIcon backButtonEnteredImage = new ImageIcon(Main.class.getResource("../images/backButtonEntered.png"));
	private ImageIcon backButtonBasicImage = new ImageIcon(Main.class.getResource("../images/backButtonBasic.png"));

	// 이미지를 담을 수 있는 객체
	// 메인 클래스의 위치를 기반으로 해서 리소스 즉 background라는 이미지 파일을 가져온 뒤 그 이미지 인스턴스를
	// background라는 변수에 초기화를 시키겠다는 뜻
	private Image background = new ImageIcon(Main.class.getResource("../images/introBackground(Title).jpg")).getImage();
	// menuBar라는 JLabel 객체가 만들어지고 객체 안에 해당 이미지가 들어감
	private JLabel menuBar = new JLabel(new ImageIcon(Main.class.getResource("../images/menuBar.png")));

	private JButton exitButton = new JButton(exitButtonBasicImage);
	private JButton startButton = new JButton(startButtonBasicImage);
	private JButton quitButton = new JButton(quitButtonBasicImage);
	private JButton leftButton = new JButton(leftButtonBasicImage);
	private JButton rightButton = new JButton(rightButtonBasicImage);
	private JButton easyButton = new JButton(easyButtonBasicImage);
	private JButton hardButton = new JButton(hardButtonBasicImage);
	private JButton backButton = new JButton(backButtonBasicImage);

	// 마우스 X와 Y의 좌표
	private int mouseX, mouseY;

	// 시작화면에서 메인화면으로 이동하면 isMainScreen = true;
	private boolean isMainScreen = false;

	ArrayList<Track> trackList = new ArrayList<Track>();

	private Image titleImage;
	// 현재 선택된 곡의 이미지
	private Image selectedImage;
	// 시작 화면에서 음악이 무한 반복 재생이 되도록 만들어 줌
	// 두번째 매개변수가 true이므로 음악은 직접 종료를 하기 전까지는 반복 재생
	private Music introMusic = new Music("Summer_Night.mp3", true);
	private Music selectedMusic;
	private int nowSelected = 0;

	public BeatGame() {
		setUndecorated(true); // 기본 메뉴바 숨김
		setTitle("Beat Game");
		setSize(Main.SCREEN_WIDTH, Main.SCREEN_HEIGHT);
		setResizable(false); // 창 크기 변경 불가
		setLocationRelativeTo(null); // 화면을 정중앙에 뜨게 함
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // 창을 닫으면 프로그램이 종료
		setVisible(true); // 화면이 정상적으로 출력되게 함
		setBackground(new Color(0, 0, 0, 0)); // paintComponents를 했을 때 배경이 전부 흰색으로 변경
		setLayout(null); // 위치 고정

		introMusic.start();

		trackList.add(new Track("Grey_Morning_Title.png", "Grey_Morning_Piano_Ver_Image.png", "mainBackground.jpg",
				"Grey_Morning_Piano_Ver_Selected.mp3", "Grey_Morning_Piano_Ver.mp3"));
		trackList.add(new Track("In_My_Planet_Title.png", "In_My_Planet_Image.png", "mainBackground.jpg",
				"In_My_Planet_Selected.mp3", "In_My_Planet.mp3"));
		trackList.add(new Track("Kairos_Title.png", "Kairos_Image.png", "mainBackground.jpg", "Kairos_Selected.mp3",
				"Kairos.mp3"));

		exitButton.setBounds(1245, 0, 30, 30); // menuBar 가장 오른쪽에 위치
		// 원하는 형태의 exitButton을 만들어 줌
		exitButton.setBorderPainted(false);
		exitButton.setContentAreaFilled(false);
		exitButton.setFocusPainted(false);
		// 마우스가 해당 버튼 위에 올라갔을 때의 처리
		exitButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseEntered(MouseEvent e) {
				// 버튼에 마우스가 올라갔을 때 exitButtonEnteredImage 이미지로 바꿔줌
				exitButton.setIcon(exitButtonEnteredImage);
				// 버튼에 마우스가 올라갔을 때 커서를 손모양으로 바꿔줌
				exitButton.setCursor(new Cursor(Cursor.HAND_CURSOR));
				// 버튼에 마우스가 올라갔을 때 효과음. false는 음악을 한번만 실행한다는 뜻
				Music buttonEnteredMusic = new Music("buttonEnteredMusic.mp3", false);
				buttonEnteredMusic.start();
			}

			@Override
			// 해당 버튼에서 마우스가 내려왔을 때의 처리
			public void mouseExited(MouseEvent e) {
				// 버튼에서 마우스가 내려오면 exitButtonBasicImage 이미지로 바꿔줌
				exitButton.setIcon(exitButtonBasicImage);
				// 버튼에서 마우스가 내려오면 커서를 원래 상태로 바꿔줌
				exitButton.setCursor(new Cursor(Cursor.DEFAULT_CURSOR));
			}

			@Override
			public void mousePressed(MouseEvent e) {
				// 버튼을 마우스로 클릭했을 때 효과음. false는 음악을 한번만 실행한다는 뜻
				Music buttonPressedMusic = new Music("buttonPressedMusic.mp3", false);
				buttonPressedMusic.start();
				// 소리가 나오고 0.5초 후에 종료
				try {
					Thread.sleep(500);
				} catch (InterruptedException e1) {
					e1.printStackTrace();
				}
				// 마우스로 클릭했을 때 해당 프로그램을 종료
				System.exit(0);
			}
		});
		// JFrame에 exitButton이 추가
		add(exitButton);

		startButton.setBounds(40, 200, 400, 100);
		startButton.setBorderPainted(false);
		startButton.setContentAreaFilled(false);
		startButton.setFocusPainted(false);
		startButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseEntered(MouseEvent e) {
				startButton.setIcon(startButtonEnteredImage);
				startButton.setCursor(new Cursor(Cursor.HAND_CURSOR));
				Music buttonEnteredMusic = new Music("buttonEnteredMusic.mp3", false);
				buttonEnteredMusic.start();
			}

			@Override
			public void mouseExited(MouseEvent e) {
				startButton.setIcon(startButtonBasicImage);
				startButton.setCursor(new Cursor(Cursor.DEFAULT_CURSOR));
			}

			@Override
			// 시작 화면 버튼을 눌렀을 때 메인화면으로 이동
			public void mousePressed(MouseEvent e) {
				Music buttonPressedMusic = new Music("buttonPressedMusic.mp3", false);
				buttonPressedMusic.start();
				enterMain();
			}
		});
		add(startButton);

		quitButton.setBounds(40, 330, 400, 100);
		quitButton.setBorderPainted(false);
		quitButton.setContentAreaFilled(false);
		quitButton.setFocusPainted(false);
		quitButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseEntered(MouseEvent e) {
				quitButton.setIcon(quitButtonEnteredImage);
				quitButton.setCursor(new Cursor(Cursor.HAND_CURSOR));
				Music buttonEnteredMusic = new Music("buttonEnteredMusic.mp3", false);
				buttonEnteredMusic.start();
			}

			@Override
			public void mouseExited(MouseEvent e) {
				quitButton.setIcon(quitButtonBasicImage);
				quitButton.setCursor(new Cursor(Cursor.DEFAULT_CURSOR));
			}

			@Override
			public void mousePressed(MouseEvent e) {
				Music buttonPressedMusic = new Music("buttonPressedMusic.mp3", false);
				buttonPressedMusic.start();
				// 소리가 나오고 0.5초 후에 종료
				try {
					Thread.sleep(500);
				} catch (InterruptedException e1) {
					e1.printStackTrace();
				}
				// 마우스로 클릭했을 때 해당 프로그램을 종료
				System.exit(0);
			}
		});
		add(quitButton);

		leftButton.setVisible(false);
		leftButton.setBounds(140, 310, 60, 60);
		leftButton.setBorderPainted(false);
		leftButton.setContentAreaFilled(false);
		leftButton.setFocusPainted(false);
		leftButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseEntered(MouseEvent e) {
				leftButton.setIcon(leftButtonEnteredImage);
				leftButton.setCursor(new Cursor(Cursor.HAND_CURSOR));
				Music buttonEnteredMusic = new Music("buttonEnteredMusic.mp3", false);
				buttonEnteredMusic.start();
			}

			@Override
			public void mouseExited(MouseEvent e) {
				leftButton.setIcon(leftButtonBasicImage);
				leftButton.setCursor(new Cursor(Cursor.DEFAULT_CURSOR));
			}

			@Override
			public void mousePressed(MouseEvent e) {
				Music buttonPressedMusic = new Music("buttonPressedMusic.mp3", false);
				buttonPressedMusic.start();
				// 왼쪽 버튼 이벤트
				selectLeft();
			}
		});
		add(leftButton);

		rightButton.setVisible(false);
		rightButton.setBounds(1080, 310, 60, 60);
		rightButton.setBorderPainted(false);
		rightButton.setContentAreaFilled(false);
		rightButton.setFocusPainted(false);
		rightButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseEntered(MouseEvent e) {
				rightButton.setIcon(rightButtonEnteredImage);
				rightButton.setCursor(new Cursor(Cursor.HAND_CURSOR));
				Music buttonEnteredMusic = new Music("buttonEnteredMusic.mp3", false);
				buttonEnteredMusic.start();
			}

			@Override
			public void mouseExited(MouseEvent e) {
				rightButton.setIcon(rightButtonBasicImage);
				rightButton.setCursor(new Cursor(Cursor.DEFAULT_CURSOR));
			}

			@Override
			public void mousePressed(MouseEvent e) {
				Music buttonPressedMusic = new Music("buttonPressedMusic.mp3", false);
				buttonPressedMusic.start();
				// 오른쪽 버튼 이벤트
				selectRight();
			}
		});
		add(rightButton);

		easyButton.setVisible(false);
		easyButton.setBounds(375, 510, 250, 60);
		easyButton.setBorderPainted(false);
		easyButton.setContentAreaFilled(false);
		easyButton.setFocusPainted(false);
		easyButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseEntered(MouseEvent e) {
				easyButton.setIcon(easyButtonEnteredImage);
				easyButton.setCursor(new Cursor(Cursor.HAND_CURSOR));
				Music buttonEnteredMusic = new Music("buttonEnteredMusic.mp3", false);
				buttonEnteredMusic.start();
			}

			@Override
			public void mouseExited(MouseEvent e) {
				easyButton.setIcon(easyButtonBasicImage);
				easyButton.setCursor(new Cursor(Cursor.DEFAULT_CURSOR));
			}

			@Override
			public void mousePressed(MouseEvent e) {
				Music buttonPressedMusic = new Music("buttonPressedMusic.mp3", false);
				buttonPressedMusic.start();
				// 난이도 easy 이벤트
				gameStart(nowSelected, "easy");
			}
		});
		add(easyButton);

		hardButton.setVisible(false);
		hardButton.setBounds(655, 510, 250, 60);
		hardButton.setBorderPainted(false);
		hardButton.setContentAreaFilled(false);
		hardButton.setFocusPainted(false);
		hardButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseEntered(MouseEvent e) {
				hardButton.setIcon(hardButtonEnteredImage);
				hardButton.setCursor(new Cursor(Cursor.HAND_CURSOR));
				Music buttonEnteredMusic = new Music("buttonEnteredMusic.mp3", false);
				buttonEnteredMusic.start();
			}

			@Override
			public void mouseExited(MouseEvent e) {
				hardButton.setIcon(hardButtonBasicImage);
				hardButton.setCursor(new Cursor(Cursor.DEFAULT_CURSOR));
			}

			@Override
			public void mousePressed(MouseEvent e) {
				Music buttonPressedMusic = new Music("buttonPressedMusic.mp3", false);
				buttonPressedMusic.start();
				// 난이도 hard 이벤트
				gameStart(nowSelected, "hard");
			}
		});
		add(hardButton);

		backButton.setVisible(false);
		backButton.setBounds(20, 50, 60, 60);
		backButton.setBorderPainted(false);
		backButton.setContentAreaFilled(false);
		backButton.setFocusPainted(false);
		backButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseEntered(MouseEvent e) {
				backButton.setIcon(backButtonEnteredImage);
				backButton.setCursor(new Cursor(Cursor.HAND_CURSOR));
				Music buttonEnteredMusic = new Music("buttonEnteredMusic.mp3", false);
				buttonEnteredMusic.start();
			}

			@Override
			public void mouseExited(MouseEvent e) {
				backButton.setIcon(backButtonBasicImage);
				backButton.setCursor(new Cursor(Cursor.DEFAULT_CURSOR));
			}

			@Override
			public void mousePressed(MouseEvent e) {
				Music buttonPressedMusic = new Music("buttonPressedMusic.mp3", false);
				buttonPressedMusic.start();
				// 메인 화면으로 돌아가는 이벤트
				backMain();
			}
		});
		add(backButton);

		menuBar.setBounds(0, 0, 1280, 30); // 위치와 크기 저장
		// 마우스로 해당 버튼을 눌렀을 때의 처리
		menuBar.addMouseListener(new MouseAdapter() {
			@Override
			// 실제로 이벤트가 발생했을 때 X와 Y의 좌표를 가져옴
			public void mousePressed(MouseEvent e) {
				mouseX = e.getX();
				mouseY = e.getY();
			}
		});

		menuBar.addMouseMotionListener(new MouseMotionAdapter() {
			@Override
			// 드래그 이벤트가 발생했을 때의 처리
			public void mouseDragged(MouseEvent e) {
				// 드래그 할 때마다 X와 Y의 좌표를 가져와서 자동으로 창 위치를 바꿔줌
				int x = e.getXOnScreen();
				int y = e.getYOnScreen();
				setLocation(x - mouseX, y - mouseY);
			}
		});
		// JFrame에 menuBar가 추가
		add(menuBar);
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
		// 전체 이미지 즉 스크린 이미지에 그려줄 수 있도록 함. background를 0,0 위치에 그려줌
		g.drawImage(background, 0, 0, null);
		// 시작 화면이 아니라 메인 화면일 때 selectedImage를 보여줌
		if (isMainScreen) {
			g.drawImage(selectedImage, 340, 130, null);
			g.drawImage(titleImage, 340, 110, null);
		}
		// JLabel 이미지를 그려줌
		// 메인 프레임에 추가된 요소에 대한 것들을 보여줌 add()
		paintComponents(g);
		// paint()는 JFrame을 상속받은 GUI 게임에서 가장 첫번째로 화면을 그려주는 메서드
		// repaint()는 다시 paint() 메서드를 불러옴. 전체 화면 이미지를 프로그램이 중료되는 시점까지 반복해서 그려줌
		this.repaint();
	}

	public void selectTrack(int nowSelected) {
		if (selectedMusic != null)
			selectedMusic.close();
		titleImage = new ImageIcon(Main.class.getResource("../images/" + trackList.get(nowSelected).getTitleImage()))
				.getImage();
		selectedImage = new ImageIcon(Main.class.getResource("../images/" + trackList.get(nowSelected).getStartImage()))
				.getImage();
		selectedMusic = new Music(trackList.get(nowSelected).getStartMusic(), true);
		selectedMusic.start();
	}

	public void selectLeft() {
		if (nowSelected == 0)
			nowSelected = trackList.size() - 1;
		else
			nowSelected--;
		selectTrack(nowSelected);

	}

	public void selectRight() {
		if (nowSelected == trackList.size() - 1)
			nowSelected = 0;
		else
			nowSelected++;
		selectTrack(nowSelected);

	}

	public void gameStart(int nowSelected, String difficulty) {
		if (selectedMusic != null)
			selectedMusic.close();
		isMainScreen = false;
		leftButton.setVisible(false);
		rightButton.setVisible(false);
		easyButton.setVisible(false);
		hardButton.setVisible(false);
		background = new ImageIcon(Main.class.getResource("../images/" + trackList.get(nowSelected).getGameImage()))
				.getImage();
		backButton.setVisible(true);
	}

	public void backMain() {
		isMainScreen = true;
		leftButton.setVisible(true);
		rightButton.setVisible(true);
		easyButton.setVisible(true);
		hardButton.setVisible(true);
		background = new ImageIcon(Main.class.getResource("../images/mainBackground.jpg")).getImage();
		backButton.setVisible(false);
		selectTrack(nowSelected);
	}

	public void enterMain() {
		// 게임 시작 이벤트
		startButton.setVisible(false);
		quitButton.setVisible(false);
		background = new ImageIcon(Main.class.getResource("../images/mainBackground.jpg")).getImage();
		// 메인 화면에서는 좌우 이동 버튼이 보이도록 setVisible을 true로 설정
		isMainScreen = true;
		leftButton.setVisible(true);
		rightButton.setVisible(true);
		easyButton.setVisible(true);
		hardButton.setVisible(true);
		introMusic.close();
		selectTrack(0);
	}

}
