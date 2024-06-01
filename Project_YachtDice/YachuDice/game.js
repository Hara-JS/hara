window.onload = () => {
  gameJsInit();
};
const gameJsInit = () => {
  makeGameJsEvent();
};

/**
 * @type {(count: number, player: number)}
 */
const gameJsObj = {
    count: 0,
    player: 1
}

const makeGameJsEvent = () => {
  const diceRollBtn = document.getElementById("diceRoll");
  diceRollBtn.addEventListener("click", () => {
      gameJsObj.count++;
      const diceDiv = document.getElementsByClassName("diceBtn1");
      
      for (let i = 0; i < diceDiv.length; i++) {
          const targetDiv = diceDiv[i];
          const diceBtn3 = document.getElementsByClassName("diceBtn3")[i.toString()].value;
          
          if (diceBtn3 !== null && diceBtn3 !== undefined && diceBtn3 === "") {
              targetDiv.value = Math.floor(Math.random() * 6) + 1;
            }
        }
        if(gameJsObj.count > 2) {
            diceRollBtn.disabled = true;
        }
  });

  const keepBtnList = document.getElementsByClassName("diceBtn2");
  for (let i = 0; i < keepBtnList.length; i++) {
    const keepBtn = keepBtnList[i];
    keepBtn.addEventListener("click", (event) => {
        let moveFrom;
        let moveTo;
        const divIndex = event.target.id;

        switch(keepBtnList[divIndex].value) {
            case "keep":
                moveFrom = document.getElementsByClassName("diceBtn1")[divIndex];
                moveTo = document.getElementsByClassName("diceBtn3")[divIndex];
                keepBtnList[divIndex].value = "recovery";
                break;
            case "recovery":
                moveFrom = document.getElementsByClassName("diceBtn3")[divIndex];
                moveTo = document.getElementsByClassName("diceBtn1")[divIndex];
                keepBtnList[divIndex].value = "keep";
                break;
        }

      const value = moveFrom.value;
      moveTo.value = value;
      moveFrom.value = "";
    });
  }

const acesCalc = document.getElementsByName("acesCalc");
for(let i = 0; i < acesCalc.length; i++) {
    acesCalc[i].addEventListener("click", (event) => {
        moveAllDown();
        acesCalcFn();
        switchPlayer();
        event.target.disabled = true;
        clearDiceDiv();
    })
}

const twosCalc = document.getElementsByName("twosCalc");
for(let i = 0; i < twosCalc.length; i++) {
    twosCalc[i].addEventListener("click", (event) => {
        moveAllDown();
        twosCalcFn();
        switchPlayer();
        event.target.disabled = true;
        clearDiceDiv();
    })
}

const threesCalc = document.getElementsByName("threesCalc");
for(let i = 0; i < threesCalc.length; i++) {
    threesCalc[i].addEventListener("click", (event) => {
        moveAllDown();
        threesCalcFn();
        switchPlayer();
        event.target.disabled = true;
        clearDiceDiv();
    })
}

const foursCalc = document.getElementsByName("foursCalc");
for(let i = 0; i < foursCalc.length; i++) {
    foursCalc[i].addEventListener("click", (event) => {
        moveAllDown();
        foursCalcFn();
        switchPlayer();
        event.target.disabled = true;
        clearDiceDiv();
    })
}

const fivesCalc = document.getElementsByName("fivesCalc");
for(let i = 0; i < fivesCalc.length; i++) {
    fivesCalc[i].addEventListener("click", (event) => {
        moveAllDown();
        fivesCalcFn();
        switchPlayer();
        event.target.disabled = true;
        clearDiceDiv();
    })
}

const sixesCalc = document.getElementsByName("sixesCalc");
for(let i = 0; i < sixesCalc.length; i++) {
    sixesCalc[i].addEventListener("click", (event) => {
        moveAllDown();
        sixesCalcFn();
        switchPlayer();
        event.target.disabled = true;
        clearDiceDiv();
    })
}

const choiceCalc = document.getElementsByName("choiceCalc");
for(let i = 0; i < choiceCalc.length; i++) {
    choiceCalc[i].addEventListener("click", (event) => {
        moveAllDown();
        choiceCalcFn();
        switchPlayer();
        event.target.disabled = true;
        clearDiceDiv();
    })
}

const fourOfAKindCalc = document.getElementsByName("fourOfAKindCalc");
for(let i = 0; i < fourOfAKindCalc.length; i++) {
    fourOfAKindCalc[i].addEventListener("click", (event) => {
        moveAllDown();
        fourOfAKindCalcFn();
        switchPlayer();
        event.target.disabled = true;
        clearDiceDiv();
    })
}

const fullHouseCalc = document.getElementsByName("fullHouseCalc");
for(let i = 0; i < fullHouseCalc.length; i++) {
    fullHouseCalc[i].addEventListener("click", (event) => {
        moveAllDown();
        fullHouseCalcFn();
        switchPlayer();
        event.target.disabled = true;
        clearDiceDiv();
    })
}

const smallStraightCalc = document.getElementsByName("smallStraightCalc");
for(let i = 0; i < smallStraightCalc.length; i++) {
    smallStraightCalc[i].addEventListener("click", (event) => {
        moveAllDown();
        smallStraightCalcFn();
        switchPlayer();
        event.target.disabled = true;
        clearDiceDiv();
    })
}

const largeStraightCalc = document.getElementsByName("largeStraightCalc");
for(let i = 0; i < largeStraightCalc.length; i++) {
    largeStraightCalc[i].addEventListener("click", (event) => {
        moveAllDown();
        largeStraightCalcFn();
        switchPlayer();
        event.target.disabled = true;
        clearDiceDiv();
    })
}

const yachtCalc = document.getElementsByName("yachtCalc");
for(let i = 0; i < yachtCalc.length; i++) {
    yachtCalc[i].addEventListener("click", (event) => {
        moveAllDown();
        yachtCalcFn();
        switchPlayer();
        event.target.disabled = true;
        clearDiceDiv();
    })
}
};

