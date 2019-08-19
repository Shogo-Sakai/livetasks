// 検索非同期通信
$(function(){
  var search_list = $('#user-search-result')
  function appendUser(user){
    var html = `
                <div class="live-staff" id="add-live-staff">
                  <p class="live-staff__name valign-wrapper ">${user.nickname}</p>
                  <div class="user-search-add btn right-align" data-user-id="${user.id}" data-user-name="${user.nickname}">Add to Staff</div>
                </div>
              `
              search_list.append(html);
  };

  function appendErrMsgToHTML(msg){
    var html = `
              <div class="live-staff" id="add-live-staff">
              <p class="live-staff__name">${ msg }</p>
              </div>
              `
              search_list.append(html);
  }

  $('#user-search-field').on('keyup',function(){
    var input = $('#user-search-field').val()

    $.ajax({
      type: 'GET',
      url: "/users/search",
      data: { keyword: input},
      dataType: 'json',
    })

    .done(function(users){
      $('#user-search-result').empty();

      if (users.length !== 0){
        $("#search-result").addClass("box-border")
        users.forEach(function(user){
          var html = appendUser(user)
          $('#user-search-result').append(html);
        });
      } else {
        $("#search-result").addClass("box-border")
        appendErrMsgToHTML("There are no such user.")
      }
      if ( input.length == 0){
        $('#user-search-result').empty();
        $("#search-result").removeClass("box-border")
      }
    })
    .fail(function(){
      alert('Error. Please confirm this again.')
    })
  });
});