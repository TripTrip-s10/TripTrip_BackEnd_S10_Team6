if(localStorage.getItem("id")=="ssafy" && localStorage.getItem("pw")=="1234"){
    console.log("????");
    document.querySelector("#profile").style.display = "block";
  } else{
    document.querySelector("#profile").style.display = "none";
  }