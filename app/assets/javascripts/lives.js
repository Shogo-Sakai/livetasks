$(document).on('turbolinks:load', function(){
  // タブ
  $('.tabs').tabs();

  // 日付選択
  $('.datepicker').datepicker({
    autoClose: true,
    format: 'yyyy/mm/dd',
    showMonthAfterYear: true
  });
});

  // サイドナビバー
  // document.addEventListener('turbolinks:load', function() {
  //   var elems = document.querySelectorAll('.sidenav');
  //   var instances = M.Sidenav.init(elems, options);
  // });

$(document).on('ready turbolinks:load', function(){
  elem = document.querySelector('#slide-out');
  instance = new M.Sidenav(elem, {});
  });

$(document).on('ready turbolinks:before-visit', function(){
  elem = document.querySelector('#slide-out');
  instance = M.Sidenav.getInstance(elem);
  instance.destroy()
  });