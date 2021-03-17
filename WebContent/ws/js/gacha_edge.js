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
            id:'EF_B_EnMaFail_02',
            type:'image',
            rect:['38px','57px','256px','256px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"EF_B_EnMaFail_02.png",'0px','0px']
         },
         {
            id:'UI_Touch',
            type:'image',
            rect:['191px','207px','81px','77px','auto','auto'],
            opacity:0,
            fill:["rgba(0,0,0,0)",im+"UI_Touch.png",'0px','0px']
         },
         {
            id:'EF_Elec_02_Se04',
            type:'image',
            rect:['38px','-9px','118px','291px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"EF_Elec_02_Se04.png",'0px','0px']
         },
         {
            id:'EF_Elec_02_Se02',
            type:'image',
            rect:['139px','3px','144px','301px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"EF_Elec_02_Se02.png",'0px','0px']
         }],
         symbolInstances: [

         ]
      },
   states: {
      "Base State": {
         "${_EF_Elec_02_Se04}": [
            ["style", "top", '-6px'],
            ["transform", "scaleY", '1'],
            ["transform", "scaleX", '1'],
            ["style", "height", '341px'],
            ["style", "opacity", '0'],
            ["style", "left", '54px'],
            ["style", "width", '144px']
         ],
         "${_UI_Touch}": [
            ["style", "top", '207px'],
            ["style", "height", '77px'],
            ["style", "opacity", '0'],
            ["style", "left", '191px'],
            ["style", "width", '81px']
         ],
         "${_Stage}": [
            ["color", "background-color", 'rgba(0,0,0,1.00)'],
            ["style", "width", '320px'],
            ["style", "height", '600px'],
            ["style", "overflow", 'hidden']
         ],
         "${_EF_B_EnMaFail_02}": [
            ["style", "top", '44px'],
            ["transform", "scaleY", '1'],
            ["transform", "scaleX", '1'],
            ["style", "opacity", '0'],
            ["style", "left", '32px'],
            ["style", "-webkit-transform-origin", [50,50], {valueTemplate:'@@0@@% @@1@@%'} ],
            ["style", "-moz-transform-origin", [50,50],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-ms-transform-origin", [50,50],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "msTransformOrigin", [50,50],{valueTemplate:'@@0@@% @@1@@%'}],
            ["style", "-o-transform-origin", [50,50],{valueTemplate:'@@0@@% @@1@@%'}]
         ],
         "${_EF_Elec_02_Se02}": [
            ["style", "top", '3px'],
            ["transform", "scaleY", '1'],
            ["transform", "scaleX", '1'],
            ["style", "height", '355px'],
            ["style", "opacity", '0'],
            ["style", "left", '139px'],
            ["style", "width", '144px']
         ]
      }
   },
   timelines: {
      "Default Timeline": {
         fromState: "Base State",
         toState: "",
         duration: 5205,
         autoPlay: true,
         timeline: [
            { id: "eid8", tween: [ "style", "${_EF_B_EnMaFail_02}", "left", '32px', { fromValue: '32px'}], position: 0, duration: 0 },
            { id: "eid73", tween: [ "style", "${_EF_B_EnMaFail_02}", "left", '31.52px', { fromValue: '32px'}], position: 3455, duration: 750 },
            { id: "eid76", tween: [ "style", "${_EF_B_EnMaFail_02}", "left", '31.52px', { fromValue: '31.52px'}], position: 4705, duration: 0 },
            { id: "eid96", tween: [ "style", "${_EF_Elec_02_Se02}", "height", '355px', { fromValue: '355px'}], position: 3000, duration: 0 },
            { id: "eid44", tween: [ "style", "${_EF_Elec_02_Se02}", "left", '59px', { fromValue: '139px'}], position: 1910, duration: 600 },
            { id: "eid89", tween: [ "style", "${_EF_Elec_02_Se02}", "left", '119px', { fromValue: '59px'}], position: 2950, duration: 50 },
            { id: "eid93", tween: [ "style", "${_UI_Touch}", "opacity", '1', { fromValue: '0.000000'}], position: 5000, duration: 20 },
            { id: "eid6", tween: [ "style", "${_EF_B_EnMaFail_02}", "opacity", '0', { fromValue: '0'}], position: 0, duration: 0 },
            { id: "eid11", tween: [ "style", "${_EF_B_EnMaFail_02}", "opacity", '1', { fromValue: '0'}], position: 250, duration: 290 },
            { id: "eid14", tween: [ "style", "${_EF_B_EnMaFail_02}", "opacity", '0.0859375', { fromValue: '1'}], position: 540, duration: 270 },
            { id: "eid15", tween: [ "style", "${_EF_B_EnMaFail_02}", "opacity", '1', { fromValue: '0.0859375'}], position: 810, duration: 440 },
            { id: "eid65", tween: [ "style", "${_EF_B_EnMaFail_02}", "opacity", '1', { fromValue: '1'}], position: 3455, duration: 0 },
            { id: "eid81", tween: [ "style", "${_EF_B_EnMaFail_02}", "opacity", '1', { fromValue: '1'}], position: 4705, duration: 500 },
            { id: "eid24", tween: [ "style", "${_EF_Elec_02_Se04}", "left", '54px', { fromValue: '54px'}], position: 1910, duration: 0 },
            { id: "eid61", tween: [ "style", "${_EF_Elec_02_Se04}", "left", '107px', { fromValue: '54px'}], position: 2550, duration: 20 },
            { id: "eid72", tween: [ "transform", "${_EF_B_EnMaFail_02}", "scaleY", '1.84', { fromValue: '1'}], position: 3455, duration: 750 },
            { id: "eid79", tween: [ "transform", "${_EF_B_EnMaFail_02}", "scaleY", '1.84', { fromValue: '1.84'}], position: 4705, duration: 0 },
            { id: "eid70", tween: [ "style", "${_EF_B_EnMaFail_02}", "-webkit-transform-origin", [50,50], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,50]}], position: 3455, duration: 0 },
            { id: "eid105", tween: [ "style", "${_EF_B_EnMaFail_02}", "-moz-transform-origin", [50,50], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,50]}], position: 3455, duration: 0 },
            { id: "eid106", tween: [ "style", "${_EF_B_EnMaFail_02}", "-ms-transform-origin", [50,50], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,50]}], position: 3455, duration: 0 },
            { id: "eid107", tween: [ "style", "${_EF_B_EnMaFail_02}", "msTransformOrigin", [50,50], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,50]}], position: 3455, duration: 0 },
            { id: "eid108", tween: [ "style", "${_EF_B_EnMaFail_02}", "-o-transform-origin", [50,50], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,50]}], position: 3455, duration: 0 },
            { id: "eid80", tween: [ "style", "${_EF_B_EnMaFail_02}", "-webkit-transform-origin", [50,50], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,50]}], position: 4705, duration: 0 },
            { id: "eid109", tween: [ "style", "${_EF_B_EnMaFail_02}", "-moz-transform-origin", [50,50], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,50]}], position: 4705, duration: 0 },
            { id: "eid110", tween: [ "style", "${_EF_B_EnMaFail_02}", "-ms-transform-origin", [50,50], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,50]}], position: 4705, duration: 0 },
            { id: "eid111", tween: [ "style", "${_EF_B_EnMaFail_02}", "msTransformOrigin", [50,50], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,50]}], position: 4705, duration: 0 },
            { id: "eid112", tween: [ "style", "${_EF_B_EnMaFail_02}", "-o-transform-origin", [50,50], { valueTemplate: '@@0@@% @@1@@%', fromValue: [50,50]}], position: 4705, duration: 0 },
            { id: "eid31", tween: [ "transform", "${_EF_Elec_02_Se02}", "scaleX", '1', { fromValue: '1'}], position: 1910, duration: 0 },
            { id: "eid87", tween: [ "transform", "${_EF_Elec_02_Se02}", "scaleX", '1', { fromValue: '1'}], position: 2950, duration: 0 },
            { id: "eid18", tween: [ "style", "${_EF_Elec_02_Se02}", "opacity", '0', { fromValue: '0'}], position: 0, duration: 0 },
            { id: "eid20", tween: [ "style", "${_EF_Elec_02_Se02}", "opacity", '1', { fromValue: '0.000000'}], position: 1410, duration: 70 },
            { id: "eid21", tween: [ "style", "${_EF_Elec_02_Se02}", "opacity", '0', { fromValue: '1'}], position: 1480, duration: 430 },
            { id: "eid29", tween: [ "style", "${_EF_Elec_02_Se02}", "opacity", '0', { fromValue: '1'}], position: 2520, duration: 430 },
            { id: "eid82", tween: [ "style", "${_EF_Elec_02_Se02}", "opacity", '0', { fromValue: '1'}], position: 3000, duration: 750 },
            { id: "eid4", tween: [ "style", "${_EF_Elec_02_Se04}", "opacity", '0', { fromValue: '0'}], position: 0, duration: 0 },
            { id: "eid27", tween: [ "style", "${_EF_Elec_02_Se04}", "opacity", '1', { fromValue: '0'}], position: 1910, duration: 125 },
            { id: "eid28", tween: [ "style", "${_EF_Elec_02_Se04}", "opacity", '0', { fromValue: '1'}], position: 2035, duration: 485 },
            { id: "eid60", tween: [ "style", "${_EF_Elec_02_Se04}", "opacity", '0.042812496423721', { fromValue: '0'}], position: 2550, duration: 0 },
            { id: "eid49", tween: [ "style", "${_EF_Elec_02_Se04}", "opacity", '0', { fromValue: '1'}], position: 2675, duration: 485 },
            { id: "eid57", tween: [ "transform", "${_EF_Elec_02_Se04}", "scaleY", '1', { fromValue: '1'}], position: 2535, duration: 0 },
            { id: "eid45", tween: [ "style", "${_EF_Elec_02_Se02}", "top", '21px', { fromValue: '3px'}], position: 1910, duration: 600 },
            { id: "eid90", tween: [ "style", "${_EF_Elec_02_Se02}", "top", '1px', { fromValue: '21px'}], position: 2950, duration: 50 },
            { id: "eid22", tween: [ "style", "${_EF_Elec_02_Se04}", "height", '341px', { fromValue: '341px'}], position: 1910, duration: 0 },
            { id: "eid47", tween: [ "style", "${_EF_Elec_02_Se04}", "height", '341px', { fromValue: '341px'}], position: 2550, duration: 0 },
            { id: "eid71", tween: [ "transform", "${_EF_B_EnMaFail_02}", "scaleX", '1.84', { fromValue: '1'}], position: 3455, duration: 750 },
            { id: "eid78", tween: [ "transform", "${_EF_B_EnMaFail_02}", "scaleX", '1.84', { fromValue: '1.84'}], position: 4705, duration: 0 },
            { id: "eid23", tween: [ "style", "${_EF_Elec_02_Se04}", "width", '144px', { fromValue: '144px'}], position: 1910, duration: 0 },
            { id: "eid51", tween: [ "style", "${_EF_Elec_02_Se04}", "width", '144px', { fromValue: '144px'}], position: 2550, duration: 0 },
            { id: "eid32", tween: [ "transform", "${_EF_Elec_02_Se02}", "scaleY", '1', { fromValue: '1'}], position: 1910, duration: 0 },
            { id: "eid88", tween: [ "transform", "${_EF_Elec_02_Se02}", "scaleY", '1', { fromValue: '1'}], position: 2950, duration: 0 },
            { id: "eid25", tween: [ "style", "${_EF_Elec_02_Se04}", "top", '-6px', { fromValue: '-6px'}], position: 1910, duration: 0 },
            { id: "eid63", tween: [ "style", "${_EF_Elec_02_Se04}", "top", '-6px', { fromValue: '-6px'}], position: 2550, duration: 0 },
            { id: "eid64", tween: [ "style", "${_EF_Elec_02_Se04}", "top", '-6px', { fromValue: '-6px'}], position: 2570, duration: 0 },
            { id: "eid56", tween: [ "transform", "${_EF_Elec_02_Se04}", "scaleX", '1', { fromValue: '1'}], position: 2535, duration: 0 },
            { id: "eid9", tween: [ "style", "${_EF_B_EnMaFail_02}", "top", '44px', { fromValue: '44px'}], position: 0, duration: 0 },
            { id: "eid74", tween: [ "style", "${_EF_B_EnMaFail_02}", "top", '60px', { fromValue: '44px'}], position: 3455, duration: 750 },
            { id: "eid77", tween: [ "style", "${_EF_B_EnMaFail_02}", "top", '60px', { fromValue: '60px'}], position: 4705, duration: 0 }         ]
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
})(jQuery, AdobeEdge, "EDGE-16467783");
