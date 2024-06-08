window.onload = () => {
  makeEvent();
  makeTemplate();
};

const nowRowIndex = {
  x: 0
};

const nowCursorIndex = {
  x: -1,
  y: 0
}

const answerList = ["APPLE", "angel", "album", "angry", "bacon", "basic", "bagle", "bench", "blind", "bread", "camel",
                    "cliff", "click", "clear", "clock", "cream", "heart", "build", "check", "chily", "cover", "dream",
                    "candy", "chess", "exist", "floor", "glass", "class", "green", "house", "human", "issue", "learn",
                    "leave", "level", "media", "radio", "night", "music", "owner", "peace", "phone", "place", "price",
                    "range", "right", "score", "shoot", "smile", "sound", "story", "trade", "watch", "water", "world",
                    "lemon"];

const answer = answerList[Math.floor(Math.random() * answerList.length)].toUpperCase();

const makeEvent = () => {
  document.getElementById("showRuleBtn").addEventListener("mouseover", (event) => {
      document.getElementById("wordle_rule").style.display = "block";
    });
    document.getElementById("showRuleBtn").addEventListener("mouseout", (event) => {
      document.getElementById("wordle_rule").style.display = "none";
    });
  document.body.addEventListener("keydown", (event) => {
    stringToAscii(event.key);
    });
  const keybordBtn = document.getElementsByClassName("keybordBtn");
  for(let i = 0; i < keybordBtn.length; i++) {
    keybordBtn[i].addEventListener("click", (event) => {
      const pushKey = event.target.value;
      if(pushKey === "←") {
        stringToAscii("Backspace");
      } else {
        stringToAscii(pushKey);
      }
    })
  }
};

/**
 * 
 * @param {string} str 
 */
const stringToAscii = (str) => {
  const getAscii = str.charCodeAt(0);
  if(str.length === 1) {
    if(nowCursorIndex.y <= 4) {
      if(getAscii >= 65 && getAscii <= 90) {
        inputValue(str);
      } else if(getAscii >= 97 && getAscii <= 122) {
        const upperStr = str.toUpperCase();
        inputValue(upperStr);
      }
    }
  } else if (str === "Enter" && nowCursorIndex.y === 5 && document.getElementById("inputBtn_" + nowCursorIndex.x + "_4").value !== "") {
    const answerFlag = isAnswer();
    if(answerFlag === true) {
      alert("정답입니다!");
    }
    if(nowRowIndex.x < 7) {
      makeTemplate();
    } else if(nowRowIndex.x === 7 && answerFlag === false) {
      alert("아쉽네요. 정답은 '" + answer + "' 입니다.")
    }
  } else if (str === "Backspace" && nowCursorIndex.y !== 0) {
    const removeTarget = document.getElementById("inputBtn_" + nowCursorIndex.x + "_" + (nowCursorIndex.y - 1));
    removeTarget.value = "";
    nowCursorIndex.y--;
  }
}

const makeTemplate = () => {
  const template = `<div>
  <input type="text" class="inputBtn" id="inputBtn_${nowRowIndex.x}_0" readonly />
  <input type="text" class="inputBtn" id="inputBtn_${nowRowIndex.x}_1" readonly />
  <input type="text" class="inputBtn" id="inputBtn_${nowRowIndex.x}_2" readonly />
  <input type="text" class="inputBtn" id="inputBtn_${nowRowIndex.x}_3" readonly />
  <input type="text" class="inputBtn" id="inputBtn_${nowRowIndex.x}_4" readonly />
  </div><br>`
  nowRowIndex.x++;
  nowCursorIndex.x++;
  nowCursorIndex.y = 0;
  document.querySelector("#inputArea").insertAdjacentHTML("beforeend", template);
}

const inputValue = (key) => {
  const inputXY = document.getElementById("inputBtn_" + nowCursorIndex.x + "_" + nowCursorIndex.y);
  inputXY.value = key;
  nowCursorIndex.y++;
}

const isAnswer = () => {
  let inputStr = "";
  const inputAnswerList = [];
  for(let i = 0; i < 5; i++) {
    const inputAnswer = document.getElementById("inputBtn_" + nowCursorIndex.x + "_" + i);
    inputAnswerList.push(inputAnswer);
    inputStr += inputAnswer.value;
  }
  for(let i = 0; i < 5; i++) {
    if(answer.charAt(i) === inputStr.charAt(i)) {
      inputAnswerList[i].style.background = "rgb(102, 195, 102)";
    } else if(answer.includes(inputStr.charAt(i))) {
      inputAnswerList[i].style.background = "rgb(232, 232, 124)";
    } else {
      inputAnswerList[i].style.background = "rgb(199, 187, 187)";
    }
  }
  return answer === inputStr;
}