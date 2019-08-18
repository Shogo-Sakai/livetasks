// サイドナビバー
$(document).ready(function(){
  $('.sidenav').sidenav();
});

// タブ
$(document).ready(function(){
  $('.tabs').tabs();
});

// 日付選択
$(document).ready(function(){
  $('.datepicker').datepicker({
    autoClose: true,
    format: 'yyyy/mm/dd',
    showMonthAfterYear: true
  });
});

// 検索非同期通信
