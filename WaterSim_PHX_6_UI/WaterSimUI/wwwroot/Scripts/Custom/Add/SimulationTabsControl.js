/* SXI1211
    Description: Edit for multi model simulation
    Date: 5 Feb 2017 
    Adds tabs for multiple model simulations*/
var $alphaModeldata = '';
var $betaModeldata = '';
var $previousTab = '';

/*
SXI1211
06/29/2017: Changes in this function to delay the tabs function.
*/
if (getWindowType() != 'Charts') {
    $(function () {
        $('#displayWaterSupply').show();
        $('#displayDemand').hide();
        $('#displayRiverReservoirs').hide();
        var tabs = $("#model-simulation-tabs").tabs();
    
        $('#WaterSupplyRadio').prop('checked', true);
        $('#DemandRadio').prop('checked', false);
        $('#RiversRiservoirsRadio').prop('checked', false);
    });
}

/*
Description:    Sets alpha model 'Active' and beta model as 'Inactive' 
                On tab change retrieves alpha model data from hidden field to populate 
                the input and output controls.*/
$('.simulationModelPrimary').click(function (event) {
    $(".middle").show();
    $("#pageslide-button-container").show();
    $("#run-model-Main").show();
    $('#alphaModelActive').val('Active');
    $('#betaModelActive').val('Inactive');

    if ($previousTab != 'compare')
        saveModelInputs('beta');

    loadModelInputs('alpha');

    if ($('#alphaModelData').val().length > 0) {
        var modelData = JSON.parse($('#alphaModelData').val());
        setInputControls(modelData);
        drawOutputCharts(modelData);
    }

    $previousTab = 'alpha';
});

/*
Description:    Sets beta model 'Active' and alpha model as 'Inactive' 
                On tab change retrieves beta model data from hidden field to populate 
                the input and output controls.*/
$('.simulationModelSecondary').click(function (event) {
    $(".middle").show();
    $("#pageslide-button-container").show();
    $("#run-model-Main").show();
    $('#alphaModelActive').val('Inactive');
    $('#betaModelActive').val('Active');

    if ($previousTab != 'compare')
        saveModelInputs('alpha');

    loadModelInputs('beta');
    if ($('#betaModelData').val().length > 0) {
        var modelData = JSON.parse($('#betaModelData').val());
        setInputControls(modelData);
        drawOutputCharts(modelData);
    }
    $previousTab = 'beta';
});

//On click of Compare models tab
$('.simulationModelCompare').click(function (event) {
    $previousTab = 'compare';
    $(".middle").hide();
    $("#pageslide-button-container").hide();
    $("#run-model-Main").hide();
    loadModelOutputData();

    //Getting the div ID drop down list selected item changed
    $(".alphaConstrict .ddlflds").change(function () {
        fldValues = {};
        $.each($alphaModeldata.RESULTS, function () {
            fldValues[this.FLD] = this.VALS;
        });

        drawChart($(this).closest('div[id*=OutputControl]').attr('id'), $alphaModeldata);
    });

    $(".betaConstrict .ddlflds").change(function () {
        fldValues = {};
        $.each($betaModeldata.RESULTS, function () {
            fldValues[this.FLD] = this.VALS;
        });

        drawChart($(this).closest('div[id*=OutputControl]').attr('id'), $betaModeldata);
    });
});

function saveModelInputs(activeTab) {
    var policySelect = $("#policyListChosen").val();
    var selectScenario = $('#scenarioList').val();
    switch (activeTab) {
        case 'alpha':
            $('#alphaModelPolicies').val(policySelect);
            $('#alphaModelScenario').val(selectScenario);
            break;
        case 'beta':
            $('#betaModelPolicies').val(policySelect);
            $('#betaModelScenario').val(selectScenario);
            break;
    }
}

