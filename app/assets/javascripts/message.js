$(function(){
  function buildHTML(message){
    var html_common = `<div class="message">
                        <div class="upper_message">
                          <div class="upper_message__user-name">${message.user_name}</div>
                          <div class="upper_message__data">${message.data}</div>
                          <div class="upper_message__delete italic"><a rel="nofollow" data-method="delete" href="/groups/${message.group_id}/messages/${message.id}">Delete</a></div>
                        </div>
                        <div class="lower_message">`
    if(message.msg && message.image_url){
      var html = html_common + `${message.msg}</div>
                  <div class="lower_message"><img src="${message.image_url}" alt="${message.image}"></div>
                </div>`
      return html;
    }
    else if(message.msg){
      var html = html_common + `${message.msg}</div>
                </div>`
      return html;
    }

    else{
      var html = html_common + `<img src="${message.image_url}" alt="${message.image}"></div>
                </div>`
      return html;
    }

  }
  function flash() {
    var html =
      `<p class="flash alert-notice">メッセージを送信しました</p>`
    $('.alert').append(html);
    $('.alert-notice').fadeIn(500).fadeOut(2000);
    setTimeout(function(){
     $('.alert-notice').remove();
    },2500);
  }
  function flash_delete() {
    var html =
      `<p class="flash alert-notice">メッセージを削除しました</p>`
    $('.alert').append(html);
    $('.alert-notice').fadeIn(500).fadeOut(2000);
    setTimeout(function(){
     $('.alert-notice').remove();
    },2500);
  }
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.messages').append(html);
      $('.form__message').val('');
      $('.form__submit').prop('disabled', false);
      flash();
      $('.messages').animate({scrollTop:$('.form').offset().top});
      return false;
    })
    .fail(function(){
      alert('error');
    })
  });
  $('.upper_message__delete').on('click', function(e){
    e.preventDefault();
    flash_delete();
  });
});
