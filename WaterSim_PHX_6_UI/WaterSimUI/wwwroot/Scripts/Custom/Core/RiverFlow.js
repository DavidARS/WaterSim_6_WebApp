﻿/// <reference path="/Scripts/Custom/Core/Core.js" />
/// <reference path="/Scripts/Custom/Slider/SettingSlider.js" />

// low med high flow years for Saltverde
var SVFlowLow = 1946;
var SVFlowMed = 1955;
//var SVFlowDefault = 1946;
var SVFlowDefault = 1955;
var SVFlowHigh = 1965;
var SVFlowMixed = 1974;

// low med high flow years for Colorado
//var COFlowLow = 1938;
var COFlowLow = 1939;
var COFlowMed = 1922;
//var COFlowDefault = 1922; 03.05.15 DAS
//var COFlowDefault = 1938;
var COFlowDefault = 1922;
var COFlowHigh = 1906;
var COFlowMixed = 1975;

var SVRiverFlowValue = SVFlowDefault;
var CORiverFlowValue = COFlowDefault;

var CODroughtStartValue = 2012;
var CODroughtStopValue = 2012;
var STVDroughtStartValue = 2012;
var STVDroughtStopValue = 2012;


//-----------------------------------------------
function SetFlowValues(value) {
    switch (value) {
        case "dry":
            SVRiverFlowValue = SVFlowLow;
            CORiverFlowValue = COFlowLow;
            // Load the image for dry flow traces
            $('#img1').show();
            $('#img2').hide();
            $('#img3').hide();
            $('#img4').hide();
            break;
        case "med":
            SVRiverFlowValue = SVFlowMed;
            CORiverFlowValue = COFlowMed;
            $('#img2').show();
            $('#img1').hide();
            $('#img3').hide();
            $('#img4').hide();
            break;
        case "wet":
            SVRiverFlowValue = SVFlowHigh;
            CORiverFlowValue = COFlowHigh;
            $('#img3').show();
            $('#img1').hide();
            $('#img2').hide();
            $('#img4').hide();
            break;
        case "mix":
            SVRiverFlowValue = SVFlowMixed;
            CORiverFlowValue = COFlowMixed;
            $('#img4').show();
            $('#img1').hide();
            $('#img2').hide();
            $('#img3').hide();
            break;
        default:
            SVRiverFlowValue = SVFlowDefault;
            CORiverFlowValue = COFlowDefault;
    }
}


//-----------------------------------------------
function SetFlowLabels()
{
    var COlab = document.getElementById("COFLOWYR");
    COlab.innerHTML = "Colorado River Start Year: " + CORiverFlowValue.toString();
    var SVlab = document.getElementById("SVFLOWYR");
    SVlab.innerHTML = "Salt-Verde Rivers Start Year: " + SVRiverFlowValue.toString();
}
//-----------------------------------------------
function SetFlowRadio(value) {
    switch (value) {
        //STEPTOE EDIT BEGIN 08/24/16 - Changed RiverFlow from radio to dropdown
        //Set Med as default
         case "dry":
            //$('input[id="RBdry"]').prop('checked', true);
             $('#flowRecordList').val('dry')
            SetFlowValues('dry');
            break;
        case "med":
            //$('input[id="RBmed"]').prop('checked', true);
            $('#flowRecordList').val('med')
            SetFlowValues('med');
            break;
        case "wet":
            //$('input[id="RBwet"]').prop('checked', true);
            $('#flowRecordList').val('wet')
            SetFlowValues('wet');
            break;
        case "mix":
            //$('input[id="RBmix"]').prop('checked', true);
            $('#flowRecordList').val('mix')
            SetFlowValues('mix');
            break;
        default:
            //$('input[id="RBdry"]').prop('checked', true);
            //'select[name=flowRecord]'
            $('#flowRecordList').val('med')
            SetFlowValues('med');
            $('#img4').hide();
            $('#img1').hide();
            $('#img2').hide();
            $('#img3').hide();
        //STEPTOE EDIT END 08/24/16
    }

}
//--------------------------------------------------
// for the coorado, determine what condition matches this date
function GetCoFlow(val) {
    var rtnval = "";
    switch (val) {
        case COFlowLow:
            rtnval = "dry";
            break;
        case COFlowMed:
            rtnval = "med";
            break;
        case COFlowHigh:
            rtnval = "wet";
            break;
        case COFlowMixed:
            rtnval = "mix";
            break;
        case COFlowDefault:
            rtnval = "med";
            break;
        default:
            rtnval = "med";
    }

    return rtnval;
}
//---------------------------------------------
// set the Radio Button vased in this co flow
function SetCoFlow(val) {
    var rbval = GetCoFlow(val);
    SetFlowRadio(rbval);
}
//---------------------------------------------
// Get a label for the flow text value
function GetFlowLabel(val) {
    var aFlowLab = "";
    switch (val) {

        case "dry":
            aFlowLab = "Low flow years";
            break;
        case "med":
            aFlowLab = "Median flow years";
            break;
        case "wet":
            aFlowLab = "High flow years";
            break;
        case "mix":
            aFlowLab = "High inter-annual variability";
            break;
        default:
            aFlowLab = "Median flow years";
    }
    return aFlowLab;
}


