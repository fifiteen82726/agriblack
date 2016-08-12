//加上<script src="donutchart.js"></script>  應該就可以有圖了

// Get api
var url="https://agriblack.herokuapp.com/api/nutrition/haha?name=百香果";

var name;
var heat;
var water;
var potein;
var fat;
var carbohydrate;
var fiber;
var suger;

var na;
var k;
var ca;
var mg;
var fe;
var zn;
var p;

var va;
var ve;
var vb;
var vc;

$.ajax({
        type: 'GET',
        url: url,
        dataType: 'JSON',
        async: false,
        success: function (data) {

        	name=data.name;
            heat = data.heat;
            water=data.water;
            potein = data.potein;
            fat = data.fat;
            carbohydrate=data.carbohydrate;
            fiber = data.fiber;
            suger = data.suger;

            na=data.na;
            k=data.k;
            ca=data.ca;
            mg=data.mg;
            fe = data.fe;
            zn=data.zn;
            p=data.p;

            va=data.va;
            ve=data.ve;
            vb=data.vb;
            vc=data.vc;

        },
        error: function (request, error) {
        alert(error);
    	}
   });
var pie = new d3pie("pieChart", {
	
	"header": {
		"title": {
			"text": "百香果,西瓜,蘋果",
			"fontSize": 34,
			"font": "courier"
		},
		"subtitle": {
			"text": "每100克含量",
			"color": "#999999",
			"fontSize": 10,
			"font": "courier"
		},
		"location": "pie-center",
		"titleSubtitlePadding": 10
	},
	"footer": {
		//"text": "* This was curious. We're not sure why over several people regard Winnipeg as a Top 15 Fear.",
		"color": "#999999",
		"fontSize": 10,
		"font": "open sans",
		"location": "bottom-left"
	},
	"size": {
		"canvasWidth": 590,
		"pieInnerRadius": "95%",
		"pieOuterRadius": "70%"
	},
	"data": {
		"sortOrder": "random",
		"smallSegmentGrouping": {
			"enabled": true,
			"value": 0
		},
		"content": [
			{
				"label": "熱量 (kcal)",
				"value": heat,
				"color": "#ccc2b2"
			},
			{
				"label": "水分 (g)",
				"value": water,
				"color": "#ccc8b2"
			},
			{
				"label": "蛋白質 (g)",
				"value": potein,
				"color": "#b5b2cc"
			},
			{
				"label": "脂肪 (g)",
				"value": fat,
				"color": "#b2bbcc"
			},
			{
				"label": "碳水化合物 (g)",
				"value": carbohydrate,
				"color": "#b2b4cc"
			},
			{
				"label": "膳食纖維 (g)",
				"value": fiber,
				"color": "#c7ccb2"
			},
			{
				"label": "糖分 (g)",
				"value": suger,
				"color": "#b2c8cc"
			},
			{
				"label": "鈉 (mg)",
				"value": na,
				"color": "#ccb2b2"
			},
			{
				"label": "鉀 (mg)",
				"value": k,
				"color": "#b2c2cc"
			},
			{
				"label": "鈣 (mg)",
				"value": ca,
				"color": "#b2ccbb"
			},
			{
				"label": "鎂 (mg)",
				"value": mg,
				"color": "#c6b2cc"
			},
			{
				"label": "鐵 (mg)",
				"value": fe,
				"color": "#ccb2c8"
			},
			{
				"label": "鋅 (mg)",
				"value": zn,
				"color": "#b5ccb2"
			},
			{
				"label": "磷 (mg)",
				"value": p,
				"color": "#b2ccc6"
			},
			{
				"label": "維生素A (mg)",
				"value": va,
				"color": "#bbb2cc"
			},
			{
				"label": "維生素E (mg)",
				"value": ve,
				"color": "#b2ccb5"
			},
			{
				"label": "維生素B (mg)",
				"value": vb,
				"color": "#bfccb2"
			},
			{
				"label": "維生素C (mg)",
				"value": vc,
				"color": "#ccb9b2"
			}
		]
	},
	"labels": {
		"outer": {
			"format": "label-value1",
			"pieDistance": 19
		},
		"inner": {
			"format": "none"
		},
		"mainLabel": {
			"fontSize": 11
		},
		"percentage": {
			"color": "#999999",
			"fontSize": 11,
			"decimalPlaces": 0
		},
		"value": {
			"color": "#cccc43",
			"fontSize": 11
		},
		"lines": {
			"enabled": true,
			"color": "#777777"
		},
		"truncation": {
			"enabled": true
		}
	},
	"effects": {
		"pullOutSegmentOnClick": {
			"effect": "linear",
			"speed": 400,
			"size": 8
		}
	},
	"misc": {
		"colors": {
			"segmentStroke": "#000000"
		}
	}
});