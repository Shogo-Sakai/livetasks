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


// $(window).bind("turbolinks:load", function(){
//   if((document.URL.match('/signup/') || document.URL.match('/login/'))){
//   }else{
    $(document).on('ready turbolinks:load', function(){
      if($('#slide-out').length){
        elem = document.querySelector('#slide-out');
        instance = new M.Sidenav(elem, {});          
      }
      });
    
    $(document).on('ready turbolinks:before-visit', function(){
      if($('#slide-out').length){
        elem = document.querySelector('#slide-out');
        instance = M.Sidenav.getInstance(elem);
        if(instance){
          instance.destroy()
        }  
      }
      });  
//   }
// })
