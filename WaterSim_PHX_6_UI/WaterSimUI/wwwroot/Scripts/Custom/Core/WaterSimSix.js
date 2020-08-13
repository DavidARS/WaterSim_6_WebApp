//-----------------------------------------------
var ScenarioDefault = 7;
var IwaniecScenario = ScenarioDefault;

function SetScenarioRadio(value) {
    switch (value) {
        //SAMPSON EDIT BEGIN 01/02/17 - Add Iwaniec Scenarios dropdown
        //Set 7 (Strategic) as default
        case "1":
            //$('input[id="RBdry"]').prop('checked', true);
            $('#scenarioList').val('1')
            SetScenarioValues('1');
            break;
        case "2":
            //$('input[id="RBmed"]').prop('checked', true);
            $('#scenarioList').val('2')
            SetScenarioValues('2');
            break;
        case "3":
            //$('input[id="RBwet"]').prop('checked', true);
            $('#scenarioList').val('3')
            SetScenarioValues('3');
            break;
        case "4":
            //$('input[id="RBmix"]').prop('checked', true);
            $('#scenarioList').val('4')
            SetScenarioValues('4');
            break;
        case "5":
            //$('input[id="RBmix"]').prop('checked', true);
            $('#scenarioList').val('5')
            SetScenarioValues('5');
            break;
        case "6":
            //$('input[id="RBmix"]').prop('checked', true);
            $('#scenarioList').val('6')
            SetScenarioValues('6');
            break;
        case "7":
            //$('input[id="RBmix"]').prop('checked', true);
            $('#scenarioList').val('7')
            SetScenarioValues('7');
            break;


        default:
            //$('input[id="RBdry"]').prop('checked', true);
            $('#scenarioList').val('7')
            SetScenarioValues('med');
          
            //SAMPSON EDIT END 01/03/17
    }

}
//-----------------------------------------------
//SAMPSON EDIT BEGIN 01/02/17 - Added dropdown

$('#scenarioList').change(function () {
    var scenarioValue = this.value;
    SetScenarioValues(scenarioValue);
    //SetScenarioLabels();
    SetRunButtonState(true);
})
//SAMPSON EDIT END 01/02/17
//-----------------------------------------------
function SetScenarioValues(value) {
    switch (value) {
        case "1":
            IwaniecScenario = 1;
            break;
        case "2":
            IwaniecScenario = 2;
            break;
        case "3":
            IwaniecScenario = 3;
            break;
        case "4":
            IwaniecScenario = 4;
            break;
        case "5":
            IwaniecScenario = 5;
            break;
        case "6":
            IwaniecScenario = 6;
            break;
        case "7":
            IwaniecScenario = 7;
            break;



        default:
            IwaniecScenario = ScenarioDefault;
    }
}

var outdoorControlHidden = true;
$("#GraphControls_ODUInputUserControl_ControlContainer").hide();
$("#OutDoorWaterControl").click(onCreateOutDoorControl);
//$("#RODInputUserControl_divslider").attr("data-def", 0);
//
$("#GraphControls_RECInputUserControl_ControlContainer").show();
$("#GraphControls_ENVIInputUserControl_ControlContainer").hide();
$("#GraphControls_AGRIInputUserControl_ControlContainer").hide();
//
function onCreateOutDoorControl(e) {
    if (!outdoorControlHidden) {
        $("#OutDoorWaterControl").css('color', 'black');
        // increment count
        $("#GraphControls_ODUInputUserControl_ControlContainer").hide();
        $("#GraphControls_ODUInputUserControl_divslider").attr("data-def", 100);
        //
        $("#GraphControls_RECInputUserControl_ControlContainer").hide();
        $("#GraphControls_RECInputUserControl_divslider").attr("data-def", 18);
        $("#GraphControls_ENVIInputUserControl_ControlContainer").hide();
        $("#GraphControls_ENVIInputUserControl_divslider").attr("data-def", 0);


        //
        setSlider();
        //Optionally you can force a model rerun here so that the system reflects the default for that control
        runModel();
        outdoorControlHidden = true;
    }
    else {
        $("#GraphControls_ODUInputUserControl_ControlContainer").show();
        $("#OutDoorWaterControl").css('color', 'red');
        outdoorControlHidden = false;
    }


}
