$(document).ready(function(){
  // サイドナビバー
  $('.sidenav').sidenav();

  // タブ
  $('.tabs').tabs();

  // 日付選択
  $('.datepicker').datepicker({
    autoClose: true,
    format: 'yyyy/mm/dd',
    showMonthAfterYear: true
  });
});
