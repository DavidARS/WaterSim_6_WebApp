/*SXI1211
3 Feb 2016
Description: Changes for policy tab in settings panel.
Policy tab added in the settings slider on site.master
The policy tab will control the visibility of policies on the main window.
*/
if (getWindowType() != 'Charts') {
    $(document).ready(function () {
        //Initialize policy selector
        $('.policy-select').chosen({
            width: "100%",
            max_selected_options: 5
        });

        $('.policy-select').chosen().change(function (evt, params) {
            var deselected = (!(params.deselected === undefined) && params.selected === undefined);
            var choice = deselected ? params.deselected : params.selected;
            selectPolicyVisibility(choice, deselected);
        });
    });

    //Controls the visibility of Scenarion section in settings tab on the change of tab to policy
    $('.temporalTab').click(function () {
        $('#settings-tabs-scenarios').show();
    });

    $('.geographyTab').click(function () {
        $('#settings-tabs-scenarios').show();
    });

    $('.policyTab').click(function () {
        $('#settings-tabs-scenarios').hide();
    });
}

function selectPolicyVisibility(choice, deselected) {
    switch (choice) {
        case 'AGRI': deselected ? $("#GraphControls_AGRIInputUserControl_ControlContainer").hide() : $("#GraphControls_AGRIInputUserControl_ControlContainer").show();
            break;
        case 'ENVI': deselected ? $("#GraphControls_ENVIInputUserControl_ControlContainer").hide() : $("#GraphControls_ENVIInputUserControl_ControlContainer").show();
            break;
        case 'PERS': deselected ? $("#GraphControls_PERSInputUserControl_ControlContainer").hide() : $("#GraphControls_PERSInputUserControl_ControlContainer").show();
            break;
        case 'POP': deselected ? $("#GraphControls_POPInputUserControl_ControlContainer").hide() : $("#GraphControls_POPInputUserControl_ControlContainer").show();
            break;
        case 'ODU': deselected ? $("#GraphControls_ODUInputUserControl_ControlContainer").hide() : $("#GraphControls_ODUInputUserControl_ControlContainer").show();
            break;
        case 'REC': deselected ? $("#GraphControls_RECInputUserControl_ControlContainer").hide() : $("#GraphControls_RECInputUserControl_ControlContainer").show();
            break;
        case 'RTOS': deselected ? $("#GraphControls_RTOSInputUserControl_ControlContainer").hide() : $("#GraphControls_RTOSInputUserControl_ControlContainer").show();
            break;
        case 'ROD': deselected ? $("#GraphControls_RODInputUserControl_ControlContainer").hide() : $("#GraphControls_RODInputUserControl_ControlContainer").show();
            break;
    }
    return true;
}
//EOF