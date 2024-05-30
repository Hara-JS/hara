window.onload = () => {
  init();
};

// 엑셀에서 받은 정보를 json화 하여 저장하기 위한 변수
const dataObject = {};

// 문제 목록
const questionList = [
  "회원정보에서 지역이 광역시인 사람은 몇 명인가? [5]",
  "회원정보에서 회원이름에 신이 들어가는 사람은? [신짱구, 신짱아, 신형만, 신동엽]",
  "회원정보에서 전화번호 뒷자리가 짝수로 끝나는 사람의 이름은 무엇인가? [[김철수, 010-3456-8542], [신형만, 010-2345-6548], [나미리, 010-3297-6478], [나봉선, 010-1115-3020], [유민상, 010-3056-9578]]",
  "호텔정보에서 지점명은 몇 개인가? [4]",
  "서울 지점에 예약한 사람의 이름은? [김철수, 신짱아, 봉미선, 신동엽]",
  "호텔예약정보에서 홀수로 끝나는 번호는 몇 개인가? [6]",
  "호텔예약정보에서 객실정보 중에서 스탠다드를 원하는 사람은 몇 명인가? [5]",
  "호텔예약정보에서 예약날짜가 4월인 사람의 이름은? [봉미선, 채성안, 나미리, 나봉선, 유민상, 신동엽]",
  "호텔예약정보에서 예약번호가 홀수로 끝나는 사람 중 지점이 서울인 사람은 몇 명인가? [4]",
  "체크아웃 하지 않은 회원의 이름은? [나미리, 나봉선, 유민상, 신동엽]",
];

// 화면 최초 접속 시 호출하는 함수
const init = () => {
  addEvent();
  makeQuestionSelectBox();
};

// 이벤트 생성 함수들
const addEvent = () => {
  // HTML에서 [파일 선택]영역의 파일 선택 버튼
  const openFile = document.getElementById("my_file_input");
  // [데이터 Excel 파일 업로드 영역]에서 파일을 선택 했을 때의 이벤트 설정
  openFile.addEventListener("change", (fileEvent) => {
    filePicked(fileEvent);
  });
  // HTML에서 [문제 선택 영역]의 셀렉스박스
  const questionSelectBox = document.getElementById("questionSelect");
  questionSelectBox.addEventListener("change", (changeEvent) => {});
  // [데이터 확인 영역]에서 [데이터 확인] 버튼
  const dataViewBtn = document.getElementById("dataViewBtn");
  dataViewBtn.addEventListener("click", (clickEvent) => {
    renderData();
  });
  // 버튼을 눌렀을 때의 이벤트 설정
  const showAnswerBtn = document.getElementById("showAnswerBtn");
  showAnswerBtn.addEventListener("click", (clickEvent) => {
    showAnswer();
  });
};

// 엑셀 파일을 읽어서 json으로 바꾸는 처리
const filePicked = (fileEvent) => {
  // 내가 선택한 파일들
  /**
   * {FileList}는 파일들을 리스트로 관리하는 인터페이스
   * @type{FileList}
   */
  const files = fileEvent.target.files;

  // file은 {fileList}이기 때문에 forEach 함수가 존재하지 않아서 for()를 사용하여 반복함
  for (let i = 0; i < files.length; i++) {
    // 읽어들일 파일
    const file = files[i];
    // 확장자를 확인하여 엑셀 파일이 아닐 경우 파일을 읽어오지 않음
    const fileExt = file.name.split(".")[1];
    // 확장자가 XLSX나 XLS가 아니면 파일을 읽지 않는 처리 (바리에이션 체크)
    if (fileExt.toUpperCase() !== "XLSX" && fileExt.toUpperCase() !== "XLS") {
      alert("엑셀 파일을 선택해주세요");
      document.getElementById("my_file_input").value = null;
      return;
    }

    // 파일을 읽기 위해 FileReader를 생성
    const reader = new FileReader();
    // 파일을 읽어들임
    reader.readAsBinaryString(file);
    // https://developer.mozilla.org/docs/Web/API/FileReader/load_event
    // 파일이 성공적으로 업로드 되었을 때의 처리
    reader.onload = (event) => {
      // FileReader로 읽어들인 데이터
      const data = event.target.result;
      //  라이브러리를 사용하여 바이너리 형태로 엑셀 파일을 읽음
      const workbook = XLSX.read(data, { type: "binary" });

      /**
       * @type{string[]}
      */
      // 엑셀 파일에서 "SAMPLEDATA"라는 이름이 포함된 시트만 가져옴
      const dataSheetNameList = workbook.SheetNames.filter((sheetName) =>
        sheetName.toUpperCase().includes("SAMPLEDATA")
      );
      if (dataSheetNameList.length === 0) {
        alert("유효한 데이터가 없습니다. 데이터를 확인해주세요");
        return;
      }

      // 엑셀 파일에서 'SAMPLEDATA'라는 이름이 포함된 시트 정보만 읽어서 json 형태로 변환
      dataSheetNameList.forEach((item) => {
        // 라이브러리를 사용하여 바이너리로 읽은 정보를 json으로 변환
        const excelJsonData = XLSX.utils.sheet_to_json(workbook.Sheets[item]);

        // [날짜]정보를 보여주는 데이터를 Date 타입으로 변환
        excelJsonData.forEach((excelRowData) => {
          Object.keys(excelRowData).forEach((key) => {
            if (key.toUpperCase().includes("DATE")) {
              excelRowData[key] = excelSerialDateToJSDate(excelRowData[key]);
            }
          });
        });
        // 원본 엑셀 파일의 시트 이름을 key로 하여 위에서 만든 json을 만듦
        // { 엑셀 파일의 시트명 : {위에서 만든 json} }
        dataObject[item] = excelJsonData;
      });

      makeDataViewSelectBox();
    };
  }
};

