$(function(){
  var search_list = $('.js-user-search-result');
  function appendProduct(user) {
    var html = `<div class='chat-group-user clearfix'>
                  <p class='chat-group-user__name'>${user.name}</p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add js-add-btn" data_user_id="${user.id}" data_user_name="${user.name}">追加</a>
                </div>`
    search_list.append(html);
  }

  function appendNoproduct(user) {
    var html = `<div class='chat-group-user clearfix'>
                  <p class='chat-group-user__name'>空欄が入力されました</p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add js-add-btn" data_user_id="" data_user_name=""></a>
                </div>`
    search_list.append(html);
  }

  $("#user-search-field").on("keyup", function() {
    var input = $("#user-search-field").val();
    console.log(input);
    $.ajax({
      type: 'GET',
      url: '/users/',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(users) {
      $(".js-user-search-result").empty();
      if (users.length !== 0) {
        users.forEach(function(user){
        appendProduct(user);
        });
      }
      else {
        appendNoproduct("ユーザーネームが存在しません");
      }
    })
    .fail(function() {
      alert('ユーザー検索に失敗しました');
    })
  });

  function buildHTML(user_id, user_name){
    var html = `<div class='chat-group-user clearfix js-chat-member'>
                  <input name='group[user_ids][]' type='hidden' value='${user_id}'>
                  <p class='chat-group-user__name'>${user_name}</p>
                  <a class="user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn" data_user_id="${user_id}" data_user_name="${user_name}">削除</a>
                  </div>`
    return html;
  }
  function returnHTML(user_id, user_name){
    var html = `<div class='chat-group-user clearfix'>
                  <p class='chat-group-user__name'>${user_name}</p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add js-add-btn" data_user_id="${user_id}" data_user_name="${user_name}">追加</a>
                </div>`
    return html;
  }
  $(document).on('click','.js-add-btn', function(e){
    e.preventDefault();
    var user_id = $(this).attr('data_user_id');
    var user_name = $(this).attr('data_user_name');
    var html = buildHTML(user_id, user_name);
    $('.js-add-user').append(html);
    $(this).parent().remove();
  });
    $(document).on('click','.js-remove-btn', function(e){
    e.preventDefault();
    var user_id = $(this).attr('data_user_id');
    var user_name = $(this).attr('data_user_name');
    var html = returnHTML(user_id, user_name);
    $('.js-user-search-result').append(html);
    $(this).parent().remove();
  });
});
