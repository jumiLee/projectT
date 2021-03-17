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
            id:'missionbg',
            type:'image',
            rect:['0px','0px','320px','331px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"missionbg_0"+$("#bg_id").val()+".jpg",'0px','0px']
         },
         {
            id:'ghost2_s2',
            type:'image',
            rect:['0px','112px','185px','300px','auto','auto'],
            opacity:1,
            fill:["rgba(0,0,0,0)",im+"ghost2_s2.png",'0px','0px']
         },
         {
            id:'boxcl',
            type:'image',
            rect:['97px','-130px','130px','130px','auto','auto'],
            opacity:0,
            fill:["rgba(0,0,0,0)",im+"boxcl.png",'0px','0px']
         },
         {
            id:'boxop',
            type:'image',
            rect:['95px','26px','130px','130px','auto','auto'],
            opacity:0,
            fill:["rgba(0,0,0,0)",im+"boxop.png",'0px','0px']
         },
         {
            id:'EF_Light_39',
            type:'image',
            rect:['93px','119px','128px','128px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"EF_Light_39.png",'0px','0px'],
            transform:[[],[],[],['4.33','4.33']]
         },
         {
            id:'coin',
            type:'image',
            rect:['139px','166px','36px','34px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"coin.png",'0px','0px']
         },
         {
            id:'coinCopy',
            type:'image',
            rect:['139px','166px','36px','34px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"coin.png",'0px','0px']
         },
         {
            id:'coinCopy4',
            type:'image',
            rect:['139px','166px','36px','34px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"coin.png",'0px','0px']
         },
         {
            id:'missionbg2',
            type:'image',
            rect:['0px','91px','320px','184px','auto','auto'],
            fill:["rgba(0,0,0,0)",im+"missionbg_0"+$("#bg_id").val()+".jpg",'0px','0px']
         }],
         symbolInstances: [

         ]
      },
   states: {
      "Base State": {
         "${_ghost2_s2}": [
            ["style", "top", '0px'],
            ["style", "height", '184px'],
            ["style", "overflow", 'visible'],
            ["style", "display", 'block'],
            ["style", "opacity", '1'],
            ["style", "left", '93px'],
            ["style", "width", '134px']
         ],
         "${_coin}": [
            ["style", "top", '65.72px'],
            ["transform", "scaleY", '0.28999'],
            ["transform", "rotateZ", '2deg'],
            ["transform", "scaleX", '1.26'],
            ["style", "opacity", '0'],
            ["style", "left", '138.58px']
         ],
         "${_boxop}": [
            ["style", "top", '26px'],
            ["style", "opacity", '0'],
            ["style", "left", '95px']
         ],
         "${_EF_Light_39}": [
            ["style", "top", '26.92px'],
            ["transform", "scaleY", '0.01'],
            ["transform", "scaleX", '0.01'],
            ["style", "opacity", '1'],
            ["style", "left", '91.92px']
         ],
         "${_coinCopy4}": [
            ["style", "top", '69.61px'],
            ["transform", "scaleY", '1.03'],
            ["transform", "rotateZ", '2deg'],
            ["transform", "scaleX", '1.24'],
            ["style", "opacity", '0'],
            ["style", "left", '160.9px'],
            ["style", "height", '38.317760169139px']
         ],
         "${_boxcl}": [
            ["style", "top", '-152px'],
            ["transform", "scaleY", '1.22'],
            ["style", "height", '150px'],
            ["style", "opacity", '0'],
            ["style", "left", '95px'],
            ["transform", "scaleX", '0.74']
         ],
         "${_Stage}": [
            ["color", "background-color", 'rgba(0,0,0,1.00)'],
            ["style", "overflow", 'hidden'],
            ["style", "height", '183px'],
            ["style", "width", '320px']
         ],
         "${_coinCopy}": [
            ["style", "top", '46.9px'],
            ["transform", "scaleY", '1.03'],
            ["transform", "rotateZ", '2deg'],
            ["transform", "scaleX", '1.24'],
            ["style", "opacity", '0'],
            ["style", "left", '139.36px'],
            ["style", "height", '38.317760169139px']
         ],
         "${_missionbg2}": [
            ["style", "top", '0px'],
            ["transform", "scaleY", '1'],
            ["transform", "scaleX", '1'],
            ["style", "height", '184px'],
            ["style", "opacity", '1'],
            ["style", "left", '-3px'],
            ["style", "width", '320px']
         ],
         "${_missionbg}": [
            ["style", "top", '0px'],
            ["transform", "scaleY", '1'],
            ["transform", "scaleX", '1'],
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
         duration: 3580,
         autoPlay: true,
         timeline: [
            { id: "eid290", tween: [ "style", "${_missionbg}", "opacity", '1', { fromValue: '1'}], position: 1500, duration: 0 },
            { id: "eid291", tween: [ "style", "${_missionbg}", "opacity", '1', { fromValue: '1'}], position: 1635, duration: 0 },
            { id: "eid298", tween: [ "style", "${_missionbg}", "left", '-14px', { fromValue: '0px'}], position: 1635, duration: 50 },
            { id: "eid297", tween: [ "style", "${_missionbg}", "left", '10.53px', { fromValue: '-14px'}], position: 1685, duration: 35 },
            { id: "eid308", tween: [ "style", "${_missionbg}", "left", '14px', { fromValue: '10.53px'}], position: 1720, duration: 30 },
            { id: "eid300", tween: [ "style", "${_missionbg}", "left", '-9px', { fromValue: '14px'}], position: 1750, duration: 50 },
            { id: "eid302", tween: [ "style", "${_missionbg}", "left", '0px', { fromValue: '-9px'}], position: 1800, duration: 50 },
            { id: "eid265", tween: [ "style", "${_coinCopy4}", "height", '89.473684210526px', { fromValue: '38.317760169139px'}], position: 1800, duration: 345 },
            { id: "eid266", tween: [ "style", "${_coinCopy4}", "height", '43.519978731085px', { fromValue: '89.473684210526px'}], position: 2145, duration: 75 },
            { id: "eid233", tween: [ "transform", "${_coinCopy}", "scaleX", '1.15999', { fromValue: '1.24'}], position: 1915, duration: 260 },
            { id: "eid352", tween: [ "style", "${_boxcl}", "left", '95px', { fromValue: '95px'}], position: 2420, duration: 0 },
            { id: "eid273", tween: [ "transform", "${_coinCopy4}", "scaleX", '1.15999', { fromValue: '1.24'}], position: 1960, duration: 260 },
            { id: "eid112", tween: [ "transform", "${_coin}", "rotateZ", '134deg', { fromValue: '2deg'}], position: 1720, duration: 85 },
            { id: "eid117", tween: [ "transform", "${_coin}", "rotateZ", '393deg', { fromValue: '134deg'}], position: 1805, duration: 155 },
            { id: "eid120", tween: [ "transform", "${_coin}", "rotateZ", '449deg', { fromValue: '393deg'}], position: 1960, duration: 95 },
            { id: "eid101", tween: [ "style", "${_EF_Light_39}", "opacity", '0', { fromValue: '1'}], position: 1635, duration: 115 },
            { id: "eid387", tween: [ "style", "${_EF_Light_39}", "opacity", '1', { fromValue: '1'}], position: 3135, duration: 0 },
            { id: "eid389", tween: [ "style", "${_EF_Light_39}", "opacity", '0', { fromValue: '1'}], position: 3380, duration: 200 },
            { id: "eid349", tween: [ "style", "${_boxcl}", "opacity", '1', { fromValue: '1'}], position: 2305, duration: 0 },
            { id: "eid367", tween: [ "style", "${_boxcl}", "opacity", '1', { fromValue: '1'}], position: 2500, duration: 0 },
            { id: "eid368", tween: [ "style", "${_boxcl}", "opacity", '0', { fromValue: '1'}], position: 3000, duration: 500 },
            { id: "eid169", tween: [ "transform", "${_coinCopy}", "rotateZ", '134deg', { fromValue: '2deg'}], position: 1765, duration: 85 },
            { id: "eid170", tween: [ "transform", "${_coinCopy}", "rotateZ", '269deg', { fromValue: '134deg'}], position: 1850, duration: 65 },
            { id: "eid223", tween: [ "transform", "${_coinCopy}", "rotateZ", '393deg', { fromValue: '269deg'}], position: 1915, duration: 90 },
            { id: "eid171", tween: [ "transform", "${_coinCopy}", "rotateZ", '488deg', { fromValue: '393deg'}], position: 2005, duration: 95 },
            { id: "eid232", tween: [ "transform", "${_coinCopy}", "rotateZ", '540deg', { fromValue: '488deg'}], position: 2100, duration: 75 },
            { id: "eid310", tween: [ "style", "${_ghost2_s2}", "top", '0px', { fromValue: '0px'}], position: 1500, duration: 0 },
            { id: "eid318", tween: [ "style", "${_EF_Light_39}", "top", '26.92px', { fromValue: '26.92px'}], position: 1635, duration: 0 },
            { id: "eid384", tween: [ "style", "${_EF_Light_39}", "top", '26.92px', { fromValue: '26.92px'}], position: 3135, duration: 0 },
            { id: "eid348", tween: [ "transform", "${_boxcl}", "scaleY", '1.08', { fromValue: '1.22'}], position: 2305, duration: 195 },
            { id: "eid353", tween: [ "transform", "${_boxcl}", "scaleY", '0.66', { fromValue: '1.08'}], position: 2500, duration: 130 },
            { id: "eid355", tween: [ "transform", "${_boxcl}", "scaleY", '1.19', { fromValue: '0.66'}], position: 2630, duration: 120 },
            { id: "eid357", tween: [ "transform", "${_boxcl}", "scaleY", '1', { fromValue: '1.19'}], position: 2750, duration: 250 },
            { id: "eid253", tween: [ "style", "${_coinCopy4}", "top", '55.52px', { fromValue: '69.61px'}], position: 1810, duration: 85 },
            { id: "eid254", tween: [ "style", "${_coinCopy4}", "top", '67.51px', { fromValue: '55.52px'}], position: 1895, duration: 65 },
            { id: "eid255", tween: [ "style", "${_coinCopy4}", "top", '107.56px', { fromValue: '67.51px'}], position: 1960, duration: 90 },
            { id: "eid256", tween: [ "style", "${_coinCopy4}", "top", '117.57px', { fromValue: '107.56px'}], position: 2050, duration: 95 },
            { id: "eid257", tween: [ "style", "${_coinCopy4}", "top", '158.25px', { fromValue: '117.57px'}], position: 2145, duration: 75 },
            { id: "eid334", tween: [ "transform", "${_missionbg2}", "scaleY", '1.46', { fromValue: '1'}], position: 0, duration: 1500 },
            { id: "eid221", tween: [ "transform", "${_coin}", "scaleY", '1.06', { fromValue: '0.28999'}], position: 1805, duration: 110 },
            { id: "eid220", tween: [ "transform", "${_coin}", "scaleY", '1.37', { fromValue: '1.06'}], position: 1915, duration: 140 },
            { id: "eid226", tween: [ "transform", "${_coinCopy}", "scaleY", '0.38', { fromValue: '1.03'}], position: 1710, duration: 205 },
            { id: "eid234", tween: [ "transform", "${_coinCopy}", "scaleY", '0.23', { fromValue: '0.38'}], position: 1915, duration: 260 },
            { id: "eid98", tween: [ "transform", "${_EF_Light_39}", "scaleX", '4.59', { fromValue: '0.01'}], position: 1500, duration: 250 },
            { id: "eid386", tween: [ "transform", "${_EF_Light_39}", "scaleX", '4.93', { fromValue: '0.01'}], position: 3000, duration: 580 },
            { id: "eid260", tween: [ "transform", "${_coinCopy4}", "rotateZ", '134deg', { fromValue: '2deg'}], position: 1810, duration: 85 },
            { id: "eid261", tween: [ "transform", "${_coinCopy4}", "rotateZ", '269deg', { fromValue: '134deg'}], position: 1895, duration: 65 },
            { id: "eid262", tween: [ "transform", "${_coinCopy4}", "rotateZ", '393deg', { fromValue: '269deg'}], position: 1960, duration: 90 },
            { id: "eid263", tween: [ "transform", "${_coinCopy4}", "rotateZ", '488deg', { fromValue: '393deg'}], position: 2050, duration: 95 },
            { id: "eid264", tween: [ "transform", "${_coinCopy4}", "rotateZ", '540deg', { fromValue: '488deg'}], position: 2145, duration: 75 },
            { id: "eid329", tween: [ "style", "${_missionbg2}", "left", '-3px', { fromValue: '-3px'}], position: 0, duration: 0 },
            { id: "eid366", tween: [ "style", "${_boxop}", "opacity", '1', { fromValue: '0'}], position: 3000, duration: 500 },
            { id: "eid307", tween: [ "style", "${_missionbg}", "top", '0px', { fromValue: '0px'}], position: 1500, duration: 0 },
            { id: "eid299", tween: [ "style", "${_missionbg}", "top", '-7px', { fromValue: '0px'}], position: 1635, duration: 50 },
            { id: "eid296", tween: [ "style", "${_missionbg}", "top", '-1px', { fromValue: '-7px'}], position: 1685, duration: 35 },
            { id: "eid309", tween: [ "style", "${_missionbg}", "top", '4px', { fromValue: '-1px'}], position: 1720, duration: 30 },
            { id: "eid303", tween: [ "style", "${_missionbg}", "top", '0px', { fromValue: '4px'}], position: 1800, duration: 50 },
            { id: "eid346", tween: [ "transform", "${_boxcl}", "scaleX", '0.69', { fromValue: '0.74'}], position: 2305, duration: 195 },
            { id: "eid354", tween: [ "transform", "${_boxcl}", "scaleX", '1.13999', { fromValue: '0.69'}], position: 2500, duration: 130 },
            { id: "eid356", tween: [ "transform", "${_boxcl}", "scaleX", '0.89', { fromValue: '1.13999'}], position: 2630, duration: 120 },
            { id: "eid358", tween: [ "transform", "${_boxcl}", "scaleX", '1', { fromValue: '0.89'}], position: 2750, duration: 250 },
            { id: "eid340", tween: [ "style", "${_boxcl}", "height", '150px', { fromValue: '150px'}], position: 2500, duration: 0 },
            { id: "eid345", tween: [ "style", "${_boxcl}", "top", '-86.15px', { fromValue: '-152px'}], position: 2305, duration: 115 },
            { id: "eid351", tween: [ "style", "${_boxcl}", "top", '-8px', { fromValue: '-86.15px'}], position: 2420, duration: 80 },
            { id: "eid361", tween: [ "style", "${_boxcl}", "top", '33.5px', { fromValue: '-8px'}], position: 2500, duration: 130 },
            { id: "eid362", tween: [ "style", "${_boxcl}", "top", '-0.75px', { fromValue: '33.5px'}], position: 2630, duration: 120 },
            { id: "eid363", tween: [ "style", "${_boxcl}", "top", '8px', { fromValue: '-0.75px'}], position: 2750, duration: 250 },
            { id: "eid258", tween: [ "transform", "${_coinCopy4}", "scaleY", '0.38', { fromValue: '1.03'}], position: 1755, duration: 205 },
            { id: "eid259", tween: [ "transform", "${_coinCopy4}", "scaleY", '0.23', { fromValue: '0.38'}], position: 1960, duration: 260 },
            { id: "eid335", tween: [ "style", "${_missionbg2}", "opacity", '1', { fromValue: '1'}], position: 0, duration: 0 },
            { id: "eid336", tween: [ "style", "${_missionbg2}", "opacity", '0', { fromValue: '1'}], position: 750, duration: 750 },
            { id: "eid78", tween: [ "style", "${_ghost2_s2}", "width", '134px', { fromValue: '134px'}], position: 1500, duration: 0 },
            { id: "eid113", tween: [ "style", "${_coin}", "left", '114px', { fromValue: '138.58px'}], position: 1720, duration: 85 },
            { id: "eid115", tween: [ "style", "${_coin}", "left", '90.28px', { fromValue: '114px'}], position: 1805, duration: 110 },
            { id: "eid178", tween: [ "style", "${_coin}", "left", '82px', { fromValue: '90.28px'}], position: 1915, duration: 45 },
            { id: "eid118", tween: [ "style", "${_coin}", "left", '51.64px', { fromValue: '82px'}], position: 1960, duration: 95 },
            { id: "eid228", tween: [ "style", "${_coinCopy}", "height", '89.473684210526px', { fromValue: '38.317760169139px'}], position: 1755, duration: 345 },
            { id: "eid229", tween: [ "style", "${_coinCopy}", "height", '43.519978731085px', { fromValue: '89.473684210526px'}], position: 2100, duration: 75 },
            { id: "eid107", tween: [ "style", "${_coin}", "opacity", '1', { fromValue: '1'}], position: 1720, duration: 0 },
            { id: "eid278", tween: [ "style", "${_coin}", "opacity", '0', { fromValue: '1'}], position: 2050, duration: 255 },
            { id: "eid114", tween: [ "style", "${_coin}", "top", '40.21px', { fromValue: '65.72px'}], position: 1720, duration: 85 },
            { id: "eid116", tween: [ "style", "${_coin}", "top", '68.17px', { fromValue: '40.21px'}], position: 1805, duration: 110 },
            { id: "eid177", tween: [ "style", "${_coin}", "top", '98.37px', { fromValue: '68.17px'}], position: 1915, duration: 45 },
            { id: "eid119", tween: [ "style", "${_coin}", "top", '150.6px', { fromValue: '98.37px'}], position: 1960, duration: 95 },
            { id: "eid320", tween: [ "style", "${_coin}", "top", '163.91px', { fromValue: '150.6px'}], position: 2055, duration: 120 },
            { id: "eid330", tween: [ "style", "${_missionbg2}", "top", '-15px', { fromValue: '0px'}], position: 0, duration: 250 },
            { id: "eid323", tween: [ "style", "${_missionbg2}", "top", '17px', { fromValue: '-15px'}], position: 250, duration: 250 },
            { id: "eid324", tween: [ "style", "${_missionbg2}", "top", '-24px', { fromValue: '17px'}], position: 500, duration: 250 },
            { id: "eid325", tween: [ "style", "${_missionbg2}", "top", '17px', { fromValue: '-24px'}], position: 750, duration: 250 },
            { id: "eid326", tween: [ "style", "${_missionbg2}", "top", '0px', { fromValue: '17px'}], position: 1000, duration: 500 },
            { id: "eid154", tween: [ "style", "${_coinCopy}", "top", '62.52px', { fromValue: '46.9px'}], position: 1765, duration: 85 },
            { id: "eid155", tween: [ "style", "${_coinCopy}", "top", '64.51px', { fromValue: '62.52px'}], position: 1850, duration: 65 },
            { id: "eid176", tween: [ "style", "${_coinCopy}", "top", '98.39px', { fromValue: '64.51px'}], position: 1915, duration: 90 },
            { id: "eid156", tween: [ "style", "${_coinCopy}", "top", '112.57px', { fromValue: '98.39px'}], position: 2005, duration: 95 },
            { id: "eid230", tween: [ "style", "${_coinCopy}", "top", '158.25px', { fromValue: '112.57px'}], position: 2100, duration: 75 },
            { id: "eid99", tween: [ "transform", "${_EF_Light_39}", "scaleY", '4.59', { fromValue: '0.01'}], position: 1500, duration: 250 },
            { id: "eid385", tween: [ "transform", "${_EF_Light_39}", "scaleY", '4.59', { fromValue: '0.01'}], position: 3000, duration: 580 },
            { id: "eid267", tween: [ "style", "${_coinCopy4}", "opacity", '1', { fromValue: '0'}], position: 1800, duration: 10 },
            { id: "eid279", tween: [ "style", "${_coinCopy4}", "opacity", '0', { fromValue: '1'}], position: 2220, duration: 85 },
            { id: "eid76", tween: [ "style", "${_ghost2_s2}", "height", '184px', { fromValue: '184px'}], position: 1500, duration: 0 },
            { id: "eid222", tween: [ "transform", "${_coin}", "scaleX", '1.06', { fromValue: '1.26'}], position: 1805, duration: 110 },
            { id: "eid219", tween: [ "transform", "${_coin}", "scaleX", '0.25', { fromValue: '1.06'}], position: 1915, duration: 140 },
            { id: "eid317", tween: [ "style", "${_EF_Light_39}", "left", '91.92px', { fromValue: '91.92px'}], position: 1635, duration: 0 },
            { id: "eid388", tween: [ "style", "${_EF_Light_39}", "left", '91.92px', { fromValue: '91.92px'}], position: 3135, duration: 0 },
            { id: "eid213", tween: [ "style", "${_coinCopy}", "opacity", '1', { fromValue: '0'}], position: 1755, duration: 10 },
            { id: "eid280", tween: [ "style", "${_coinCopy}", "opacity", '0', { fromValue: '1'}], position: 2175, duration: 130 },
            { id: "eid79", tween: [ "style", "${_ghost2_s2}", "left", '93px', { fromValue: '93px'}], position: 1500, duration: 0 },
            { id: "eid102", tween: [ "style", "${_ghost2_s2}", "opacity", '1', { fromValue: '1'}], position: 1500, duration: 0 },
            { id: "eid103", tween: [ "style", "${_ghost2_s2}", "opacity", '0', { fromValue: '1'}], position: 1750, duration: 250 },
            { id: "eid90", tween: [ "style", "${_ghost2_s2}", "display", 'block', { fromValue: 'block'}], position: 1500, duration: 0 },
            { id: "eid268", tween: [ "style", "${_coinCopy4}", "left", '165.55px', { fromValue: '160.9px'}], position: 1810, duration: 85 },
            { id: "eid269", tween: [ "style", "${_coinCopy4}", "left", '171.17px', { fromValue: '165.55px'}], position: 1895, duration: 65 },
            { id: "eid270", tween: [ "style", "${_coinCopy4}", "left", '170.04px', { fromValue: '171.17px'}], position: 1960, duration: 90 },
            { id: "eid271", tween: [ "style", "${_coinCopy4}", "left", '176.2px', { fromValue: '170.04px'}], position: 2050, duration: 95 },
            { id: "eid272", tween: [ "style", "${_coinCopy4}", "left", '177.12px', { fromValue: '176.2px'}], position: 2145, duration: 75 },
            { id: "eid163", tween: [ "style", "${_coinCopy}", "left", '128.73px', { fromValue: '139.36px'}], position: 1765, duration: 85 },
            { id: "eid164", tween: [ "style", "${_coinCopy}", "left", '132.62px', { fromValue: '128.73px'}], position: 1850, duration: 65 },
            { id: "eid175", tween: [ "style", "${_coinCopy}", "left", '134.65px', { fromValue: '132.62px'}], position: 1915, duration: 90 },
            { id: "eid165", tween: [ "style", "${_coinCopy}", "left", '112.21px', { fromValue: '134.65px'}], position: 2005, duration: 95 },
            { id: "eid231", tween: [ "style", "${_coinCopy}", "left", '121.12px', { fromValue: '112.21px'}], position: 2100, duration: 75 },
            { id: "eid333", tween: [ "transform", "${_missionbg2}", "scaleX", '1.46', { fromValue: '1'}], position: 0, duration: 1500 }         ]
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
})(jQuery, AdobeEdge, "EDGE-21360172");
