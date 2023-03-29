var cookie = document.cookie.split(';');
console.log(cookie);
cookie.some(function (item) {
    // 공백을 제거
    item = item.replace(' ', '');

    var dic = item.split('=');
    console.log(dic);
    if ("id" == dic[0]) {
        result = dic[1];
        console.log(dic[1]);
    }
});
//if(localStorage.getItem("id")=="ssafy" && localStorage.getItem("pw")=="1234"){
//    console.log("????");
//    document.querySelector("#profile").style.display = "block";
//  } else{
//    document.querySelector("#profile").style.display = "none";
//  }