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
            id:'mon_02',
            type:'image',
            rect:['65px','45px','190px','190px','auto','auto'],
            fill:["rgba(0,0,0,0)",misrc+$("#mon_id").val()+".jpg",'0px','0px']
         },
         {
            id:'hm',
            type:'image',
            rect:['121px','-19px','182px','250px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"hm.png",'0px','0px'],
            transform:[[],[],[],['-0.975','0.75']]
         },
         {
            id:'EF_Dust_34_Se002',
            type:'image',
            rect:['64px','138px','128px','128px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"EF_Dust_34_Se002.png",'0px','0px']
         },
         {
            id:'EF_Dust_34_Se012',
            type:'image',
            rect:['64px','138px','128px','128px','auto','auto'],
            opacity:1,
            fill:["rgba(0,0,0,0)",im+"EF_Dust_34_Se012.png",'0px','0px']
         },
         {
            id:'EF_Dust_34_Se022',
            type:'image',
            rect:['64px','138px','128px','128px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"EF_Dust_34_Se022.png",'0px','0px']
         },
         {
            id:'EF_Light_39',
            type:'image',
            rect:['64px','138px','128px','128px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"EF_Light_39.png",'0px','0px']
         }],
         symbolInstances: [

         ]
      },
   states: {
      "Base State": {
         "${_EF_Dust_34_Se022}": [
            ["transform", "scaleX", '2'],
            ["style", "opacity", '0'],
            ["style", "left", '64px'],
            ["style", "top", '138px'],
            ["transform", "scaleY", '2']
         ],
         "${_hm}": [
            ["style", "-webkit-transform-origin", [50,50], {valueTemplate:'@@0@@% @@1@@%'} ],
            ["style", "-moz-transform-origin", [50,50],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-ms-transform-origin", [50,50],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "msTransformOrigin", [50,50],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-o-transform-origin", [50,50],{valueTemplate:'@@0@@% @@1@@%'}],
            ["transform", "rotateZ", '0deg'],
            ["transform", "scaleX", '-0.975'],
            ["style", "opacity", '0'],
            ["style", "left", '125.72px'],
            ["style", "width", '182.46153846154px'],
            ["style", "top", '-8.25px'],
            ["transform", "scaleY", '0.75'],
            ["transform", "skewX", '0deg'],
            ["style", "height", '250px'],
            ["transform", "skewY", '0deg']
         ],
         "${_EF_Light_39}": [
            ["transform", "scaleX", '1.79'],
            ["style", "opacity", '0'],
            ["style", "left", '64px'],
            ["style", "top", '138px'],
            ["transform", "scaleY", '1.79']
         ],
         "${_Stage}": [
            ["color", "background-color", 'rgba(0,0,0,1.00)'],
            ["style", "width", '320px'],
            ["style", "height", '320px'],
            ["style", "overflow", 'hidden']
         ],
         "${_mon_02}": [
            ["transform", "rotateZ", '0deg'],
            ["transform", "scaleX", '1'],
            ["style", "opacity", '1'],
            ["style", "left", '65px'],
            ["style", "width", '141.18115569856px'],
            ["style", "top", '45px'],
            ["transform", "scaleY", '1'],
            ["transform", "skewX", '0deg'],
            ["style", "height", '157.54210555364px'],
            ["transform", "skewY", '0deg']
         ],
         "${_EF_Dust_34_Se012}": [
            ["transform", "scaleX", '2'],
            ["style", "opacity", '0'],
            ["style", "left", '64px'],
            ["style", "top", '138px'],
            ["transform", "scaleY", '2']
         ],
         "${_EF_Dust_34_Se002}": [
            ["transform", "scaleX", '2'],
            ["style", "opacity", '0'],
            ["style", "left", '64px'],
            ["style", "top", '138px'],
            ["transform", "scaleY", '2']
         ]
      }
   },
   timelines: {
      "Default Timeline": {
         fromState: "Base State",
         toState: "",
         duration: 2665,
         autoPlay: true,
         timeline: [
            { id: "eid106", tween: [ "transform", "${_EF_Dust_34_Se002}", "scaleX", '2', { fromValue: '2'}], position: 2060, duration: 0 },
            { id: "eid24", tween: [ "style", "${_hm}", "width", '182.46153846154px', { fromValue: '182.46153846154px'}], position: 1330, duration: 0 },
            { id: "eid71", tween: [ "style", "${_hm}", "width", '182.46153846154px', { fromValue: '182.46153846154px'}], position: 1830, duration: 0 },
            { id: "eid275", tween: [ "style", "${_hm}", "width", '182.46153846154px', { fromValue: '182.46153846154px'}], position: 2265, duration: 0 },
            { id: "eid281", tween: [ "transform", "${_hm}", "skewY", '0deg', { fromValue: '0deg'}], position: 2265, duration: 0 },
            { id: "eid171", tween: [ "style", "${_EF_Dust_34_Se012}", "left", '64px', { fromValue: '64px'}], position: 2480, duration: 0 },
            { id: "eid177", tween: [ "style", "${_EF_Dust_34_Se012}", "top", '138px', { fromValue: '138px'}], position: 2480, duration: 0 },
            { id: "eid27", tween: [ "transform", "${_hm}", "scaleY", '0.75', { fromValue: '0.75'}], position: 1330, duration: 0 },
            { id: "eid69", tween: [ "transform", "${_hm}", "scaleY", '0.75', { fromValue: '0.75'}], position: 1830, duration: 0 },
            { id: "eid345", tween: [ "transform", "${_hm}", "scaleY", '0.75', { fromValue: '0.75'}], position: 2080, duration: 0 },
            { id: "eid287", tween: [ "transform", "${_hm}", "scaleY", '0.75', { fromValue: '0.75'}], position: 2265, duration: 0 },
            { id: "eid99", tween: [ "style", "${_EF_Light_39}", "opacity", '1', { fromValue: '0.000000'}], position: 2060, duration: 10 },
            { id: "eid100", tween: [ "style", "${_EF_Light_39}", "opacity", '0', { fromValue: '1'}], position: 2070, duration: 410 },
            { id: "eid178", tween: [ "style", "${_EF_Dust_34_Se002}", "top", '138px', { fromValue: '138px'}], position: 2480, duration: 0 },
            { id: "eid14", tween: [ "transform", "${_mon_02}", "scaleY", '0.28', { fromValue: '1'}], position: 330, duration: 500 },
            { id: "eid346", tween: [ "transform", "${_mon_02}", "scaleY", '0.28', { fromValue: '0.28'}], position: 2080, duration: 0 },
            { id: "eid288", tween: [ "transform", "${_mon_02}", "scaleY", '0.28', { fromValue: '0.28'}], position: 2265, duration: 0 },
            { id: "eid15", tween: [ "transform", "${_mon_02}", "scaleX", '1.07', { fromValue: '1'}], position: 330, duration: 500 },
            { id: "eid344", tween: [ "transform", "${_mon_02}", "scaleX", '1.07', { fromValue: '1.07'}], position: 2080, duration: 0 },
            { id: "eid286", tween: [ "transform", "${_mon_02}", "scaleX", '1.07', { fromValue: '1.07'}], position: 2265, duration: 0 },
            { id: "eid29", tween: [ "style", "${_hm}", "opacity", '1', { fromValue: '0'}], position: 830, duration: 500 },
            { id: "eid348", tween: [ "style", "${_hm}", "opacity", '1', { fromValue: '1'}], position: 2080, duration: 0 },
            { id: "eid269", tween: [ "style", "${_hm}", "opacity", '1', { fromValue: '1'}], position: 2265, duration: 0 },
            { id: "eid167", tween: [ "style", "${_hm}", "opacity", '1', { fromValue: '1'}], position: 2480, duration: 0 },
            { id: "eid108", tween: [ "transform", "${_EF_Dust_34_Se012}", "scaleX", '2', { fromValue: '2'}], position: 2155, duration: 0 },
            { id: "eid176", tween: [ "style", "${_EF_Dust_34_Se022}", "top", '138px', { fromValue: '138px'}], position: 2480, duration: 0 },
            { id: "eid279", tween: [ "transform", "${_hm}", "skewX", '0deg', { fromValue: '0deg'}], position: 2265, duration: 0 },
            { id: "eid107", tween: [ "transform", "${_EF_Dust_34_Se002}", "scaleY", '2', { fromValue: '2'}], position: 2060, duration: 0 },
            { id: "eid86", tween: [ "style", "${_EF_Dust_34_Se012}", "opacity", '1', { fromValue: '0'}], position: 2155, duration: 20 },
            { id: "eid94", tween: [ "style", "${_EF_Dust_34_Se012}", "opacity", '0', { fromValue: '1'}], position: 2265, duration: 32 },
            { id: "eid165", tween: [ "style", "${_EF_Dust_34_Se012}", "opacity", '0', { fromValue: '0'}], position: 2480, duration: 0 },
            { id: "eid109", tween: [ "transform", "${_EF_Dust_34_Se012}", "scaleY", '2', { fromValue: '2'}], position: 2155, duration: 0 },
            { id: "eid110", tween: [ "transform", "${_EF_Dust_34_Se022}", "scaleX", '2', { fromValue: '2'}], position: 2155, duration: 0 },
            { id: "eid103", tween: [ "transform", "${_EF_Light_39}", "scaleX", '4.36', { fromValue: '1.79'}], position: 2080, duration: 400 },
            { id: "eid13", tween: [ "transform", "${_mon_02}", "skewX", '54deg', { fromValue: '0deg'}], position: 330, duration: 500 },
            { id: "eid280", tween: [ "transform", "${_mon_02}", "skewX", '54deg', { fromValue: '54deg'}], position: 2265, duration: 0 },
            { id: "eid72", tween: [ "style", "${_hm}", "-webkit-transform-origin", [50,50], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,50]}], position: 1830, duration: 0 },
            { id: "eid361", tween: [ "style", "${_hm}", "-moz-transform-origin", [50,50], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,50]}], position: 1830, duration: 0 },
            { id: "eid362", tween: [ "style", "${_hm}", "-ms-transform-origin", [50,50], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,50]}], position: 1830, duration: 0 },
            { id: "eid363", tween: [ "style", "${_hm}", "msTransformOrigin", [50,50], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,50]}], position: 1830, duration: 0 },
            { id: "eid364", tween: [ "style", "${_hm}", "-o-transform-origin", [50,50], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,50]}], position: 1830, duration: 0 },
            { id: "eid175", tween: [ "style", "${_EF_Light_39}", "top", '138px', { fromValue: '138px'}], position: 2480, duration: 0 },
            { id: "eid26", tween: [ "transform", "${_hm}", "scaleX", '-0.975', { fromValue: '-0.975'}], position: 1330, duration: 0 },
            { id: "eid68", tween: [ "transform", "${_hm}", "scaleX", '-0.975', { fromValue: '-0.975'}], position: 1830, duration: 0 },
            { id: "eid343", tween: [ "transform", "${_hm}", "scaleX", '-0.975', { fromValue: '-0.975'}], position: 2080, duration: 0 },
            { id: "eid285", tween: [ "transform", "${_hm}", "scaleX", '-0.975', { fromValue: '-0.975'}], position: 2265, duration: 0 },
            { id: "eid63", tween: [ "style", "${_hm}", "left", '271.9px', { fromValue: '125.72px'}], position: 1330, duration: 250 },
            { id: "eid74", tween: [ "style", "${_hm}", "left", '195.32px', { fromValue: '271.9px'}], position: 1830, duration: 125 },
            { id: "eid76", tween: [ "style", "${_hm}", "left", '92.88px', { fromValue: '195.32px'}], position: 1955, duration: 125 },
            { id: "eid352", tween: [ "style", "${_hm}", "left", '92.87px', { fromValue: '92.88px'}], position: 2080, duration: 75 },
            { id: "eid353", tween: [ "style", "${_hm}", "left", '121.87px', { fromValue: '92.87px'}], position: 2155, duration: 110 },
            { id: "eid6", tween: [ "transform", "${_mon_02}", "rotateZ", '0deg', { fromValue: '0deg'}], position: 330, duration: 0 },
            { id: "eid347", tween: [ "transform", "${_mon_02}", "rotateZ", '0deg', { fromValue: '0deg'}], position: 2080, duration: 0 },
            { id: "eid284", tween: [ "transform", "${_mon_02}", "rotateZ", '0deg', { fromValue: '0deg'}], position: 2265, duration: 0 },
            { id: "eid18", tween: [ "style", "${_mon_02}", "top", '138.22px', { fromValue: '45px'}], position: 330, duration: 500 },
            { id: "eid354", tween: [ "style", "${_mon_02}", "top", '162.22px', { fromValue: '138.22px'}], position: 2080, duration: 75 },
            { id: "eid355", tween: [ "style", "${_mon_02}", "top", '138.22px', { fromValue: '162.22px'}], position: 2155, duration: 110 },
            { id: "eid317", tween: [ "style", "${_mon_02}", "top", '109.22px', { fromValue: '138.22px'}], position: 2265, duration: 65 },
            { id: "eid318", tween: [ "style", "${_mon_02}", "top", '152.78px', { fromValue: '109.22px'}], position: 2330, duration: 65 },
            { id: "eid322", tween: [ "style", "${_mon_02}", "top", '118.22px', { fromValue: '152.78px'}], position: 2395, duration: 85 },
            { id: "eid326", tween: [ "style", "${_mon_02}", "top", '148.22px', { fromValue: '118.22px'}], position: 2480, duration: 100 },
            { id: "eid329", tween: [ "style", "${_mon_02}", "top", '122.22px', { fromValue: '148.22px'}], position: 2580, duration: 85 },
            { id: "eid16", tween: [ "transform", "${_mon_02}", "skewY", '1deg', { fromValue: '0deg'}], position: 330, duration: 500 },
            { id: "eid282", tween: [ "transform", "${_mon_02}", "skewY", '1deg', { fromValue: '1deg'}], position: 2265, duration: 0 },
            { id: "eid17", tween: [ "style", "${_mon_02}", "left", '57.07px', { fromValue: '65px'}], position: 330, duration: 500 },
            { id: "eid341", tween: [ "style", "${_mon_02}", "left", '57.07px', { fromValue: '57.07px'}], position: 2080, duration: 0 },
            { id: "eid315", tween: [ "style", "${_mon_02}", "left", '55.07px', { fromValue: '57.07px'}], position: 2265, duration: 65 },
            { id: "eid316", tween: [ "style", "${_mon_02}", "left", '55.93px', { fromValue: '55.07px'}], position: 2330, duration: 65 },
            { id: "eid321", tween: [ "style", "${_mon_02}", "left", '57.07px', { fromValue: '55.93px'}], position: 2395, duration: 85 },
            { id: "eid325", tween: [ "style", "${_mon_02}", "left", '56.07px', { fromValue: '57.07px'}], position: 2480, duration: 100 },
            { id: "eid330", tween: [ "style", "${_mon_02}", "left", '55.07px', { fromValue: '56.07px'}], position: 2580, duration: 85 },
            { id: "eid92", tween: [ "style", "${_EF_Dust_34_Se022}", "opacity", '1', { fromValue: '0'}], position: 2265, duration: 32 },
            { id: "eid96", tween: [ "style", "${_EF_Dust_34_Se022}", "opacity", '0', { fromValue: '1'}], position: 2297, duration: 183 },
            { id: "eid19", tween: [ "style", "${_mon_02}", "height", '157.54210555364px', { fromValue: '157.54210555364px'}], position: 830, duration: 0 },
            { id: "eid278", tween: [ "style", "${_mon_02}", "height", '157.54210555364px', { fromValue: '157.54210555364px'}], position: 2265, duration: 0 },
            { id: "eid20", tween: [ "style", "${_mon_02}", "width", '141.18115569856px', { fromValue: '141.18115569856px'}], position: 830, duration: 0 },
            { id: "eid276", tween: [ "style", "${_mon_02}", "width", '141.18115569856px', { fromValue: '141.18115569856px'}], position: 2265, duration: 0 },
            { id: "eid61", tween: [ "transform", "${_hm}", "rotateZ", '54deg', { fromValue: '0deg'}], position: 1330, duration: 250 },
            { id: "eid73", tween: [ "transform", "${_hm}", "rotateZ", '-90deg', { fromValue: '54deg'}], position: 1830, duration: 250 },
            { id: "eid356", tween: [ "transform", "${_hm}", "rotateZ", '-74deg', { fromValue: '-90deg'}], position: 2080, duration: 185 },
            { id: "eid115", tween: [ "style", "${_EF_Dust_34_Se002}", "opacity", '0', { fromValue: '0'}], position: 2055, duration: 0 },
            { id: "eid116", tween: [ "style", "${_EF_Dust_34_Se002}", "opacity", '0', { fromValue: '0'}], position: 2060, duration: 0 },
            { id: "eid113", tween: [ "style", "${_EF_Dust_34_Se002}", "opacity", '0', { fromValue: '0'}], position: 2080, duration: 0 },
            { id: "eid88", tween: [ "style", "${_EF_Dust_34_Se002}", "opacity", '0', { fromValue: '1'}], position: 2155, duration: 20 },
            { id: "eid166", tween: [ "style", "${_EF_Dust_34_Se002}", "opacity", '0', { fromValue: '0'}], position: 2480, duration: 0 },
            { id: "eid172", tween: [ "style", "${_EF_Dust_34_Se002}", "left", '64px', { fromValue: '64px'}], position: 2480, duration: 0 },
            { id: "eid104", tween: [ "transform", "${_EF_Light_39}", "scaleY", '4.36', { fromValue: '1.79'}], position: 2080, duration: 400 },
            { id: "eid170", tween: [ "style", "${_EF_Dust_34_Se022}", "left", '64px', { fromValue: '64px'}], position: 2480, duration: 0 },
            { id: "eid62", tween: [ "style", "${_hm}", "top", '31.92px', { fromValue: '-8.25px'}], position: 1330, duration: 250 },
            { id: "eid75", tween: [ "style", "${_hm}", "top", '-24.65px', { fromValue: '31.92px'}], position: 1830, duration: 125 },
            { id: "eid77", tween: [ "style", "${_hm}", "top", '3.06px', { fromValue: '-24.65px'}], position: 1955, duration: 125 },
            { id: "eid350", tween: [ "style", "${_hm}", "top", '27.05px', { fromValue: '3.06px'}], position: 2080, duration: 75 },
            { id: "eid351", tween: [ "style", "${_hm}", "top", '3.66px', { fromValue: '27.05px'}], position: 2155, duration: 110 },
            { id: "eid313", tween: [ "style", "${_hm}", "top", '-25.95px', { fromValue: '3.66px'}], position: 2265, duration: 65 },
            { id: "eid314", tween: [ "style", "${_hm}", "top", '17.63px', { fromValue: '-25.95px'}], position: 2330, duration: 65 },
            { id: "eid320", tween: [ "style", "${_hm}", "top", '-16.95px', { fromValue: '17.63px'}], position: 2395, duration: 85 },
            { id: "eid324", tween: [ "style", "${_hm}", "top", '13.05px', { fromValue: '-16.95px'}], position: 2480, duration: 100 },
            { id: "eid327", tween: [ "style", "${_hm}", "top", '-12.95px', { fromValue: '13.05px'}], position: 2580, duration: 85 },
            { id: "eid25", tween: [ "style", "${_hm}", "height", '250px', { fromValue: '250px'}], position: 1330, duration: 0 },
            { id: "eid70", tween: [ "style", "${_hm}", "height", '250px', { fromValue: '250px'}], position: 1830, duration: 0 },
            { id: "eid277", tween: [ "style", "${_hm}", "height", '250px', { fromValue: '250px'}], position: 2265, duration: 0 },
            { id: "eid5", tween: [ "style", "${_mon_02}", "opacity", '1', { fromValue: '1'}], position: 330, duration: 0 },
            { id: "eid349", tween: [ "style", "${_mon_02}", "opacity", '1', { fromValue: '1'}], position: 2080, duration: 0 },
            { id: "eid270", tween: [ "style", "${_mon_02}", "opacity", '1', { fromValue: '1'}], position: 2265, duration: 0 },
            { id: "eid168", tween: [ "style", "${_mon_02}", "opacity", '1', { fromValue: '1'}], position: 2480, duration: 0 },
            { id: "eid169", tween: [ "style", "${_EF_Light_39}", "left", '64px', { fromValue: '64px'}], position: 2480, duration: 0 },
            { id: "eid111", tween: [ "transform", "${_EF_Dust_34_Se022}", "scaleY", '2', { fromValue: '2'}], position: 2155, duration: 0 }         ]
      }
   }
}
};


Edge.registerCompositionDefn(compId, symbols, fonts, resources);

/**
 * Adobe Edge DOM Ready Event Handler
 */
$(window).ready(function() {
     Edge.launchComposition(compId);
});
})(jQuery, AdobeEdge, "EDGE-15128250");
