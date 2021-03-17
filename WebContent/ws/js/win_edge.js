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
   build: "1.0.1.204",
   baseState: "Base State",
   initialState: "Base State",
   gpuAccelerate: false,
   resizeInstances: false,
   content: {
         dom: [
         {
            id:'youwin',
            type:'image',
            rect:['-40px','-32px','400px','321px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"youwin.jpg",'0px','0px'],
            transform:[[],[],[],['0','0']]
         },
         {
            id:'youlose',
            type:'image',
            rect:['-40px','-32px','400px','321px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"youlose.jpg",'0px','0px'],
            transform:[[],[],[],['0.15','0']]
         },
         {
            id:'youwinCopy',
            type:'image',
            rect:['-40px','-32px','400px','321px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"youwin.jpg",'0px','0px'],
            transform:[[],[],[],['0.8','0.8']]
         }],
         symbolInstances: [

         ]
      },
   states: {
      "Base State": {
         "${_Stage}": [
            ["color", "background-color", 'rgba(0,0,0,1.00)'],
            ["style", "width", '320px'],
            ["style", "height", '256px'],
            ["style", "overflow", 'hidden']
         ],
         "${_youwinCopy}": [
            ["style", "-webkit-transform-origin", [50,50], {valueTemplate:'@@0@@% @@1@@%'} ],
            ["style", "-moz-transform-origin", [50,50],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-ms-transform-origin", [50,50],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "msTransformOrigin", [50,50],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-o-transform-origin", [50,50],{valueTemplate:'@@0@@% @@1@@%'}],
            ["transform", "rotateZ", '0deg'],
            ["transform", "scaleX", '0.8'],
            ["style", "opacity", '0'],
            ["style", "left", '-40px'],
            ["style", "width", '400px'],
            ["style", "top", '-32.08px'],
            ["transform", "scaleY", '0.8'],
            ["transform", "skewX", '0deg'],
            ["style", "height", '321px'],
            ["transform", "skewY", '0deg']
         ],
         "${_youwin}": [
            ["style", "-webkit-transform-origin", [50,50], {valueTemplate:'@@0@@% @@1@@%'} ],
            ["style", "-moz-transform-origin", [50,50],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-ms-transform-origin", [50,50],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "msTransformOrigin", [50,50],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-o-transform-origin", [50,50],{valueTemplate:'@@0@@% @@1@@%'}],
            ["transform", "rotateZ", '0deg'],
            ["transform", "scaleX", '0.16'],
            ["style", "opacity", '1'],
            ["style", "left", '-40px'],
            ["style", "width", '400px'],
            ["style", "top", '-32.08px'],
            ["transform", "scaleY", '0'],
            ["transform", "skewX", '0deg'],
            ["style", "height", '321px'],
            ["transform", "skewY", '0deg']
         ],
         "${_youlose}": [
            ["style", "top", '-32.41px'],
            ["transform", "scaleY", '0'],
            ["transform", "scaleX", '0'],
            ["style", "opacity", '0'],
            ["style", "left", '-40px']
         ]
      }
   },
   timelines: {
      "Default Timeline": {
         fromState: "Base State",
         toState: "",
         duration: 1920,
         autoPlay: true,
         timeline: [
            { id: "eid120", tween: [ "style", "${_youlose}", "opacity", '0', { fromValue: '0'}], position: 300, duration: 0 },
            { id: "eid136", tween: [ "style", "${_youlose}", "opacity", '1', { fromValue: '0'}], position: 593, duration: 0 },
            { id: "eid128", tween: [ "style", "${_youlose}", "opacity", '1', { fromValue: '1'}], position: 900, duration: 0 },
            { id: "eid138", tween: [ "style", "${_youlose}", "opacity", '0', { fromValue: '1'}], position: 1193, duration: 0 },
            { id: "eid139", tween: [ "style", "${_youlose}", "opacity", '0', { fromValue: '0'}], position: 1500, duration: 0 },
            { id: "eid114", tween: [ "transform", "${_youlose}", "scaleX", '0.2', { fromValue: '0'}], position: 0, duration: 300 },
            { id: "eid121", tween: [ "transform", "${_youlose}", "scaleX", '0.8', { fromValue: '0.2'}], position: 300, duration: 1200 },
            { id: "eid94", tween: [ "transform", "${_youwin}", "scaleX", '0.2', { fromValue: '0.16'}], position: 0, duration: 300 },
            { id: "eid96", tween: [ "transform", "${_youwin}", "scaleX", '0.4', { fromValue: '0.2'}], position: 300, duration: 600 },
            { id: "eid100", tween: [ "transform", "${_youwin}", "scaleX", '0.79602', { fromValue: '0.4'}], position: 900, duration: 600 },
            { id: "eid153", tween: [ "transform", "${_youwinCopy}", "scaleX", '1.45', { fromValue: '0.8'}], position: 1420, duration: 500 },
            { id: "eid95", tween: [ "transform", "${_youwin}", "scaleY", '0.2', { fromValue: '0'}], position: 0, duration: 300 },
            { id: "eid97", tween: [ "transform", "${_youwin}", "scaleY", '0', { fromValue: '0.2'}], position: 300, duration: 300 },
            { id: "eid107", tween: [ "transform", "${_youwin}", "scaleY", '0.4', { fromValue: '0'}], position: 600, duration: 300 },
            { id: "eid108", tween: [ "transform", "${_youwin}", "scaleY", '0', { fromValue: '0.4'}], position: 900, duration: 300 },
            { id: "eid103", tween: [ "transform", "${_youwin}", "scaleY", '0.8', { fromValue: '0'}], position: 1200, duration: 300 },
            { id: "eid154", tween: [ "transform", "${_youwinCopy}", "scaleY", '1.45', { fromValue: '0.8'}], position: 1420, duration: 500 },
            { id: "eid130", tween: [ "style", "${_youwin}", "opacity", '1', { fromValue: '1'}], position: 1500, duration: 0 },
            { id: "eid113", tween: [ "transform", "${_youlose}", "scaleY", '0.2', { fromValue: '0'}], position: 0, duration: 300 },
            { id: "eid115", tween: [ "transform", "${_youlose}", "scaleY", '0', { fromValue: '0.2'}], position: 300, duration: 300 },
            { id: "eid116", tween: [ "transform", "${_youlose}", "scaleY", '-0.5', { fromValue: '0'}], position: 600, duration: 300 },
            { id: "eid117", tween: [ "transform", "${_youlose}", "scaleY", '0', { fromValue: '-0.5'}], position: 900, duration: 300 },
            { id: "eid118", tween: [ "transform", "${_youlose}", "scaleY", '0.8', { fromValue: '0'}], position: 1200, duration: 300 },
            { id: "eid152", tween: [ "style", "${_youwinCopy}", "opacity", '1', { fromValue: '0'}], position: 1405, duration: 15 },
            { id: "eid155", tween: [ "style", "${_youwinCopy}", "opacity", '0', { fromValue: '1'}], position: 1420, duration: 500 }         ]
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
