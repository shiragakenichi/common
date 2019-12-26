  
$(function(){
  $(document).on('turbolinks:load', function() {
    function buildPost(message){
      var addImage = message.image.url  ?  message.image.url : ''

      var addUser = message.user_image ? message.user_image : '/images/dummyface.png'

        var html =  `<div class="message" data-message-id="${message.id}">
                      <div class="memo-message">
                      <p class="memesage"></p>
                      <div class="memo-image">
                      <img class="message-user" height="60px" width="60px" src="${addUser}">
                      </div>
                      <div class="upper-message__user-name">
                        ${message.user_name}
                      </div>
                      <div class="upper-message__date">
                        ${message.created_at}
                      <p class="mmm">
                        ${message.content}
                      <img class="lower-message__image" height="200px" width="px" src="${addImage}">
                      </p>
                      </div>
                      </div>
                      </div>`

        return html;
    }

      $('#new_message').on('submit', function(e){
        e.preventDefault()
        var formData = new FormData(this);
        var url = $(this).attr('action');
        console.log(this)
        $.ajax({
          url: url,  
          type: 'POST', 
          data: formData,  
          dataType: 'json',
          processData: false,
          contentType: false,
        })

        .done(function(message){
          var html = buildPost(message);
          
          $('.memo-line').append(html)
          $('#new_message')[0].reset();
          $('.hidden').prop('disabled', false);
          $('.memo-no-to').animate({scrollTop: $('.memo-no-to')[0].scrollHeight}, 'fast');
          })
        .fail(function(){
          alert('メッセージ送信に失敗しました');
    
      });
    });
    var reloadMessages = function () {
        if (window.location.href.match(/\/groups\/\d+\/messages/)){//今いるページのリンクが/groups/グループID/messagesのパスとマッチすれば以下を実行。
          var last_message_id = $('.message:last').data("message-id"); //dataメソッドで.messageにある:last最後のカスタムデータ属性を取得しlast_message_idに代入。
          

          $.ajax({ //ajax通信で以下のことを行う
            url: "api/messages", //サーバを指定。今回はapi/message_controllerに処理を飛ばす
            type: 'get', //メソッドを指定
            dataType: 'json', //データはjson形式
            data: {last_id: last_message_id}
            //飛ばすデータは先ほど取得したlast_message_id。またparamsとして渡すためlast_idとする。
          })
          
          .done(function (messages) {
            
            //通信成功したら、controllerから受け取ったデータ（messages)を引数にとって以下のことを行う
            if (messages.length === 0){
              return;
            };
            var insertHTML = '';//追加するHTMLの入れ物を作る
            messages.forEach(function (message) {//配列messagesの中身一つ一つを取り出し、HTMLに変換したものを入れ物に足し合わせる
              insertHTML = buildPost(message); //メッセージが入ったHTMLを取得
              $('.memo-line').append(insertHTML);//メッセージを追加
              })
            $('.memo-no-to').animate({scrollTop: $('.memo-no-to')[0].scrollHeight}, 'fast');//最新のメッセージが一番下に表示されようにスクロールする。
          })
          .fail(function () {
            alert('自動更新に失敗しました');//ダメだったらアラートを出す
          });
        }
      };
      setInterval(reloadMessages,7000);
      //5000ミリ秒ごとにreloadMessagesという関数を実行し自動更新を行う。
  });
});