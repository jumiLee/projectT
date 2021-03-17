/**
 * Adobe Edge: symbol definitions
 */
(function($, Edge, compId){
//images folder
var im='images/';
var misrc = 'images/Monster/mon_';

var fonts = {};


var resources = [
];
var symbols = {
"stage": {
   version: "1.0.0",
   minimumCompatibleVersion: "0.1.7",
   build: "1.0.0.185",
   baseState: "Base State",
   initialState: "Base State",
   gpuAccelerate: false,
   resizeInstances: false,
   content: {
         dom: [
         {
            id:'EF_Magic_02',
            type:'image',
            rect:['-96px','0%','512px','512px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"EF_Magic_02.png",'0px','0px'],
            transform:[[],[],[],['0.67','0.67']]
         },
         {
            id:'EF_Magic_03',
            type:'image',
            rect:['-96px','-0.2%','512px','512px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"EF_Magic_03.png",'0px','0px'],
            transform:[[],[],[],['0.67','0.67']]
         },
         {
            id:'mon_02',
            type:'image',
            rect:['62px','123px','190px','190px','auto','auto'],
            opacity:1,
            fill:["rgba(0,0,0,0)",misrc+$("#mon_id").val()+".jpg",'0px','0px'],
            transform:[[],[],[],['0.53','0.53']]
         },
         {
            id:'pming0047',
            type:'image',
            rect:['28px','86px','256px','256px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"pming0047.png",'0px','0px']
         },
         {
            id:'pming00472',
            type:'image',
            rect:['34px','93px','256px','256px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"pming00472.png",'0px','0px']
         },
         {
            id:'mon_26',
            type:'image',
            rect:['65px','396px','190px','190px','auto','auto'],
            fill:["rgba(0,0,0,0)",misrc+$("#mon_id1").val()+".jpg",'0px','0px'],
            transform:[[],[],[],['0.5','0.5']]
         },
         {
            id:'mon_27',
            type:'image',
            rect:['-35px','396px','190px','190px','auto','auto'],
            fill:["rgba(0,0,0,0)",misrc+$("#mon_id2").val()+".jpg",'0px','0px'],
            transform:[[],[],[],['0.5','0.5']]
         },
         {
            id:'mon_28',
            type:'image',
            rect:['164px','396px','190px','190px','auto','auto'],
            fill:["rgba(0,0,0,0)",misrc+$("#mon_id3").val()+".jpg",'0px','0px'],
            transform:[[],[],[],['0.5','0.5']]
         },
         {
            id:'EF_Magic_butterfly_mg',
            type:'image',
            rect:['-100px','-37px','512px','512px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"EF_Magic_butterfly_mg.png",'0px','0px'],
            transform:[[],[],[],['0.71','0.71']]
         },
         {
            id:'UI_Touch',
            type:'image',
            rect:['118px','243px','150px','150px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"UI_Touch.png",'0px','0px'],
            transform:[[],[],[],['0.6','0.6']]
         }],
         symbolInstances: [

         ]
      },
   states: {
      "Base State": {
         "${_EF_Magic_butterfly_mg}": [
            ["style", "top", '-37.22px'],
            ["transform", "scaleY", '0.01'],
            ["transform", "scaleX", '0.01'],
            ["style", "opacity", '0'],
            ["style", "left", '-100.22px']
         ],
         "${_mon_27}": [
            ["style", "top", '395.5px'],
            ["transform", "scaleY", '0.5'],
            ["transform", "scaleX", '0.5'],
            ["style", "opacity", '0'],
            ["style", "left", '-35.5px']
         ],
         "${_EF_Magic_02}": [
            ["style", "top", '-6.33%'],
            ["transform", "scaleY", '0.69'],
            ["transform", "rotateZ", '0deg'],
            ["transform", "scaleX", '0.69'],
            ["style", "opacity", '1'],
            ["style", "left", '-96.36px']
         ],
         "${_mon_26}": [
            ["style", "top", '333.5px'],
            ["transform", "scaleY", '0.5'],
            ["transform", "scaleX", '0.5'],
            ["style", "opacity", '0'],
            ["style", "left", '66.5px']
         ],
         "${_pming00472}": [
            ["style", "top", '93px'],
            ["transform", "scaleY", '0.12'],
            ["transform", "rotateZ", '-90deg'],
            ["transform", "scaleX", '0.12'],
            ["style", "opacity", '0'],
            ["style", "left", '34px']
         ],
         "${_EF_Magic_03}": [
            ["style", "top", '-6.5%'],
            ["transform", "scaleY", '0.69'],
            ["transform", "rotateZ", '0deg'],
            ["transform", "scaleX", '0.69'],
            ["style", "opacity", '1'],
            ["style", "left", '-96.36px']
         ],
         "${_UI_Touch}": [
            ["style", "top", '243px'],
            ["transform", "scaleY", '0.6'],
            ["transform", "scaleX", '0.6'],
            ["style", "opacity", '0'],
            ["style", "left", '118px']
         ],
         "${_Stage}": [
            ["color", "background-color", 'rgba(0,0,0,1.00)'],
            ["style", "width", '320px'],
            ["style", "height", '600px'],
            ["style", "overflow", 'hidden']
         ],
         "${_mon_02}": [
            ["style", "top", '123px'],
            ["transform", "scaleY", '0.53'],
            ["style", "overflow", 'visible'],
            ["transform", "scaleX", '0.53'],
            ["style", "opacity", '0'],
            ["style", "left", '62px']
         ],
         "${_pming0047}": [
            ["style", "top", '86px'],
            ["transform", "scaleY", '1'],
            ["transform", "scaleX", '1'],
            ["style", "opacity", '0'],
            ["style", "left", '28px']
         ],
         "${_mon_28}": [
            ["style", "top", '333.5px'],
            ["transform", "scaleY", '0.5'],
            ["transform", "scaleX", '0.5'],
            ["style", "opacity", '0'],
            ["style", "left", '166.5px']
         ]
      }
   },
   timelines: {
      "Default Timeline": {
         fromState: "Base State",
         toState: "",
         duration: 6810,
         autoPlay: true,
         timeline: [
            { id: "eid12", tween: [ "style", "${_EF_Magic_02}", "left", '-96.36px', { fromValue: '-96.36px'}], position: 0, duration: 0 },
            { id: "eid20", tween: [ "style", "${_mon_26}", "opacity", '1', { fromValue: '0'}], position: 1000, duration: 500 },
            { id: "eid50", tween: [ "style", "${_mon_26}", "opacity", '1', { fromValue: '1'}], position: 1500, duration: 0 },
            { id: "eid164", tween: [ "style", "${_mon_26}", "opacity", '0.9765625', { fromValue: '1'}], position: 1820, duration: 430 },
            { id: "eid51", tween: [ "style", "${_mon_26}", "opacity", '0', { fromValue: '0.9765629768371582'}], position: 2250, duration: 250 },
            { id: "eid6", tween: [ "transform", "${_EF_Magic_03}", "scaleY", '0.69', { fromValue: '0.69'}], position: 0, duration: 0 },
            { id: "eid47", tween: [ "style", "${_mon_28}", "left", '64.5px', { fromValue: '166.5px'}], position: 2065, duration: 435 },
            { id: "eid55", tween: [ "transform", "${_EF_Magic_03}", "rotateZ", '45deg', { fromValue: '0deg'}], position: 2750, duration: 500 },
            { id: "eid56", tween: [ "transform", "${_EF_Magic_03}", "rotateZ", '180deg', { fromValue: '45deg'}], position: 3250, duration: 500 },
            { id: "eid61", tween: [ "transform", "${_EF_Magic_03}", "rotateZ", '680deg', { fromValue: '180deg'}], position: 3750, duration: 1250 },
            { id: "eid82", tween: [ "style", "${_EF_Magic_03}", "opacity", '0', { fromValue: '1'}], position: 4750, duration: 250 },
            { id: "eid83", tween: [ "style", "${_EF_Magic_03}", "opacity", '0', { fromValue: '0'}], position: 5045, duration: 0 },
            { id: "eid5", tween: [ "transform", "${_EF_Magic_03}", "scaleX", '0.69', { fromValue: '0.69'}], position: 0, duration: 0 },
            { id: "eid103", tween: [ "transform", "${_pming00472}", "rotateZ", '-90deg', { fromValue: '-90deg'}], position: 5380, duration: 0 },
            { id: "eid125", tween: [ "transform", "${_pming00472}", "rotateZ", '-90deg', { fromValue: '-90deg'}], position: 5920, duration: 0 },
            { id: "eid138", tween: [ "transform", "${_pming00472}", "rotateZ", '-90deg', { fromValue: '-90deg'}], position: 6365, duration: 0 },
            { id: "eid65", tween: [ "style", "${_EF_Magic_butterfly_mg}", "opacity", '0', { fromValue: '0'}], position: 0, duration: 0 },
            { id: "eid67", tween: [ "style", "${_EF_Magic_butterfly_mg}", "opacity", '1', { fromValue: '0.000000'}], position: 4750, duration: 250 },
            { id: "eid88", tween: [ "style", "${_EF_Magic_butterfly_mg}", "opacity", '0', { fromValue: '1'}], position: 5000, duration: 250 },
            { id: "eid91", tween: [ "transform", "${_mon_02}", "scaleX", '1.3', { fromValue: '0.53'}], position: 5000, duration: 250 },
            { id: "eid7", tween: [ "transform", "${_EF_Magic_02}", "scaleX", '0.69', { fromValue: '0.69'}], position: 0, duration: 0 },
            { id: "eid46", tween: [ "style", "${_mon_28}", "top", '125.5px', { fromValue: '333.5px'}], position: 2065, duration: 435 },
            { id: "eid19", tween: [ "style", "${_mon_28}", "opacity", '1', { fromValue: '0'}], position: 1000, duration: 500 },
            { id: "eid52", tween: [ "style", "${_mon_28}", "opacity", '0.9609375', { fromValue: '1'}], position: 1500, duration: 1000 },
            { id: "eid53", tween: [ "style", "${_mon_28}", "opacity", '0', { fromValue: '0.9609379768371582'}], position: 2500, duration: 250 },
            { id: "eid165", tween: [ "style", "${_mon_26}", "left", '66.5px', { fromValue: '66.5px'}], position: 1500, duration: 0 },
            { id: "eid162", tween: [ "style", "${_mon_26}", "left", '61.5px', { fromValue: '66.5px'}], position: 1820, duration: 430 },
            { id: "eid163", tween: [ "style", "${_mon_26}", "top", '333.5px', { fromValue: '333.5px'}], position: 1500, duration: 0 },
            { id: "eid36", tween: [ "style", "${_mon_26}", "top", '125.5px', { fromValue: '333.5px'}], position: 1820, duration: 430 },
            { id: "eid93", tween: [ "style", "${_pming0047}", "opacity", '0', { fromValue: '0'}], position: 0, duration: 0 },
            { id: "eid95", tween: [ "style", "${_pming0047}", "opacity", '1', { fromValue: '0.000000'}], position: 5250, duration: 45 },
            { id: "eid100", tween: [ "style", "${_pming0047}", "opacity", '0', { fromValue: '1'}], position: 5295, duration: 260 },
            { id: "eid116", tween: [ "style", "${_pming0047}", "opacity", '1', { fromValue: '0.000000'}], position: 5655, duration: 45 },
            { id: "eid117", tween: [ "style", "${_pming0047}", "opacity", '0', { fromValue: '1'}], position: 5700, duration: 260 },
            { id: "eid142", tween: [ "style", "${_pming0047}", "opacity", '0', { fromValue: '1'}], position: 6045, duration: 260 },
            { id: "eid143", tween: [ "style", "${_pming0047}", "opacity", '1', { fromValue: '0.000000'}], position: 6405, duration: 45 },
            { id: "eid144", tween: [ "style", "${_pming0047}", "opacity", '0', { fromValue: '1'}], position: 6450, duration: 260 },
            { id: "eid58", tween: [ "transform", "${_EF_Magic_02}", "rotateZ", '-45deg', { fromValue: '0deg'}], position: 2750, duration: 500 },
            { id: "eid59", tween: [ "transform", "${_EF_Magic_02}", "rotateZ", '-180deg', { fromValue: '-45deg'}], position: 3250, duration: 500 },
            { id: "eid60", tween: [ "transform", "${_EF_Magic_02}", "rotateZ", '-680deg', { fromValue: '-180deg'}], position: 3750, duration: 1250 },
            { id: "eid15", tween: [ "style", "${_mon_02}", "opacity", '1', { fromValue: '0.000000'}], position: 0, duration: 500 },
            { id: "eid99", tween: [ "transform", "${_pming0047}", "scaleY", '2.95', { fromValue: '1'}], position: 5250, duration: 305 },
            { id: "eid118", tween: [ "transform", "${_pming0047}", "scaleY", '2.95', { fromValue: '1'}], position: 5655, duration: 305 },
            { id: "eid145", tween: [ "transform", "${_pming0047}", "scaleY", '2.95', { fromValue: '1'}], position: 6000, duration: 305 },
            { id: "eid146", tween: [ "transform", "${_pming0047}", "scaleY", '2.95', { fromValue: '1'}], position: 6405, duration: 305 },
            { id: "eid8", tween: [ "transform", "${_EF_Magic_02}", "scaleY", '0.69', { fromValue: '0.69'}], position: 0, duration: 0 },
            { id: "eid167", tween: [ "style", "${_UI_Touch}", "opacity", '1', { fromValue: '0.000000'}], position: 6000, duration: 5 },
            { id: "eid98", tween: [ "transform", "${_pming0047}", "scaleX", '2.95', { fromValue: '1'}], position: 5250, duration: 305 },
            { id: "eid115", tween: [ "transform", "${_pming0047}", "scaleX", '2.95', { fromValue: '1'}], position: 5655, duration: 305 },
            { id: "eid140", tween: [ "transform", "${_pming0047}", "scaleX", '2.95', { fromValue: '1'}], position: 6000, duration: 305 },
            { id: "eid141", tween: [ "transform", "${_pming0047}", "scaleX", '2.95', { fromValue: '1'}], position: 6405, duration: 305 },
            { id: "eid11", tween: [ "style", "${_EF_Magic_03}", "top", '-6.5%', { fromValue: '-6.5%'}], position: 0, duration: 0 },
            { id: "eid102", tween: [ "style", "${_pming00472}", "opacity", '1', { fromValue: '0.000000'}], position: 5380, duration: 120 },
            { id: "eid110", tween: [ "style", "${_pming00472}", "opacity", '0', { fromValue: '1'}], position: 5575, duration: 250 },
            { id: "eid121", tween: [ "style", "${_pming00472}", "opacity", '1', { fromValue: '0.000000'}], position: 5920, duration: 120 },
            { id: "eid122", tween: [ "style", "${_pming00472}", "opacity", '0', { fromValue: '1'}], position: 6115, duration: 250 },
            { id: "eid130", tween: [ "style", "${_pming00472}", "opacity", '1', { fromValue: '0.000000'}], position: 6365, duration: 120 },
            { id: "eid131", tween: [ "style", "${_pming00472}", "opacity", '0', { fromValue: '1'}], position: 6560, duration: 250 },
            { id: "eid10", tween: [ "style", "${_EF_Magic_03}", "left", '-96.36px', { fromValue: '-96.36px'}], position: 0, duration: 0 },
            { id: "eid33", tween: [ "style", "${_mon_27}", "left", '-33.5px', { fromValue: '-35.5px'}], position: 1000, duration: 0 },
            { id: "eid32", tween: [ "style", "${_mon_27}", "left", '61.5px', { fromValue: '-33.5px'}], position: 1500, duration: 500 },
            { id: "eid71", tween: [ "transform", "${_EF_Magic_butterfly_mg}", "scaleY", '0.71', { fromValue: '0.01'}], position: 4750, duration: 250 },
            { id: "eid87", tween: [ "transform", "${_EF_Magic_butterfly_mg}", "scaleY", '1.25', { fromValue: '0.71'}], position: 5000, duration: 250 },
            { id: "eid113", tween: [ "transform", "${_pming00472}", "scaleX", '1.28', { fromValue: '0.12'}], position: 5380, duration: 195 },
            { id: "eid111", tween: [ "transform", "${_pming00472}", "scaleX", '2.14', { fromValue: '1.28'}], position: 5575, duration: 250 },
            { id: "eid119", tween: [ "transform", "${_pming00472}", "scaleX", '1.28', { fromValue: '0.12'}], position: 5920, duration: 195 },
            { id: "eid120", tween: [ "transform", "${_pming00472}", "scaleX", '2.14', { fromValue: '1.28'}], position: 6115, duration: 250 },
            { id: "eid126", tween: [ "transform", "${_pming00472}", "scaleX", '1.28', { fromValue: '0.12'}], position: 6365, duration: 195 },
            { id: "eid127", tween: [ "transform", "${_pming00472}", "scaleX", '2.14', { fromValue: '1.28'}], position: 6560, duration: 250 },
            { id: "eid70", tween: [ "transform", "${_EF_Magic_butterfly_mg}", "scaleX", '0.71', { fromValue: '0.01'}], position: 4750, duration: 250 },
            { id: "eid86", tween: [ "transform", "${_EF_Magic_butterfly_mg}", "scaleX", '1.25', { fromValue: '0.71'}], position: 5000, duration: 250 },
            { id: "eid13", tween: [ "style", "${_EF_Magic_02}", "top", '-6.33%', { fromValue: '-6.33%'}], position: 0, duration: 0 },
            { id: "eid21", tween: [ "style", "${_mon_27}", "opacity", '1', { fromValue: '0'}], position: 1000, duration: 500 },
            { id: "eid48", tween: [ "style", "${_mon_27}", "opacity", '0.96875', { fromValue: '1'}], position: 1500, duration: 500 },
            { id: "eid49", tween: [ "style", "${_mon_27}", "opacity", '0', { fromValue: '0.96875'}], position: 2000, duration: 250 },
            { id: "eid27", tween: [ "style", "${_mon_27}", "top", '333.5px', { fromValue: '395.5px'}], position: 1000, duration: 0 },
            { id: "eid30", tween: [ "style", "${_mon_27}", "top", '122.5px', { fromValue: '333.5px'}], position: 1500, duration: 500 },
            { id: "eid92", tween: [ "transform", "${_mon_02}", "scaleY", '1.3', { fromValue: '0.53'}], position: 5000, duration: 250 },
            { id: "eid114", tween: [ "transform", "${_pming00472}", "scaleY", '1.28', { fromValue: '0.12'}], position: 5380, duration: 195 },
            { id: "eid112", tween: [ "transform", "${_pming00472}", "scaleY", '2.14', { fromValue: '1.28'}], position: 5575, duration: 250 },
            { id: "eid123", tween: [ "transform", "${_pming00472}", "scaleY", '1.28', { fromValue: '0.12'}], position: 5920, duration: 195 },
            { id: "eid124", tween: [ "transform", "${_pming00472}", "scaleY", '2.14', { fromValue: '1.28'}], position: 6115, duration: 250 },
            { id: "eid134", tween: [ "transform", "${_pming00472}", "scaleY", '1.28', { fromValue: '0.12'}], position: 6365, duration: 195 },
            { id: "eid135", tween: [ "transform", "${_pming00472}", "scaleY", '2.14', { fromValue: '1.28'}], position: 6560, duration: 250 },
            { id: "eid84", tween: [ "style", "${_EF_Magic_02}", "opacity", '0', { fromValue: '1'}], position: 4750, duration: 250 },
            { id: "eid85", tween: [ "style", "${_EF_Magic_02}", "opacity", '0', { fromValue: '0'}], position: 5045, duration: 0 }         ]
      }
   }
}
};


Edge.registerCompositionDefn(compId, symbols, fonts, resources);

/**
 * Adobe Edge DOM Ready Event Handler
 */
$(document).ready(function() {
     Edge.launchComposition(compId);
});
})(jQuery, AdobeEdge, "EDGE-1566878");
