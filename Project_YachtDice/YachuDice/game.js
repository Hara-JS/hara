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
        calcFn("AcesCalc", event);
    })
}

const twosCalc = document.getElementsByName("twosCalc");
for(let i = 0; i < twosCalc.length; i++) {
    twosCalc[i].addEventListener("click", (event) => {
        calcFn("TwosCalc", event);
    })
}

const threesCalc = document.getElementsByName("threesCalc");
for(let i = 0; i < threesCalc.length; i++) {
    threesCalc[i].addEventListener("click", (event) => {
        calcFn("ThreesCalc", event);
    })
}

const foursCalc = document.getElementsByName("foursCalc");
for(let i = 0; i < foursCalc.length; i++) {
    foursCalc[i].addEventListener("click", (event) => {
        calcFn("FoursCalc", event);
    })
}

const fivesCalc = document.getElementsByName("fivesCalc");
for(let i = 0; i < fivesCalc.length; i++) {
    fivesCalc[i].addEventListener("click", (event) => {
        calcFn("FivesCalc", event);
    })
}

const sixesCalc = document.getElementsByName("sixesCalc");
for(let i = 0; i < sixesCalc.length; i++) {
    sixesCalc[i].addEventListener("click", (event) => {
        calcFn("SixesCalc", event);
    })
}

const choiceCalc = document.getElementsByName("choiceCalc");
for(let i = 0; i < choiceCalc.length; i++) {
    choiceCalc[i].addEventListener("click", (event) => {
        calcFn("Choice", event);
    })
}

const fourOfAKindCalc = document.getElementsByName("fourOfAKindCalc");
for(let i = 0; i < fourOfAKindCalc.length; i++) {
    fourOfAKindCalc[i].addEventListener("click", (event) => {
        calcFn("fourOfAKind", event);
    })
}

const fullHouseCalc = document.getElementsByName("fullHouseCalc");
for(let i = 0; i < fullHouseCalc.length; i++) {
    fullHouseCalc[i].addEventListener("click", (event) => {
        calcFn("fullHouse", event);
    })
}

const smallStraightCalc = document.getElementsByName("smallStraightCalc");
for(let i = 0; i < smallStraightCalc.length; i++) {
    smallStraightCalc[i].addEventListener("click", (event) => {
        calcFn("smallStraight", event);
    })
}

const largeStraightCalc = document.getElementsByName("largeStraightCalc");
for(let i = 0; i < largeStraightCalc.length; i++) {
    largeStraightCalc[i].addEventListener("click", (event) => {
        calcFn("largeStraight", event);
    })
}

const yachtCalc = document.getElementsByName("yachtCalc");
for(let i = 0; i < yachtCalc.length; i++) {
    yachtCalc[i].addEventListener("click", (event) => {
        calcFn("yacht", event);
    })
}
};

const clearDiceDiv = () => {
    const diceRollBtn = document.getElementById("diceRoll");
    diceRollBtn.disabled = false;
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

const calcFn = (scoreName, event) => {
    moveAllDown();
    switch(scoreName) {            
        case "AcesCalc":        calcAcesToSixesFn(1);   break;
        case "TwosCalc":        calcAcesToSixesFn(2);   break;
        case "ThreesCalc":      calcAcesToSixesFn(3);   break;
        case "FoursCalc":       calcAcesToSixesFn(4);   break;
        case "FivesCalc":       calcAcesToSixesFn(5);   break;
        case "SixesCalc":       calcAcesToSixesFn(6);   break;
        case "Choice":          choiceCalcFn();         break;
        case "fourOfAKind":     fourOfAKindCalcFn();    break;
        case "fullHouse":       fullHouseCalcFn();      break;
        case "smallStraight":   straightCalFn(3);       break;
        case "largeStraight":   straightCalFn(4);       break;
        case "yacht":           yachtCalcFn();          break;
    }
    switchPlayer();
    event.target.disabled = true;
    clearDiceDiv();
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

const calcAcesToSixesFn = (number) => {
    let divName = "";
    switch(number) {
        case 1: divName = "Aces"; break;
        case 2: divName = "Twos"; break;
        case 3: divName = "Threes"; break;
        case 4: divName = "Fours"; break;
        case 5: divName = "Fives"; break;
        case 6: divName = "Sixes"; break;
    }

const targetDiv = document.getElementById("player" + gameJsObj.player + divName);
    const finalDiceDiv = document.getElementsByClassName("diceBtn3");
    let score = 0;
    for(let i = 0; i < finalDiceDiv.length; i++) {
        if(Number.parseInt(finalDiceDiv[i].value) === number) {
            score += number;
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
    if(isSameThree === true && isSameTwo === true){
        for(let i = 0; i < finalDiceDiv.length; i++) {
            score += Number.parseInt(finalDiceDiv[i].value);
        }
    }
    targetDiv.value = score;
}

const straightCalFn = (number) => {
    const divName = number === 3 ? "smallStraight" : "largeStraight";
    const targetDiv = document.getElementById("player" + gameJsObj.player + divName);
    let score = 0;
    let straightCnt = 0;
    const sortedArr = [...document.getElementsByClassName("diceBtn3")].sort((a, b) => a.value - b.value);
    for(let i = 0; i < sortedArr.length - 1; i++) {
        if(Number.parseInt(sortedArr[i].value) + 1 === Number.parseInt(sortedArr[i + 1].value)) {
            straightCnt++;
        }
    }
    if(straightCnt >= number) {
        score = number === 3 ? 15 : 30;
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
            isYucht = finalDiceDiv[i].value !== "" && isYucht && (finalDiceDiv[i].value === finalDiceDiv[i + 1].value)
            if(finalDiceDiv[i].value === finalDiceDiv[i + 1].value) {
                yachtCnt++;
            }
    }
    if(yachtCnt === 4) {
        score = 50;
    }
    targetDiv.value = score;
}
                