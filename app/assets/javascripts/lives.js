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

  $(document).on('turbolinks:load', function(){
    $('.sidenav').sidenav();
  });
        