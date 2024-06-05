// 1. 화면에 네모, 원 그릴 수 있어야 함
// 2. 프레임마다 코드실행 가능해야 함 (에니메이션을 위해)
// 3. collision check 할 수 있어야 함

var canvas = document.getElementById("canvas");
var ctx = canvas.getContext("2d");

canvas.width = window.innerWidth - 100;
canvas.height = window.innerHeight - 100;

// mainCharacter의 속성을 object(json)에 담아서 관리
var mainCharacter = {
  // mainCharacter 등장 좌표
  x: 10,
  y: 200,
  // mainCharacter의 폭과 높이
  width: 50,
  height: 50,
  draw() {
    ctx.fillStyle = "purple";
    ctx.fillRect(this.x, this.y, this.width, this.height);
  },
};
// mainCharacter.draw();

// enemy의 속성을 object(class)에 담아서 관리
class Enemy {
  constructor() {
    this.x = 500;
    this.y = 200;
    this.width = 50;
    this.height = 50;
  }
  draw() {
    ctx.fillStyle = "grey";
    ctx.fillRect(this.x, this.y, this.width, this.height);
  }
}
var enemy = new Enemy();
enemy.draw();

var timer = 0;
var enemyArr = [];
var jumpTimer = 0;
var animation;

// 에니메이션을 만들려면 1초에 60번 x++ 해줘야 함. 1초에 60번 코드 실행하기
function everyFrame() {
  animation = requestAnimationFrame(everyFrame);
  timer++;

  ctx.clearRect(0, 0, canvas.width, canvas.height);

  // 200 프레임마다 {적}을 하나씩 생성 (draw()로 그려줌)
  if (timer % 200 === 0) {
    // 적 생성 (실행횟수는 모니터 FPS에 따라 다름)
    var enemy = new Enemy();
    // 생성한 적을 array에 넣음
    enemyArr.push(enemy);
  }
  // array에 있던거 다 draw()
  enemyArr.forEach((a, i, o) => {
    // x좌표가 0미만이면 제거 (필요없어진 적 제거)
    if (a.x < 0) {
      o.splice(i, 1);
    }
    // 적 움직이기
    a.x--;

    // 충돌 체크를 여기서 하는 이유 : 주인공 vs. 모든 적 충돌체크를 해야하기 때문
    isCrash(mainCharacter, a);

    a.draw();
  });

  // 점프 기능
  if (isJump == true) {
    // 점프 속도
    mainCharacter.y--;
    jumpTimer++;
  }
  if (isJump == false) {
    // 최저 y높이를 정해두고 그 이상 ++ 금지
    if (mainCharacter.y < 200) {
      mainCharacter.y++;
    }
  }
  // 100 프레임이 지나면 점프를 멈춤
  if (jumpTimer > 100) {
    isJump = false;
    jumpTimer = 0;
  }

  mainCharacter.draw();
}
everyFrame();

// 충돌 체크
function isCrash(mainCharacter, enemy) {
  var x축차이 = enemy.x - (mainCharacter.x + mainCharacter.width);
  var y축차이 = enemy.y - (mainCharacter.y + mainCharacter.height);
  if (x축차이 < 0 && y축차이 < 0) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    cancelAnimationFrame(animation);
    alert("죽었습니다.");
  }
}

var isJump = false;

document.addEventListener("keydown", function (e) {
  if (e.code === "Space") {
    isJump = true;
  }
});
