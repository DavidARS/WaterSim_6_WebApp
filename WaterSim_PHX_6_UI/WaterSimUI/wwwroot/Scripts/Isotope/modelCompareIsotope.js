/*SXI1211: Changes for model comparer
Date: Feb 09 2017
*/
// init Alpha Model Supply Isotope
var $cM_isotope_supply_container = $('#cM-isotope-supply-container').isotope({
    // options
});

//init Beta Model supply container
var $cMBeta_isotope_supply_container = $('#cMBeta-isotope-supply-container').isotope({
    // options
});

// filter Alpha Model Supply items on button click
$('#cM-isotope-supply-filters').on('click', '.button', function (event) {
    var filtr = $(this).attr('data-filter');
    $cM_isotope_supply_container.isotope({ filter: filtr });
    $cMBeta_isotope_supply_container.isotope({ filter: filtr });
});


// init Alpha Model Reservoir Isotope
var $cM_isotope_reservoir_container = $('#cM-isotope-reservoir-container').isotope({
    // options
});

// init Beta Model Climate Isotope
var $cMBeta_isotope_reservoir_container = $('#cMBeta-isotope-reservoir-container').isotope({
    // options
});

// filter Alpha Model items on button click
$('#cM-isotope-reservoir-filters').on('click', '.button', function (event) {
    var filtr = $(this).attr('data-filter');
    $cM_isotope_reservoir_container.isotope({ filter: filtr });
    $cMBeta_isotope_reservoir_container.isotope({ filter: filtr });
});


// init Alpha Model Demand Isotope
var $cM_isotope_demand_container = $('#cM-isotope-demand-container').isotope({
    // options
});

// init Beta Model Demand Isotope
var $cMBeta_isotope_demand_container = $('#cMBeta-isotope-demand-container').isotope({
    // options
});

// filter Alpha Model demand items on button click
$('#cM-isotope-demand-filters').on('click', '.button', function (event) {
    var filtr = $(this).attr('data-filter');
    $cM_isotope_demand_container.isotope({ filter: filtr });
    $cMBeta_isotope_demand_container.isotope({ filter: filtr });
});

/*SXI1211 Edit End region*/