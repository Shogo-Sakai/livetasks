$(document).on('turbolinks:load', function(){
  $("#age-checkbox").on('click',function(){
    var val = $('#age-checkbox:checked').val();

    if(val){
      
      // userの誕生日をDateインスタンスに変換する。
      var userBirthDate = new Date($('#birthyear').val(), $('#birthmonth').val() - 1 , $('#birthday').val());
      
      // 文字列に分解
      var userYear = userBirthDate.getFullYear().toString().padStart(4,'0');
      var userMonth = (userBirthDate.getMonth() + 1).toString().padStart(2,'0');
      var userDay = userBirthDate.getDate().toString().padStart(2, '0');

      // 今日の日付
      const today = new Date();
      var todayYear = today.getFullYear().toString().padStart(4,'0');
      var todayMonth = (today.getMonth()+ 1 ).toString().padStart(2,'0');
      var todayDay = today.getDate().toString().padStart(2,'0');

      // 引き算
      var age = Math.floor((Number(todayYear + todayMonth + todayDay) - Number(userYear + userMonth + userDay)) / 10000);
      
      // Ageの欄に記入する。
      $('#age').val(age);
    }
  })
})