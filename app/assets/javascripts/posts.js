// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

// 抓關鍵字

var fruit = ["木瓜", "青木瓜", "椰子汁", "百香果", "西瓜", "李子", "芒果", "金黃奇異果", "奇異果", "枇杷", "甜柿", "萊姆", "檸檬汁", "文旦", "柳橙", "椪柑", "火龍果", "香蕉", "桑葚", "桑葚汁", "水蜜桃", "荔枝", "草莓", "西洋梨", "水梨", "甜瓜,香瓜", "蜜棗", "芭樂", "大番茄", "小番茄", "楊桃", "葡萄", "酪梨", "鳳梨", "蓮霧", "龍眼", "蘋果", "釋迦", "番石榴", "紅毛丹", "榴槤", "櫻桃"] 

$(document).ready(function() {
	console.log("123");
	$( "#fruit_input" ).keyup(function() {
   	var s = $('#fruit_input').val();
   	//console.log(s.length)
		for (i = 0; i < fruit.length; i++) { 
		   if (s.length > 0){
		   		console.log(">0")
		   		if (fruit[i].includes(s)){
		   			console.log(fruit[i])
		   		}
			}
		}
    });
});