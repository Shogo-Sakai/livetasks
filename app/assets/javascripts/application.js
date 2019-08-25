// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
// 
//= require jquery 
//= require moment
//= require fullcalendar
//= require rails-ujs
//= require materialize
//= require activestorage
//= require turbolinks

//= require_tree .

// カレンダー関係
$(function(){
  $(document).on('turbolinks:load', function(){
    if ($('#calendar').length){
      // fullcalendarの設定を読み込む
      function eventCalendar(){
        return $('#calendar').fullCalendar({
        });
      };
      // fullcalendarを削除してturbolinksを正常に機能させる
      function clearCalendar(){
        $('#calendar').html('');
      };
      
      // イベントを表示させる
      $(document).on('turbolinks:load', function(){
        eventCalendar();
      });
      $(document).on('turbolinks:before-cache', clearCalendar);

      // イベントを呼び出す
      $('#calendar').fullCalendar({
        events: '/tasks.json',
        //カレンダー上部を年月で表示させる
        // titleFormat: 'YYYY年 M月',
        //曜日を日本語表示
        // dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
        //ボタンのレイアウト
        header: {
            left: '',
            center: 'title',
            right: 'today prev,next'
        },
        //終了時刻がないイベントの表示間隔
        defaultTimedEventDuration: '03:00:00',
        // buttonText: {
        //     prev: '前',
        //     next: '次',
        //     prevYear: '前年',
        //     nextYear: '翌年',
        //     today: '今日',
        //     month: '月',
        //     week: '週',
        //     day: '日'
        // },
        //イベントの時間表示を２４時間に
        timeFormat: "HH:mm",
        //イベントの色を変える
        eventColor: '#63ceef',
        //イベントの文字色を変える
        eventTextColor: '#000000',
      })
    };
  })
});

