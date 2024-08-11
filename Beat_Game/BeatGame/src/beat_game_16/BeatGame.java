package beat_game_16;

import java.awt.Color;
import java.awt.Cursor;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.event.KeyListener;
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

	// 왼쪽 이동 버튼에 마우스가 올라갔을 때의 이미지
	private ImageIcon leftButtonEnteredImage = new ImageIcon(Main.class.getResource("../images/leftButtonEntered.png"));
	// 왼쪽 이동 버튼 기본 이미지
	private ImageIcon leftButtonBasicImage = new ImageIcon(Main.class.getResource("../images/leftButtonBasic.png"));
	// 오른쪽 이동 버튼에 마우스가 올라갔을 때의 이미지
	private ImageIcon rightButtonEnteredImage = new ImageIcon(
			Main.class.getResource("../images/rightButtonEntered.png"));
	// 오른쪽 이동 버튼 기본 이미지
	private ImageIcon rightButtonBasicImage = new ImageIcon(Main.class.getResource("../images/rightButtonBasic.png"));

	// 난이도 easy 버튼에 마우스가 올라갔을 때의 이미지
	private ImageIcon easyButtonEnteredImage = new ImageIcon(Main.class.getResource("../images/easyButtonEntered.png"));
	// 난이도 easy 버튼 기본 이미지
	private ImageIcon easyButtonBasicImage = new ImageIcon(Main.class.getResource("../images/easyButtonBasic.png"));
	// 난이도 hard 버튼에 마우스가 올라갔을 때의 이미지
	private ImageIcon hardButtonEnteredImage = new ImageIcon(Main.class.getResource("../images/hardButtonEntered.png"));
	// 난이도 hard 버튼 기본 이미지
	private ImageIcon hardButtonBasicImage = new ImageIcon(Main.class.getResource("../images/hardButtonBasic.png"));
	
	// 뒤로가기 버튼에 마우스가 올라갔을 때의 이미지
	private ImageIcon backButtonEnteredImage = new ImageIcon(Main.class.getResource("../images/backButtonEntered.png"));
	// 뒤로가기 버튼 기본 이미지
	private ImageIcon backButtonBasicImage = new ImageIcon(Main.class.getResource("../images/backButtonBasic.png"));

	// 메인 클래스의 위치를 기반으로 해서 리소스 즉 background라는 이미지 파일을 가져온 뒤 그 이미지 인스턴스를 background라는 변수에 초기화를 시키겠다는 뜻
	private Image background = new ImageIcon(Main.class.getResource("../images/introBackground(Title).jpg")).getImage();
	// menuBar라는 JLabel 객체가 만들어지고 객체 안에 해당 이미지가 들어감
	private JLabel menuBar = new JLabel(new ImageIcon(Main.class.getResource("../images/menuBar.png")));

	// 버튼 초기화
	private JButton exitButton = new JButton(exitButtonBasicImage);
	private JButton startButton = new JButton(startButtonBasicImage);
	private JButton quitButton = new JButton(quitButtonBasicImage);
	private JButton leftButton = new JButton(leftButtonBasicImage);
	private JButton rightButton = new JButton(rightButtonBasicImage);
	private JButton easyButton = new JButton(easyButtonBasicImage);
	private JButton hardButton = new JButton(hardButtonBasicImage);
	private JButton backButton = new JButton(backButtonBasicImage);

	// 현재 프로그램 내에서 마우스 X와 Y의 좌표
	private int mouseX, mouseY;

	// 시작화면에서 메인화면으로 이동하면 isMainScreen = true;
	private boolean isMainScreen = false;
	private boolean isGameScreen = false;

	// 각각의 곡 트랙을 담을 수 있는 리스트
	ArrayList<Track> trackList = new ArrayList<Track>();

	private Image titleImage;
	private Image selectedImage;
	// 시작 화면에서 음악이 무한 반복 재생이 되도록 만들어 줌. 두번째 매개변수가 true이므로 음악은 직접 종료를 하기 전까지는 반복 재생
	private Music introMusic = new Music("Summer_Night.mp3", true);
	// 선택한 하이라이트 곡의 변수
	private Music selectedMusic;
	// 현재 선택된 트랙의 번호. 인덱스라 0으로 시작
	private int nowSelected = 0;

	// 프로젝트 전체에서 사용하기 위해 변수를 static으로 선언
	public static Game game;

	public BeatGame() {

		// Track(String titleImage, String startImage, String gameImage, String startMusic, String gameMusic, String titleName)
		// 각각의 파일 경로를 넣어줌. add()로 ArrayList에 추가함. 위치를 바꾸면 곡의 인덱스가 바뀜
		trackList.add(new Track("Grey_Morning_Title.png", "Grey_Morning_Piano_Ver_Image.png", "mainBackground.jpg",
				"Grey_Morning_Piano_Ver_Selected.mp3", "Grey_Morning_Piano_Ver.mp3", "Grey_Morning_Piano_Ver"));
		trackList.add(new Track("In_My_Planet_Title.png", "In_My_Planet_Image.png", "mainBackground.jpg",
				"In_My_Planet_Selected.mp3", "In_My_Planet.mp3", "In_My_Planet"));
		trackList.add(new Track("Kairos_Title.png", "Kairos_Image.png", "mainBackground.jpg", "Kairos_Selected.mp3",
				"Kairos.mp3", "Kairos"));

		setUndecorated(true); // 기본 메뉴바 숨김
		setTitle("Beat Game"); // title 이름 설정
		setSize(Main.SCREEN_WIDTH, Main.SCREEN_HEIGHT); // 1280 * 720
		setResizable(false); // 창 크기 변경 불가
		setLocationRelativeTo(null); // 화면을 정중앙에 뜨게 함
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // 창을 닫으면 프로그램이 종료
		setVisible(true); // 화면이 정상적으로 출력되게 함
		setBackground(new Color(0, 0, 0, 0)); // paintComponents를 했을 때 배경이 전부 흰색으로 변경
		setLayout(null); // 위치 고정

		addKeyListener(new beat_game_16.KeyListener());

		introMusic.start();

		// 원하는 형태의 exitButton을 만들어 줌
		exitButton.setBounds(1245, 0, 30, 30); // menuBar 가장 오른쪽에 위치
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

			// 해당 버튼에서 마우스가 내려왔을 때의 처리
			@Override
			public void mouseExited(MouseEvent e) {
				// 버튼에서 마우스가 내려오면 exitButtonBasicImage 이미지로 바꿔줌
				exitButton.setIcon(exitButtonBasicImage);
				// 버튼에서 마우스가 내려오면 커서를 원래 상태로 바꿔줌
				exitButton.setCursor(new Cursor(Cursor.DEFAULT_CURSOR));
			}

			// 버튼을 클릭했을 때의 처리
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

		// 게임 start 버튼
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

		// 게임 quit 버튼
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

		// 왼쪽 이동 버튼
		leftButton.setVisible(false); // 처음에는 보이지 않게 초기화
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

		// 오른쪽 이동 버튼
		rightButton.setVisible(false); // 처음에는 보이지 않게 초기화
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

		// 난이도 easy 버튼
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
				gameStart(nowSelected, "Easy");
			}
		});
		add(easyButton);

		// 난이도 hard 버튼
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
				gameStart(nowSelected, "Hard");
			}
		});
		add(hardButton);

		// 뒤로가기 버튼
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

		menuBar.setBounds(0, 0, 1280, 30); // menuBardml 위치와 크기 저장
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
				// JFrame의 위치를 변경
				setLocation(x - mouseX, y - mouseY);
			}
		});
		// JFrame에 menuBar가 추가
		add(menuBar);
	}

	// paint()는 JFrame을 상속받은 GUI 게임에서 가장 첫번째로 화면을 그려주는 메서드
	public void paint(Graphics g) {
		// 1280 * 720 만큼의 이미지를 만들어서 screenImage에 넣어줌
		screenImage = createImage(Main.SCREEN_WIDTH, Main.SCREEN_HEIGHT);
		// 이 스크린 이미지를 이용해서 그래픽 객체를 가져옴
		screenGraphic = screenImage.getGraphics();
		// screenDraw() 함수를 사용하여 그림을 그려줌
		screenDraw((Graphics2D) screenGraphic);
		// 스크린 이미지를 0,0 위치에 그려줌
		g.drawImage(screenImage, 0, 0, null);
	}

	// screenDraw 메서드
	public void screenDraw(Graphics2D g) {
		// g.drawImage는 paintComponents처럼 add가 된게 아니라 단순히 이미지를 화면에 출력
		// 이미지나 역동적인 움직임을 보여주는 이미지는 drawImage로 그려주는 것이 일반적
		g.drawImage(background, 0, 0, null); // background를 0,0 위치에 그려줌
		// 시작 버튼을 누르고 메인 화면으로 넘어왔을 때 각각의 곡 정보를 출력
		if (isMainScreen) {
			g.drawImage(selectedImage, 340, 130, null);
			g.drawImage(titleImage, 340, 110, null);
		}
		if (isGameScreen) {
			game.screenDraw(g);
		}
		// JLabel을 JFrame에 추가
		// 메인 프레임에 추가된 요소에 대한 것들을 보여줌 add()
		paintComponents(g);

		try {
			Thread.sleep(5);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// repaint()는 다시 paint() 메서드를 불러옴. 전체 화면 이미지를 프로그램이 중료되는 시점까지 반복해서 그려줌
		this.repaint();
	}

	// 선택된 곡의 번호를 int로 넣어줘서 해당 곡이 선택되었음을 알려줌
	public void selectTrack(int nowSelected) {
		// 어떤 곡이 실행되고 있다면 종료 시켜줌
		if (selectedMusic != null)
			selectedMusic.close();
		// 선택된 곡의 정보를 가져옴
		titleImage = new ImageIcon(Main.class.getResource("../images/" + trackList.get(nowSelected).getTitleImage()))
				.getImage();
		selectedImage = new ImageIcon(Main.class.getResource("../images/" + trackList.get(nowSelected).getStartImage()))
				.getImage();
		selectedMusic = new Music(trackList.get(nowSelected).getStartMusic(), true);
		selectedMusic.start();
	}

	public void selectLeft() {
		// 현재 선택된 곡이 첫번째 곡(0)일 경우 마지막 곡으로 변경
		if (nowSelected == 0)
			nowSelected = trackList.size() - 1;
		else
			// 첫번째 곡이 아닐 경우 왼쪽으로 이동
			nowSelected--;
		selectTrack(nowSelected);

	}

	public void selectRight() {
		// 현재 선택된 곡이 마지막 곡(trackList.size() - 1)일 경우 첫번째 곡으로 변경
		if (nowSelected == trackList.size() - 1)
			nowSelected = 0;
		else
			// 마지막 곡이 아닐 경우 오른쪽으로 이동
			nowSelected++;
		selectTrack(nowSelected);

	}

	// 선택된 현재 곡과 난이도를 매개변수로 설정
	public void gameStart(int nowSelected, String difficulty) {
		// 어떤 곡이 실행중이면 재생중인 곡을 close()해주고 메인 화면이 아니라는 뜻으로 isMainScreen = false 값을 넣어줌
		if (selectedMusic != null)
			selectedMusic.close();
		isMainScreen = false;
		// 메인 화면이 아니기 때문에 버튼을 보이지 않게 처리
		leftButton.setVisible(false);
		rightButton.setVisible(false);
		easyButton.setVisible(false);
		hardButton.setVisible(false);
		// 선택한 곡에 대한 배경 이미지
		background = new ImageIcon(Main.class.getResource("../images/" + trackList.get(nowSelected).getGameImage()))
				.getImage();
		// 원하는 게임에 들어갔을 때 뒤로가기 버튼을 보이게 처리
		backButton.setVisible(true);
		isGameScreen = true;
		game = new Game(trackList.get(nowSelected).getTitleName(), difficulty,
				trackList.get(nowSelected).getGameMusic());
		game.start();
		// 키보드 포커스를 맞춤
		setFocusable(true);
	}

	// 메인으로 돌아가기 위한 메서드
	public void backMain() {
		isMainScreen = true;
		// 메인 화면이기 때문에 버튼을 보이게 처리
		leftButton.setVisible(true);
		rightButton.setVisible(true);
		easyButton.setVisible(true);
		hardButton.setVisible(true);
		// 곡에 대한 배경화면
		background = new ImageIcon(Main.class.getResource("../images/mainBackground.jpg")).getImage();
		backButton.setVisible(false);
		selectTrack(nowSelected);
		isGameScreen = false;
		// 현재 실행되고 있는 게임을 종료하고 음악을 종료해서 다른 게임을 선택할 수 있게 해줌
		game.close();
	}

	// 메인에 들어갔을 때 메서드
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
