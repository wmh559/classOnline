var stompClient = null; //websocket客户端
var websocketUrl = "/websocket"; //连接websocket地址

/**
 * 更新在线用户列表
 * @param message
 */
function showActiveUserList(message) {
    var obj = message.parseJSON();
    console.log(obj)
}

/**
 * 连接websocket服务器
 */
function connect() {
    var socket = new SockJS(websocketUrl);
    stompClient = Stomp.over(socket);
    stompClient.connect({},function (frame) {
        stompClient.subscribe("/topic/chat/message",function (message) {  //发送简单的信息
            var json = JSON.parse(message.body);
            var sendId = json.sendId; //发送者id
            var classid = json.sendClass;  //发送班级编号
            var nickname = json.nickname;  //发送者昵称
            var senddate = json.sendDate;  //发送日期
            var content = json.content;  //发送内容
            var sendType = 0;
            if (classid != $('#user_classId').val()) {  //不在同一班级，不显示
                return;
            }
            if (sendId == $('#user_id').val()) {  //自己发送的在右边，其他人发送的在左边
                sendType = 1;
            }
            showNewMessage(nickname,senddate,content,sendType);
        })
    })

}

/**
 * 显示信息到聊天框中
 */
function showNewMessage(nickname, date, content, type) { // 0 -> 左边 ； 1 -> 右边
    //拼接时间
    var fdate = new Date(date);
    var sec = parseInt(fdate.getSeconds()) < 10 ? ('0' + fdate.getSeconds()) : fdate.getSeconds();
    var sendTime = fdate.getHours() + ":" + fdate.getMinutes() + ":" + sec;
    //追加元素
    var chat_li = null;
    if (type == 0) {
        chat_li = $('<li class="left"></li>');
    }else {
        chat_li = $('<li class="right"></li>');
    }
    chat_li.append('<img src="/resources/images/users/avatar-6.jpg" alt=""/>');
    var chat_info = $('<div class="chat-info"></div>');
    var chat_nickname = $('<a class="name" href="#"></a>').text(nickname+" ");
    var chat_datetime = $('<span class="datetime"></span>').html(sendTime + "<br/>");
    var chat_message = $('<span class="message"></span>').text(content);
    chat_info.append(chat_nickname).append(chat_datetime).append(chat_message);
    chat_li.append(chat_info);
    $('#chat_content').append(chat_li);

    //滚动到最新消息
    $('#chat_content')[0].scrollTop = $('#chat_content')[0].scrollHeight;
}

/**
 * 发送聊天框中的信息
 */
function sendMessage() {
    var content = $("#input_content").val();
    var nickname = $("#user_nickname").val();
    var classId =  $("#user_classId").val();
    var userId = $('#user_id').val();


    if (content.trim().length != 0) {
        $('#input_content').val(''); //清空发送框信息
        stompClient.send("/app/chat/message",{},JSON.stringify({
            'sendId':userId,
            'sendClass':classId,
            'nickname':nickname,
            'content':content,
            'sendDate':new Date()
        }))
    }
}

$(function () {
    connect();
    /**
     * 监听键盘事件，当按下回车键时发送信息
     */
    $("#input_content").bind("keyup",function (event) {
        if (event.keyCode == 13) {
            console.log("key event:" + event.keyCode);
            sendMessage();
        }
    })

});