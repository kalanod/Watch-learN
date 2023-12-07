$("#signUpFormBtn").click(function () {
    var saveData = $.ajax({
        type: 'POST',
        url: "/Gradle___com_calanco___WatchAndLearn_1_0_SNAPSHOT_war/registration",
        data: {"name": $("#signUpName").val(), "email": $("#signUpEmail").val(), "password": $("#signUpPassword").val()},
        dataType: "text",
        success: function (resultData) {
            console.log(resultData)
            console.log(typeof resultData)
            if (resultData === "1") {
                location.reload()
            } else {
                var email1 = document.getElementById("signUpEmail");
                email1.className += " is-invalid";
            }
        }
    });
    saveData.error(function () {
        alert(resultData);
    });
})
$("#signInFormBtn").click(function () {
    var saveData = $.ajax({
        type: 'POST',
        url: "/Gradle___com_calanco___WatchAndLearn_1_0_SNAPSHOT_war/login",
        data: {"email": $("#signInEmail").val(), "password": $("#signInPassword").val()},
        dataType: "text",
        success: function (resultData) {
            if (resultData === "1") {
                location.reload()
            } else {
                var email = document.getElementById("signInEmail");
                email.className += " is-invalid";
                var password = document.getElementById("signInPassword");
                password.className += " is-invalid";
                console.log("dddddd")
            }
        }
    });
    saveData.error(function () {
        alert("Something went wrong");
    });
})

function showSignInForm() {

}