const clearDiceDiv = () => {
    const diceRollBtn = document.getElementById("diceRoll");
    diceRollBtn.disabled = false;
    // }
}

const moveAllDown = () => {
    const diceDiv = document.getElementsByClassName("diceBtn1");
    
    for (let i = 0; i < diceDiv.length; i++) {
        const targetDiv = diceDiv[i];
        const diceBtn3 = document.getElementsByClassName("diceBtn3")[i.toString()];
        
        if (diceBtn3.value !== null && diceBtn3.value !== undefined && diceBtn3.value === "") {
            diceBtn3.value = targetDiv.value;
            targetDiv.value = "";
        }
    }
}

const switchPlayer = () => {
    switch(gameJsObj.player) {
        case 1:
            gameJsObj.player = 2;
            break;
        case 2:
            gameJsObj.player = 1;
            break;
    }
}

const acesCalcFn = () => {
    const targetDiv = document.getElementById("player" + gameJsObj.player + "Ace");
    const finalDiceDiv = document.getElementsByClassName("diceBtn3");
    let score = 0;
    for(let i = 0; i < finalDiceDiv.length; i++) {
        if(Number.parseInt(finalDiceDiv[i].value) === 1) {
            score += 1;
        }
    }
    targetDiv.value = score;
}

const twosCalcFn = () => {
    const targetDiv = document.getElementById("player" + gameJsObj.player + "Twos");
    const finalDiceDiv = document.getElementsByClassName("diceBtn3");
    let score = 0;
    for(let i = 0; i < finalDiceDiv.length; i++) {
        if(Number.parseInt(finalDiceDiv[i].value) === 2) {
            score += 2;
        }
    }
    targetDiv.value = score;
}

const threesCalcFn = () => {
    const targetDiv = document.getElementById("player" + gameJsObj.player + "Threes");
    const finalDiceDiv = document.getElementsByClassName("diceBtn3");
    let score = 0;
    for(let i = 0; i < finalDiceDiv.length; i++) {
        if(Number.parseInt(finalDiceDiv[i].value) === 3) {
            score += 3;
        }
    }
    targetDiv.value = score;
}

const foursCalcFn = () => {
    const targetDiv = document.getElementById("player" + gameJsObj.player + "Fours");
    const finalDiceDiv = document.getElementsByClassName("diceBtn3");
    let score = 0;
    for(let i = 0; i < finalDiceDiv.length; i++) {
        if(Number.parseInt(finalDiceDiv[i].value) === 4) {
            score += 4;
        }
    }
    targetDiv.value = score;
}

const fivesCalcFn = () => {
    const targetDiv = document.getElementById("player" + gameJsObj.player + "Fives");
    const finalDiceDiv = document.getElementsByClassName("diceBtn3");
    let score = 0;
    for(let i = 0; i < finalDiceDiv.length; i++) {
        if(Number.parseInt(finalDiceDiv[i].value) === 5) {
            score += 5;
        }
    }
    targetDiv.value = score;
}