//---------------------------------------------
function SetSVFlow(val) {
    //switch (val) {
    //    case SVFlowLow:
    //        SetFlowRadio("dry");
    //        break;
    //    case SVFlowDefault:
    //        SetFlowRadio("med");
    //        break;
    //    case SVFlowHigh:
    //        SetFlowRadio("wet");
    //        break;
    //    case SVFlowMixed:
    //        SetFlowRadio("mix");
    //        break;
    //    default:
    //        SetFlowRadio("med");
    //}
}
//-----------------------------------------------
//STEPTOE EDIT BEGIN 08/24/16 - Changed RiverFlow from radio to dropdown
//$('input[name="flowRecord"]').change(function () {
$('#flowRecordList').change(function () {
    var flowValue = this.value;
    SetFlowValues(flowValue);
    SetFlowLabels();
    SetRunButtonState(true);
})
//STEPTOE EDIT END 08/24/16
// ------------------------------------------------------------------------------------------------------------------------
//


//----------------------------------------------

function setDefaultDrought() {
    // 03.05.15 DAS
   // Clear the drought text boxes for both riverine systems
   // STEPTOE BEGIN EDIT 09/26/16
    // Drought is now a buttonset
    var defaultRadio = $('#GraphControls_InputUserControl3_radio_None');
    defaultRadio.prop('checked', true);
    $('#GraphControls_InputUserControl3_buttonset').buttonset('refresh');
    SetSliderValue(defaultRadio.parent().parent().parent().attr('id'), defaultRadio.val());
    $("#GraphControls_InputUserControl3_number").val(defaultRadio.val());
    $("#GraphControls_InputUserControl3_lblunits").text('Preset Class');
    $('#GraphControls_InputUserControl3_number').hide();
};
function setDefaultClimate() {
    // 06.29.17 DAS
    // Clear the drought text boxes for both riverine systems
    // Climate is now a buttonset
    var defaultRadio = $('#GraphControls_CLIInputUserControl_radio_0_radio_None');
    defaultRadio.prop('checked', true);
    $('#GraphControls_CLIInputUserControl_radio_0_buttonset').buttonset('refresh');
    SetSliderValue(defaultRadio.parent().parent().parent().attr('id'), defaultRadio.val());
    $("#GraphControls_CLIInputUserControl_radio_0_number").val(defaultRadio.val());
};

//-----------------------------------------------

function initClimateEffectButtonSet() {
    var buttonset = $("#CLIInputUserControl_buttonset").buttonset();
    buttonset.find("input[type=radio]").change(function () {
        var coFlow = $('.InputControl[data-key="COCLMADJ"]').find(".input-number"),
            svFlow = $('.InputControl[data-key="SVCLMADJ"]').find(".input-number"),
            flowRecordList = $('#flowRecordList');

        switch (this.value) {
            case "0":
                flowRecordList.val('med').change();
                coFlow.val(100).change();
                svFlow.val(100).change();
                break;

            case "1":
                flowRecordList.val('med').change();
                coFlow.val(89).change();
                svFlow.val(80).change();
                break;
            case "2":
               // flowRecordList.val('dry').change();
                //coFlow.val(50).change();
                //svFlow.val(40).change();
               // coFlow.val(60).change();
               // svFlow.val(55).change();

                break;
            case "3":
                flowRecordList.val('dry').change();
                coFlow.val(70).change();
                svFlow.val(65).change();
                break;
            case "4":
                flowRecordList.val('dry').change();
                coFlow.val(60).change();
                svFlow.val(55).change();
                break;
            case "5":
                flowRecordList.val('wet').change();
                coFlow.val(120).change();
                svFlow.val(120).change();
                break;

        }
    });
}
initClimateEffectButtonSet();