// 7번 문제를 풀기 위해 날짜의 싱크를 맞추는 함수
// 엑셀에서 저장하는 Date 타입과 JS에서 관리하는 Date 타입이 달라서 문제를 풀기가 어려웠기 때문에 구글링으로 긁어옴
const excelSerialDateToJSDate = (excelSerialDate) => {
  const daysBeforeUnixEpoch = 70 * 365 + 19;
  const hour = 60 * 60 * 1000;
  return new Date(
    Math.round((excelSerialDate - daysBeforeUnixEpoch) * 24 * hour) + 12 * hour
  );
};

// 파일이 로드되었을 때 [데이터 확인 영역]에 선택할 옵션을 만드는 처리
const makeDataViewSelectBox = () => {
  const dataObjKeys = Object.keys(dataObject);
  const makeDataViewSelectBoxObj = document.getElementById("dataViewSelect");

  dataObjKeys.forEach((key) => {
    const option = document.createElement("option");
    option.label = key;
    option.value = key;
    makeDataViewSelectBoxObj.append(option);
  });
};

// 선택된 데이터를 새 창으로 띄워서 보여주는 처리
const renderData = () => {
  /**
   * @type{HTMLElement} [데이터 확인 영역]에 확인할 데이터를 선택하는 셀렉트박스
   */
  const makeDataViewSelectBox = document.getElementById("dataViewSelect");
  /**
   * @type{string} 셀렉트 박스에서 선택한 옵션 정보
   */
  const dataName = makeDataViewSelectBox.value;
  /**
   * type(object[]) 스크립트에서 사용할 json에서 선택한 정보를 가져옴
   */
  const dataList = dataObject[dataName];
  /**
   * @type{string} 새 창에서 보여줄 HTML 코드
   */
  let renderStr = "<input type='button' id='closeBtn' value='닫기'>";

  // table 틀을 만드는 게 아직 익숙하지 않아서 불필요하게 코드가 늘어났지만 내가 보기 좋으라고 이렇게 만듦
  renderStr =
    renderStr + "<br><br></br>dataObject." + dataName + "<b>[</b>";

  dataList.forEach((data) => {
    const dataKeyList = Object.keys(data);
    renderStr = renderStr + "<pre>{</pre>";
    renderStr = renderStr + "<table>";

    dataKeyList.forEach((key) => {
      renderStr = renderStr + "<tr>";

      renderStr = renderStr + "<td>";
      renderStr = renderStr + key;
      renderStr = renderStr + "</td>";

      renderStr = renderStr + "<td>";
      renderStr = renderStr + "<i>{";
      renderStr = renderStr + typeof data[key];
      renderStr = renderStr + "}</i>";
      renderStr = renderStr + "</td>";

      renderStr = renderStr + "<td>";
      renderStr = renderStr + ": ";
      renderStr = renderStr + data[key];
      renderStr = renderStr + "</td>";

      renderStr = renderStr + "</tr>";
    });
    renderStr = renderStr + "</table>";
    renderStr = renderStr + "<pre>";
    renderStr = renderStr + "},";
    renderStr = renderStr + "</pre>";
  });
  renderStr = renderStr + "<b>]</b>";
  renderStr = renderStr + `<script>
  document.getElementById('closeBtn').addEventListener('click', () => {
    window.close();
  })
  </script>`;

  // 새 창을 만들고 새 창에 HTML 코드를 넣어줌
  const openWindow = window.open();
  openWindow.document.write(renderStr);
};

