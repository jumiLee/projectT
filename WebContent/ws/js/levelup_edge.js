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
            id:'levelup_popup',
            type:'image',
            rect:['-40px','-32px','400px','321px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"levelup_popup.jpg",'0px','0px'],
            transform:[[],[],[],['0.8','0.8']]
         },
         {
            id:'levelup_popupCopy',
            type:'image',
            rect:['-40px','-32px','400px','321px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"levelup_popup.jpg",'0px','0px'],
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
            ["style", "height", '257px'],
            ["style", "overflow", 'hidden']
         ],
         "${_levelup_popupCopy}": [
            ["style", "top", '-32.1px'],
            ["transform", "scaleY", '-0.01'],
            ["transform", "scaleX", '-0.01'],
            ["style", "opacity", '1'],
            ["style", "left", '-40px']
         ],
         "${_levelup_popup}": [
            ["style", "top", '-32.1px'],
            ["transform", "scaleY", '-0.01'],
            ["transform", "scaleX", '-0.01'],
            ["style", "opacity", '1'],
            ["style", "left", '-40px']
         ]
      }
   },
   timelines: {
      "Default Timeline": {
         fromState: "Base State",
         toState: "",
         duration: 1000,
         autoPlay: true,
         timeline: [
            { id: "eid14", tween: [ "transform", "${_levelup_popup}", "scaleY", '0.8', { fromValue: '-0.01'}], position: 0, duration: 410 },
            { id: "eid29", tween: [ "style", "${_levelup_popup}", "opacity", '0', { fromValue: '1'}], position: 0, duration: 402 },
            { id: "eid30", tween: [ "style", "${_levelup_popup}", "opacity", '1', { fromValue: '0'}], position: 402, duration: 8 },
            { id: "eid20", tween: [ "style", "${_levelup_popupCopy}", "opacity", '1', { fromValue: '1'}], position: 0, duration: 0 },
            { id: "eid27", tween: [ "style", "${_levelup_popupCopy}", "opacity", '0.015625', { fromValue: '1'}], position: 410, duration: 590 },
            { id: "eid19", tween: [ "transform", "${_levelup_popupCopy}", "scaleX", '0.8', { fromValue: '-0.01'}], position: 0, duration: 410 },
            { id: "eid31", tween: [ "transform", "${_levelup_popupCopy}", "scaleX", '1.17', { fromValue: '0.8'}], position: 410, duration: 590 },
            { id: "eid22", tween: [ "transform", "${_levelup_popupCopy}", "scaleY", '0.8', { fromValue: '-0.01'}], position: 0, duration: 410 },
            { id: "eid32", tween: [ "transform", "${_levelup_popupCopy}", "scaleY", '1.17', { fromValue: '0.8'}], position: 410, duration: 590 },
            { id: "eid13", tween: [ "transform", "${_levelup_popup}", "scaleX", '0.8', { fromValue: '-0.01'}], position: 0, duration: 402 }         ]
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
})(jQuery, AdobeEdge, "EDGE-257836586");
