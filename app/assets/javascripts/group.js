$(function(){
    function buildHTML_test(message){
    var html_test  =  `<div class='chat-group-user clearfix'>
                         <p class='chat-group-user__name'>onamae</p>
                         <a class="user-search-add chat-group-user__btn chat-group-user__btn--add js-add-btn" href="#">追加</a>
                       </div>`
    return html_test;
  }
  function buildHTML(message){
    var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-9999'>
                  <input type="hidden" id="user-search-field" class="chat-group-form__input" placeholder="追加したいユーザー名を入力してください" value="" name="group[g]" />
                  <p class='chat-group-user__name'>ユーザーネーム出力</p>
                  <a class="user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn" href="#">削除</a>
                  </div>`
    return html;
  }
  $(document).on('click','.js-add-btn', function(e){
    e.preventDefault();
    console.log("hello!");
    // var formData = new FormData(this);
    // var url = $(this).attr('action');
      var html_test = buildHTML_test();
      var html = buildHTML();
      // var changed_side_id = ChangedSideId(data);
      // var latest_msg = ChangedSideMsg(data);
      // $(changed_side_id).text(latest_msg);
      $('.js-user-search-result').append(html_test);
      $('.js-add-user').append(html);
      // $('.form__message').val('');
      // $('.form__submit').prop('disabled', false);
      // flash();
      // $('.messages').animate({scrollTop:$('.form').offset().top});
      // return false;
  });
});
