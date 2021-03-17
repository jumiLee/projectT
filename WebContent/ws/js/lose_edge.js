/**
 * Adobe Edge: symbol definitions
 */
(function($, Edge, compId){
//images folder
var im='images/';

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
            id:'youlose',
            type:'image',
            rect:['-40px','-32px','400px','321px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"youlose.jpg",'0px','0px'],
            transform:[[],[],[],['0.15','0']]
         },
         {
            id:'youwin',
            type:'image',
            rect:['-40px','-32px','400px','321px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"youwin.jpg",'0px','0px'],
            transform:[[],[],[],['0','0']]
         },
         {
            id:'EF_B_EnMaFail_02',
            type:'image',
            rect:['32px','13px','256px','256px','auto','auto'],
            opacity:0,
            fill:["rgba(0,0,0,0)",im+"EF_B_EnMaFail_02.png",'0px','0px']
         }],
         symbolInstances: [

         ]
      },
   states: {
      "Base State": {
         "${_Stage}": [
            ["color", "background-color", 'rgba(0,0,0,1.00)'],
            ["style", "overflow", 'hidden'],
            ["style", "height", '256px'],
            ["style", "width", '320px']
         ],
         "${_EF_B_EnMaFail_02}": [
            ["style", "top", '0px'],
            ["transform", "scaleY", '1'],
            ["transform", "scaleX", '1'],
            ["style", "opacity", '0'],
            ["style", "left", '32px']
         ],
         "${_youwin}": [
            ["style", "-webkit-transform-origin", [50,50], {valueTemplate:'@@0@@% @@1@@%'} ],
            ["style", "-moz-transform-origin", [50,50],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-ms-transform-origin", [50,50],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "msTransformOrigin", [50,50],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-o-transform-origin", [50,50],{valueTemplate:'@@0@@% @@1@@%'}],
            ["transform", "rotateZ", '0deg'],
            ["transform", "scaleX", '0.16'],
            ["style", "opacity", '0.0078125'],
            ["style", "left", '-40px'],
            ["style", "width", '400px'],
            ["style", "top", '-32.08px'],
            ["transform", "scaleY", '0'],
            ["transform", "skewX", '0deg'],
            ["style", "height", '321px'],
            ["transform", "skewY", '0deg']
         ],
         "${_youlose}": [
            ["transform", "rotateZ", '0deg'],
            ["transform", "scaleX", '0.16'],
            ["style", "background-size", [100,100], {valueTemplate:'@@0@@% @@1@@%'} ],
            ["style", "left", '-40px'],
            ["style", "width", '400px'],
            ["style", "top", '-32.41px'],
            ["transform", "scaleY", '-0.01'],
            ["transform", "skewX", '0deg'],
            ["style", "height", '321px'],
            ["style", "opacity", '1'],
            ["style", "background-position", [0,0], {valueTemplate:'@@0@@px @@1@@px'} ],
            ["transform", "skewY", '0deg']
         ]
      }
   },
   timelines: {
      "Default Timeline": {
         fromState: "Base State",
         toState: "",
         duration: 2250,
         autoPlay: true,
         timeline: [
            { id: "eid197", tween: [ "style", "${_youlose}", "width", '400px', { fromValue: '400px'}], position: 1500, duration: 0 },
            { id: "eid214", tween: [ "style", "${_EF_B_EnMaFail_02}", "left", '32px', { fromValue: '32px'}], position: 1500, duration: 0 },
            { id: "eid114", tween: [ "transform", "${_youlose}", "scaleX", '0.2', { fromValue: '0.16'}], position: 0, duration: 300 },
            { id: "eid121", tween: [ "transform", "${_youlose}", "scaleX", '0.8', { fromValue: '0.2'}], position: 300, duration: 1200 },
            { id: "eid196", tween: [ "style", "${_youlose}", "background-position", [0,0], { valueTemplate: '@@0@@px @@1@@px', fromValue: [0,0]}], position: 1500, duration: 0 },
            { id: "eid190", tween: [ "style", "${_youlose}", "left", '-40px', { fromValue: '-40px'}], position: 1500, duration: 0 },
            { id: "eid201", tween: [ "style", "${_youlose}", "height", '321px', { fromValue: '321px'}], position: 1500, duration: 0 },
            { id: "eid200", tween: [ "transform", "${_youlose}", "skewY", '0deg', { fromValue: '0deg'}], position: 1500, duration: 0 },
            { id: "eid221", tween: [ "transform", "${_EF_B_EnMaFail_02}", "scaleY", '1.75', { fromValue: '1'}], position: 1250, duration: 1000 },
            { id: "eid183", tween: [ "style", "${_youlose}", "opacity", '0', { fromValue: '1'}], position: 300, duration: 600 },
            { id: "eid185", tween: [ "style", "${_youlose}", "opacity", '1', { fromValue: '0'}], position: 900, duration: 600 },
            { id: "eid94", tween: [ "transform", "${_youwin}", "scaleX", '0.2', { fromValue: '0.16'}], position: 0, duration: 300 },
            { id: "eid96", tween: [ "transform", "${_youwin}", "scaleX", '0.4', { fromValue: '0.2'}], position: 300, duration: 600 },
            { id: "eid100", tween: [ "transform", "${_youwin}", "scaleX", '0.79602', { fromValue: '0.4'}], position: 900, duration: 600 },
            { id: "eid220", tween: [ "transform", "${_EF_B_EnMaFail_02}", "scaleX", '1.75', { fromValue: '1'}], position: 1250, duration: 1000 },
            { id: "eid95", tween: [ "transform", "${_youwin}", "scaleY", '0.2', { fromValue: '0'}], position: 0, duration: 300 },
            { id: "eid97", tween: [ "transform", "${_youwin}", "scaleY", '0', { fromValue: '0.2'}], position: 300, duration: 300 },
            { id: "eid107", tween: [ "transform", "${_youwin}", "scaleY", '-0.4', { fromValue: '0'}], position: 600, duration: 300 },
            { id: "eid108", tween: [ "transform", "${_youwin}", "scaleY", '0', { fromValue: '-0.4'}], position: 900, duration: 300 },
            { id: "eid103", tween: [ "transform", "${_youwin}", "scaleY", '0.8', { fromValue: '0'}], position: 1200, duration: 300 },
            { id: "eid222", tween: [ "style", "${_EF_B_EnMaFail_02}", "top", '48px', { fromValue: '0px'}], position: 1250, duration: 1000 },
            { id: "eid178", tween: [ "style", "${_youwin}", "opacity", '1', { fromValue: '1'}], position: 600, duration: 0 },
            { id: "eid181", tween: [ "style", "${_youwin}", "opacity", '0', { fromValue: '1'}], position: 1195, duration: 10 },
            { id: "eid182", tween: [ "style", "${_youwin}", "opacity", '0.0234375', { fromValue: '0'}], position: 1205, duration: 295 },
            { id: "eid113", tween: [ "transform", "${_youlose}", "scaleY", '0.2', { fromValue: '-0.01'}], position: 0, duration: 300 },
            { id: "eid115", tween: [ "transform", "${_youlose}", "scaleY", '0', { fromValue: '0.2'}], position: 300, duration: 300 },
            { id: "eid116", tween: [ "transform", "${_youlose}", "scaleY", '-0.5', { fromValue: '0'}], position: 600, duration: 300 },
            { id: "eid117", tween: [ "transform", "${_youlose}", "scaleY", '0', { fromValue: '-0.5'}], position: 900, duration: 300 },
            { id: "eid118", tween: [ "transform", "${_youlose}", "scaleY", '0.8', { fromValue: '0'}], position: 1200, duration: 300 },
            { id: "eid195", tween: [ "style", "${_youlose}", "background-size", [100,100], { valueTemplate: '@@0@@% @@1@@%', fromValue: [100,100]}], position: 1500, duration: 0 },
            { id: "eid219", tween: [ "style", "${_EF_B_EnMaFail_02}", "opacity", '1', { fromValue: '0'}], position: 1250, duration: 500 },
            { id: "eid223", tween: [ "style", "${_EF_B_EnMaFail_02}", "opacity", '0', { fromValue: '1'}], position: 1750, duration: 500 },
            { id: "eid194", tween: [ "transform", "${_youlose}", "rotateZ", '0deg', { fromValue: '0deg'}], position: 1500, duration: 0 },
            { id: "eid202", tween: [ "style", "${_youlose}", "top", '-32.41px', { fromValue: '-32.41px'}], position: 1500, duration: 0 },
            { id: "eid199", tween: [ "transform", "${_youlose}", "skewX", '0deg', { fromValue: '0deg'}], position: 1500, duration: 0 }         ]
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
})(jQuery, AdobeEdge, "EDGE-261919171");
