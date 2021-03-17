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
            id:'missionbg2',
            type:'image',
            rect:['0px','91px','320px','184px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"missionbg.jpg",'0px','0px']
         },
         {
            id:'boxcl',
            type:'image',
            rect:['97px','18px','130px','130px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"boxcl.png",'0px','0px']
         },
         {
            id:'boxop2',
            type:'image',
            rect:['97px','12px','130px','130px','auto','auto'],
            opacity:0,
            fill:["rgba(0,0,0,0)",im+"boxop.png",'0px','0px']
         },
         {
            id:'wb',
            type:'image',
            rect:['155px','86px','10px','6px','auto','auto'],
            opacity:0,
            fill:["rgba(0,0,0,0)",im+"wb.jpg",'0px','0px'],
            transform:[[],[],[],['32.08','32.08']]
         }],
         symbolInstances: [

         ]
      },
   states: {
      "Base State": {
         "${_boxop2}": [
            ["style", "top", '27px'],
            ["style", "opacity", '0'],
            ["style", "left", '90px']
         ],
         "${_boxcl}": [
            ["style", "top", '-130px'],
            ["transform", "scaleY", '1'],
            ["transform", "scaleX", '1'],
            ["style", "opacity", '1'],
            ["style", "left", '95px']
         ],
         "${_wb}": [
            ["style", "top", '89.07px'],
            ["transform", "scaleY", '-0.21'],
            ["style", "height", '5.7363667095688px'],
            ["transform", "scaleX", '-0.21'],
            ["style", "opacity", '0'],
            ["style", "left", '155px'],
            ["style", "width", '10px']
         ],
         "${_Stage}": [
            ["color", "background-color", 'rgba(0,0,0,1.00)'],
            ["style", "width", '320px'],
            ["style", "height", '183px'],
            ["style", "overflow", 'hidden']
         ],
         "${_missionbg2}": [
            ["style", "top", '0px'],
            ["style", "height", '184px'],
            ["style", "opacity", '1'],
            ["style", "left", '0px'],
            ["style", "width", '320px']
         ]
      }
   },
   timelines: {
      "Default Timeline": {
         fromState: "Base State",
         toState: "",
         duration: 1705,
         autoPlay: true,
         timeline: [
            { id: "eid349", tween: [ "style", "${_boxop2}", "left", '90px', { fromValue: '90px'}], position: 670, duration: 0 },
            { id: "eid335", tween: [ "style", "${_boxcl}", "left", '89.85px', { fromValue: '95px'}], position: 0, duration: 250 },
            { id: "eid333", tween: [ "transform", "${_boxcl}", "scaleX", '1.34', { fromValue: '1'}], position: 190, duration: 105 },
            { id: "eid339", tween: [ "transform", "${_boxcl}", "scaleX", '0.92', { fromValue: '1.34'}], position: 295, duration: 95 },
            { id: "eid343", tween: [ "transform", "${_boxcl}", "scaleX", '1', { fromValue: '0.92'}], position: 390, duration: 160 },
            { id: "eid385", tween: [ "transform", "${_wb}", "scaleY", '34.29', { fromValue: '-0.21'}], position: 670, duration: 190 },
            { id: "eid358", tween: [ "style", "${_boxcl}", "opacity", '1', { fromValue: '1'}], position: 0, duration: 0 },
            { id: "eid366", tween: [ "style", "${_boxcl}", "opacity", '1', { fromValue: '1'}], position: 560, duration: 0 },
            { id: "eid367", tween: [ "style", "${_boxcl}", "opacity", '0', { fromValue: '1'}], position: 630, duration: 370 },
            { id: "eid334", tween: [ "transform", "${_boxcl}", "scaleY", '0.73', { fromValue: '1'}], position: 190, duration: 105 },
            { id: "eid338", tween: [ "transform", "${_boxcl}", "scaleY", '1.2', { fromValue: '0.73'}], position: 295, duration: 95 },
            { id: "eid342", tween: [ "transform", "${_boxcl}", "scaleY", '1', { fromValue: '1.2'}], position: 390, duration: 160 },
            { id: "eid377", tween: [ "style", "${_wb}", "width", '10px', { fromValue: '10px'}], position: 860, duration: 0 },
            { id: "eid322", tween: [ "style", "${_missionbg2}", "opacity", '1', { fromValue: '1'}], position: 0, duration: 0 },
            { id: "eid375", tween: [ "style", "${_wb}", "height", '5.7363667095688px', { fromValue: '5.7363667095688px'}], position: 860, duration: 0 },
            { id: "eid376", tween: [ "style", "${_wb}", "top", '89.07px', { fromValue: '89.07px'}], position: 860, duration: 0 },
            { id: "eid384", tween: [ "transform", "${_wb}", "scaleX", '34.29', { fromValue: '-0.21'}], position: 670, duration: 190 },
            { id: "eid350", tween: [ "style", "${_boxop2}", "top", '27px', { fromValue: '27px'}], position: 670, duration: 0 },
            { id: "eid321", tween: [ "style", "${_missionbg2}", "top", '0px', { fromValue: '0px'}], position: 0, duration: 0 },
            { id: "eid353", tween: [ "style", "${_boxop2}", "opacity", '1', { fromValue: '0'}], position: 693, duration: 307 },
            { id: "eid325", tween: [ "style", "${_boxcl}", "top", '27px', { fromValue: '-130px'}], position: 0, duration: 190 },
            { id: "eid336", tween: [ "style", "${_boxcl}", "top", '43px', { fromValue: '27px'}], position: 190, duration: 60 },
            { id: "eid340", tween: [ "style", "${_boxcl}", "top", '54.45px', { fromValue: '43px'}], position: 250, duration: 45 },
            { id: "eid341", tween: [ "style", "${_boxcl}", "top", '21.8px', { fromValue: '54.45px'}], position: 295, duration: 95 },
            { id: "eid344", tween: [ "style", "${_boxcl}", "top", '27px', { fromValue: '21.8px'}], position: 390, duration: 160 },
            { id: "eid372", tween: [ "style", "${_wb}", "opacity", '0.5078125', { fromValue: '0.000000'}], position: 670, duration: 190 },
            { id: "eid386", tween: [ "style", "${_wb}", "opacity", '0', { fromValue: '0.5078125'}], position: 860, duration: 180 },
            { id: "eid388", tween: [ "style", "${_wb}", "opacity", '1', { fromValue: '0'}], position: 1250, duration: 455 }         ]
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
})(jQuery, AdobeEdge, "EDGE-21360172");