const sixesCalcFn = () => {
    const targetDiv = document.getElementById("player" + gameJsObj.player + "Sixes");
    const finalDiceDiv = document.getElementsByClassName("diceBtn3");
    let score = 0;
    for(let i = 0; i < finalDiceDiv.length; i++) {
        if(Number.parseInt(finalDiceDiv[i].value) === 6) {
            score += 6;
        }
    }
    targetDiv.value = score;
}

const choiceCalcFn = () => {
    const targetDiv = document.getElementById("player" + gameJsObj.player + "Choice");
    const finalDiceDiv = document.getElementsByClassName("diceBtn3");
    let score = 0;
    for(let i = 0; i < finalDiceDiv.length; i++) {
        score += Number.parseInt(finalDiceDiv[i].value);
    }
    targetDiv.value = score;
}

const fourOfAKindCalcFn = () => {
    const targetDiv = document.getElementById("player" + gameJsObj.player + "fourOfAKind");
    const finalDiceDiv = document.getElementsByClassName("diceBtn3");
    let score = 0;
    let sameDice = 0;
    let sameDiceCnt = 0;
    for(let i = 1; i <= 6; i++) {
        if([...finalDiceDiv].filter(x => Number.parseInt(x.value) === i).length >= 4) {
            sameDice = i;
            sameDiceCnt = [...finalDiceDiv].filter(x => Number.parseInt(x.value) === i).length;
            break;
        }
    }    
    score += sameDiceCnt * sameDice;
    targetDiv.value = score;
}

const fullHouseCalcFn = () => {
    const targetDiv = document.getElementById("player" + gameJsObj.player + "fullHouse");
    const finalDiceDiv = document.getElementsByClassName("diceBtn3");
    let score = 0;
    let isSameThree = false;
    let isSameTwo = false;
    for(let i = 1; i <= 6; i++) {
        if([...finalDiceDiv].filter(x => Number.parseInt(x.value) === i).length === 3) {
            isSameThree = true;
        }
        if([...finalDiceDiv].filter(x => Number.parseInt(x.value) === i).length === 2) {
            isSameTwo = true;
        }
    }    
    // score += sameDiceCnt * sameDice;
    if(isSameThree === true && isSameTwo === true){
        for(let i = 0; i < finalDiceDiv.length; i++) {
            score += Number.parseInt(finalDiceDiv[i].value);
        }
    }
    targetDiv.value = score;
}

const smallStraightCalcFn = () => {
    const targetDiv = document.getElementById("player" + gameJsObj.player + "smallStraight");
    let score = 0;
    let smallStraightCnt = 0;
    const sortedArr = [...document.getElementsByClassName("diceBtn3")].sort((a, b) => a.value - b.value);
    for(let i = 0; i < sortedArr.length - 1; i++) {
        if(Number.parseInt(sortedArr[i].value) + 1 === Number.parseInt(sortedArr[i + 1].value)) {
            smallStraightCnt++;
        }
    }
    if(smallStraightCnt >= 3) {
        score = 15;
    }
    targetDiv.value = score;
}

const largeStraightCalcFn = () => {
    const targetDiv = document.getElementById("player" + gameJsObj.player + "largeStraight");
    let score = 0;
    let largeStraightCnt = 0;
    const sortedArr = [...document.getElementsByClassName("diceBtn3")].sort((a, b) => a.value - b.value);
    for(let i = 0; i < sortedArr.length - 1; i++) {
        if(Number.parseInt(sortedArr[i].value) + 1 === Number.parseInt(sortedArr[i + 1].value)) {
            largeStraightCnt++;
        }
    }
    if(largeStraightCnt === 4) {
        score = 30;
    }
    targetDiv.value = score;
}

const yachtCalcFn = () => {
    const targetDiv = document.getElementById("player" + gameJsObj.player + "yacht");
    let score = 0;
    let yachtCnt = 0;
    let isYucht = true ;
    const finalDiceDiv = document.getElementsByClassName("diceBtn3");
    for(let i = 0; i < finalDiceDiv.length - 1 && isYucht === true; i++) {
        isYucht = isYucht && (finalDiceDiv[i].value === finalDiceDiv[i + 1].value)
        if(finalDiceDiv[i].value === finalDiceDiv[i + 1].value) {
            yachtCnt++;
        }
    }
    if(yachtCnt === 4) {
        score = 50;
    }
    targetDiv.value = score;
}