// 파일이 로드가 되었을 때 [데이터 확인 영역]에 선택할 옵션을 만드는 처리
const makeQuestionSelectBox = () => {
  /**
   * @type{HTMLElement}
   */
  const questionSelectBox = document.getElementById("questionSelect");

  questionList.forEach((question, index) => {
    const option = document.createElement("option");
    option.label = question;
    option.value = index;
    questionSelectBox.append(option);
  });
};

// 문제 영역에서 답을 계산하기 위한 함수
const showAnswer = () => {
  const questSelectBox  = document.getElementById("questionSelect");
  // switch문 조건식에 넣기 위해 number로 캐스팅
  const selectedQuestionValue = Number.parseInt(questSelectBox.value);
  // 정답을 담아놓을 string 변수
  let resultStr = "";
  // number로 캐스팅한 문제 번호를 switch문 조건식에 넣음
  switch(selectedQuestionValue) {
    case 0 :
      let count1 = 0;
      for(let i = 0; i < dataObject.memberInforSampleData.length; i++){ 
        if(dataObject.memberInforSampleData[i].localAddress.includes("광역시")) {
          count1++;
        }
      }
      resultStr = count1 + "명";
      break;
    case 1 :
      for(let i = 0; i < dataObject.memberInforSampleData.length; i++) {
        if(dataObject.memberInforSampleData[i].memberName.includes("신")) {
          resultStr += dataObject.memberInforSampleData[i].memberName + " ";
        }
      }
      break;
    case 2 :
      for(let i = 0; i < dataObject.memberInforSampleData.length; i++) {
        let number = dataObject.memberInforSampleData[i].phoneNumber;
        if(Number.parseInt(number.substr(number.length-1)) % 2 === 0) {
          resultStr += dataObject.memberInforSampleData[i].memberName + ", ";
          resultStr += dataObject.memberInforSampleData[i].phoneNumber + "\n";
        }
      }
      break;
    case 3 :
      resultStr = dataObject.hotelInfoSampleData.length + "개";
      break;
    case 4 :
      let count2 = 0;
      for(let i = 0; i < dataObject.hotelBookingSampleData.length; i++) {
        if(dataObject.hotelBookingSampleData[i].branchName.includes("서울")) {
          resultStr += dataObject.hotelBookingSampleData[i].memberName + " ";
        }
      }
      break;
    case 5 :
      let count3 = 0;
      for(let i = 0; i < dataObject.hotelBookingSampleData.length; i++) {
        let number = dataObject.hotelBookingSampleData[i].bookingSeq;
        if(number % 2 !== 0) {
          count3++;
        }
      }
      resultStr = count3 + "개";
      break;
    case 6 :
      let count4 = 0;
      for(let i = 0; i < dataObject.hotelBookingSampleData.length; i++) {
        if(dataObject.hotelBookingSampleData[i].roomInfo.includes("스탠다드")) {
          count4++;
        }
      }
      resultStr = count4 + "명";
      break;
    case 7 :
      for(let i = 0; i < dataObject.hotelBookingSampleData.length; i++) {
        if(dataObject.hotelBookingSampleData[i].bookingDate.getMonth()+1 === 4) {
          resultStr += dataObject.hotelBookingSampleData[i].memberName + " ";
        }
      }
      break;
    case 8 :
      let count5 = 0;
      for(let i = 0; i < dataObject.hotelBookingSampleData.length; i++) {
        if(dataObject.hotelBookingSampleData[i].bookingSeq % 2 !== 0 && dataObject.hotelBookingSampleData[i].branchName.includes("서울")) {
          count5++;
        }
      }
      resultStr = count5 + "명";
      break;
    case 9 :
      for(let i = 0; i < dataObject.hotelBookingSampleData.length; i++) {
        // 체크아웃을 한 시간이 없으면 undefined을 반화하기 때문에 undefined과 비교
        if(dataObject.hotelBookingSampleData[i].checkOutDateTime === undefined) {
          resultStr += dataObject.hotelBookingSampleData[i].memberName + " ";
        }
      }
      break;
    default :
    resultStr = "문제를 선택하세요";
    break;
  }
  alert(resultStr);
};