function loadModelInputs(model) {
    var selectPolicy = '';
    var selectScenario = '';
    switch (model) {
        case 'alpha':
            selectPolicy = $('#alphaModelPolicies').val().split(',');
            selectScenario = $('#alphaModelScenario').val();
            break;
        case 'beta':
            selectPolicy = $('#betaModelPolicies').val().split(',');
            selectScenario = $('#betaModelScenario').val();
            break;
    }

    if (!(selectPolicy[0] === "")) {
        $("#GraphControls_AGRIInputUserControl_ControlContainer").hide();
        $("#GraphControls_ENVIInputUserControl_ControlContainer").hide();
        $("#GraphControls_PERSInputUserControl_ControlContainer").hide();
        $("#GraphControls_POPInputUserControl_ControlContainer").hide();
        $("#GraphControls_ODUInputUserControl_ControlContainer").hide();
        $("#GraphControls_RECInputUserControl_ControlContainer").hide();
        $("#GraphControls_RTOSInputUserControl_ControlContainer").hide();
        $("#GraphControls_RODInputUserControl_ControlContainer").hide();

        for (var i = 0; i < selectPolicy.length; i++) {
            selectPolicyVisibility(selectPolicy[i], false);
        }
        $(".policy-select").val(selectPolicy);
        $(".policy-select").trigger('chosen:updated');
    }

    if (selectScenario.length > 0) {
        $("#scenarioList").val(selectScenario);
        //The below functions are defined in WaterSim.js
        //These are existing methods that are reused for multi model simulation
        SetScenarioValues(selectScenario);
        SetRunButtonState(true);
    }
}

function loadModelOutputData() {
    $alphaModeldata = JSON.parse($('#alphaModelData').val());
    drawOutputModelCharts($alphaModeldata, '.alphaConstrict .OutputControl');
    $('.AlphaScenario').each(function() {
        this.innerHTML = $('#scenarioList')[0].options[$('#alphaModelScenario').val()].innerHTML;
    });

    $betaModeldata = JSON.parse($('#betaModelData').val());
    drawOutputModelCharts($betaModeldata, '.betaConstrict .OutputControl');
    $('.BetaScenario').each(function() {
        this.innerHTML = $('#scenarioList')[0].options[$('#betaModelScenario').val()].innerHTML;
    });
}


function drawOutputModelCharts($jsonObjLocal, model) {
    if (model != '') {
        subControls = {};
        fldNames = {};
        fldValues = {};
        providerName = {};
        fldMAXes = {};
        fldMINes = {};
        fldUnits = {};
        fldLongunits = {};

        setStrtandEndYr();
        inputJSONStr = INFO_REQUEST;

        $.each(inputJSONStr.FieldInfo, function () {
            fldNames[this.FLD] = this.LAB;
            fldMAXes[this.FLD] = this.MAX;
            fldMINes[this.FLD] = this.MIN;
            fldUnits[this.FLD] = this.UNT;
            fldLongunits[this.FLD] = this.UNTL;

            if (this.DEP)
                subControls[this.FLD] = [this.DEP];
            else
                subControls[this.FLD] = [""];
        });

        //If the window is not Charts.aspx then get provider names w.r. to their code
        //from the Chosen Selector
        if (getWindowType() != "Charts") {
            var selectedProviders = $('.chosen-select').val();
            for (var i in selectedProviders)
                providerName[selectedProviders[i]] = providerInfo[selectedProviders[i]];
        }
        else {
            for (var i in providerInfo)
                providerName[i] = providerInfo[i];
        }

        $.each($jsonObjLocal.RESULTS, function () {
            fldValues[this.FLD] = this.VALS;
        });

        //looping through the output controls and getting the required data and populating the charts
        $(model).each(function () {
            var controlID = $(this).attr('id');
            drawChart(controlID, $jsonObjLocal);
        });

        drawAllIndicators();
    }
}


function ActivateThisTab(radio) {
    $('#displayWaterSupply').hide();
    $('#displayDemand').hide();
    $('#displayRiverReservoirs').hide();
    $(radio).show();
}