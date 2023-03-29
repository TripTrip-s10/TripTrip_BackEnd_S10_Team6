let btn = document.getElementById("signIn");
console.log(document.getElementById("signIn"));
  document.getElementById("signIn").addEventListener("click", function () {
    console.log("로그인")
      signIn();
  });
    

function signIn() {
  console.log(document.querySelector("#loginBtn"));
  document.querySelector("#loginBtn").addEventListener("click", function () {
    var id = document.querySelector("#id").value;
    var password = document.querySelector("#password").value;
    console.log(id);
    console.log(password);
    if (id == "ssafy" && password == "1234") {
      alert("로그인 성공");
      localStorage.setItem("id",id);
      localStorage.setItem("pw",password);
      document.querySelector("#profile").style.display = "block";
    }
  });
} 