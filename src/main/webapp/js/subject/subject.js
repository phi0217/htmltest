//根据科目级别和科目代码自动生成上级代码
$(".subjectCode").keyup(function(){
    var subjectLevel = $(".subjectLevel").val();
    var subjectCode = $(".subjectCode").val();
    var superiorSubjectCode;
    var regex = /^\d{8}$/;
    if (regex.test(subjectCode)){
        if (subjectLevel == 1){
            superiorSubjectCode = "";
        }
        if (subjectLevel == 2){
            superiorSubjectCode = subjectCode.substring(0,4) + "0000";
        }
        if (subjectLevel == 3){
            superiorSubjectCode = subjectCode.substring(0,6) + "00";
        }
        $(".superiorSubjectCode").val(superiorSubjectCode);
    }
});

$(".subjectLevel").blur(function () {
    var subjectLevel = $(".subjectLevel").val();
    if(subjectLevel == 3){
        $(".hasSubSubjectFlag").val(2);
    }
});

// --------------------------通用框体弹出逻辑 start --------------------------
//-----------------------新增录入弹出框---------------------------
$(".inputNew").click(function () {
    $("#inputNewBox").fadeIn(50);
})
$("#inputNewBox .close").click(function () {
    $("#inputNewBox").hide(50);
})

//--------------------------新增录入修改弹出框---------------------------
$(".modifyNew").click(function () {
    $("#modifyNewBox").fadeIn(50);
})
$(" #modifyNewBox .close").click(function () {
    $("#modifyNewBox").hide(50);
})


//--------------------------变更录入弹出框---------------------------
$(".inputUpdate").click(function () {
    $("#inputUpdateBox").fadeIn(50);
})
$(" #inputUpdateBox .close").click(function () {
    $("#inputUpdateBox").hide(50);
})

//--------------------------变更录入修改弹出框---------------------------
$(".modifyUpdate").click(function () {
    $("#modifyUpdateBox").fadeIn(50);
})
$(" #modifyUpdateBox .close").click(function () {
    $("#modifyUpdateBox").hide(50);
})

//--------------------------通用框体弹出逻辑 end --------------------------
