$(function(){
  function buildHTML(message){
    if(message.msg && message.image_url){
      var url =`<div class="message">
                  <div class="upper_message">
                    <div class="upper_message__user-name">${message.user_name}</div>
                    <div class="upper_message__data">${message.data}</div>
                    <div class="upper_message__delete italic">
                      <a rel="nofollow" data-method="delete" href="/groups/${message.group_id}/messages/${message.id}">Delete
                      </a></div>
                  </div>
                  <div class="lower_message">${message.msg}</div>
                  <div class="lower_message">${message.image_url}</div>
                </div>`
      return url;
    }
    else if(message.msg){
      var url =`<div class="message">
                 <div class="upper_message">
                    <div class="upper_message__user-name">${message.user_name}</div>
                    <div class="upper_message__data">${message.data}</div>
                    <div class="upper_message__delete italic">
                      <a rel="nofollow" data-method="delete" href="/groups/${message.group_id}/messages/${message.id}">Delete
                      </a></div>
                  </div>
                  <div class="lower_message">${message.msg}</div>
                </div>`
      return url;
    }
    else{
      var url =`<div class="message">
                 <div class="upper_message">
                    <div class="upper_message__user-name">${message.user_name}</div>
                    <div class="upper_message__data">${message.data}</div>
                    <div class="upper_message__delete italic">
                      <a rel="nofollow" data-method="delete" href="/groups/${message.group_id}/messages/${message.id}">Delete
                      </a></div>
                  </div>
                  <div class="lower_message">
                    <img src="${message.image_url}" alt="${message.image}"></div>
                </div>`
      return url;
    }}
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
      console.log(data);
      var html = buildHTML(data);
      $('.messages').append(html);
      $('.form__message').val('');
      $('.form__submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});
