<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WaterSimUI._Default" %>

<%@ Register Src="UserControls/OutputUserControl.ascx" TagName="OutputUserControl" TagPrefix="Wsmo" %>

<%@ Register Src="UserControls/InputUserControl.ascx" TagName="InputUserControl" TagPrefix="Wsmi" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="GraphControls">
    <link href="Content/horizontal.css" rel="stylesheet" />
    <link href="Content/isotope.css" rel="stylesheet" />

    <div id="tabs">
        <ul style="border-bottom: 1px solid !important;">
            <li><a href="#tabs-1">INPUTS:
                <br />
                Climate/River Flows</a></li>
            <li><a href="#tabs-6">SCENARIOS:
                <br />
                15m LCLU </a></li>
            <li><a href="#tabs-2">OUTPUTS:
                <br />
                Supply</a></li>
            <li><a href="#tabs-3">OUTPUTS:
                <br />
                Demand</a></li>
            <li><a href="#tabs-4">OUTPUTS:
                <br />
                Reservoirs/Rivers</a></li>
            <li><a href="#tabs-5">OUTPUTS:
                <br />
                Sustainability</a></li>
        </ul>
        <!-------------------------  CLIMATE and DROUGHT -------------------------------------------->
        <div id="dragResize-tab-1-off" class="click-to-top">
            <div id="tabs-1" style="height: 625px">
                <div id="settings-tabs-climateDrought" style="background-color: #E6E6E6; position: relative;">
                    <div id="scenariosDiv">
                        <div style="width: 315px; margin-left: 10px">
                            <h1 style="padding-bottom: 1px">Scenario Used</h1>
                            <div id="SCENHelpControlContainer" class="help" data-key="SCEN">
                                <img style="" src="Images/icon_help.png" />
                            </div>
                            <div id="IwaniecScen" style="width: 400px !important">
                                <select id="scenarioList" name="scenario">
                                    <option id="G" value="0">Standard</option>
                                    <option id="AD" value="1">Adaptive Drought</option>
                                    <option id="AF" value="2">Adaptive Flood</option>
                                    <option id="AH" value="3">Adaptive Heat</option>
                                    <option id="HHH" value="4">Healthy Harvest Hubs</option>
                                    <option id="EC" value="5">Emerald City</option>
                                    <option id="ZW" value="6">Zero Waste</option>
                                    <option id="BAU" value="7" selected>Strategic</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div id="policiesDiv">
                        <aside id="left-sidebar" style="border: solid; border-width: 1px">
                            <asp:Panel ID="PanelUserInputs" runat="server">
                                <br />
                                <h1 style="padding-bottom: 7px">Policy Choices</h1>
                                <Wsmi:InputUserControl ID="AGRIInputUserControl" FieldKeyWord="WEBAGTR1" runat="server" />
                                <Wsmi:InputUserControl ID="ENVIInputUserControl" FieldKeyWord="ENFLOPCT" runat="server" />
                                <Wsmi:InputUserControl ID="PERSInputUserControl" FieldKeyWord="WEBPRPCT" runat="server" />
                                <Wsmi:InputUserControl ID="POPInputUserControl" FieldKeyWord="WEBPOPGR" runat="server" />
                                <Wsmi:InputUserControl ID="ODUInputUserControl" FieldKeyWord="WEBOUTDOOR" runat="server" />
                                <Wsmi:InputUserControl ID="RECInputUserControl" FieldKeyWord="REGRECEFF" runat="server" />
                                <Wsmi:InputUserControl ID="RTOSInputUserControl" FieldKeyWord="WEBRECIN" runat="server" />
                                <Wsmi:InputUserControl ID="RODInputUserControl" FieldKeyWord="WEBRECOUT" runat="server" />
                            </asp:Panel>
                        </aside>
                    </div>
                    <div id="climateTab">
                        <h7>Climate Effect on Riverine Flows</h7>
                        <br />
                        <h_1> Graduated Effect</h_1>
                        <div id="settings-tabs-climate">
                            <Wsmi:InputUserControl ID="InputUserControl1" FieldKeyWord="COCLMADJ" runat="server" />
                            <Wsmi:InputUserControl ID="InputUserControl2" FieldKeyWord="SVCLMADJ" runat="server" />
                            <div id="GraphControls_InputUserControl123_ControlContainer" class="InputControlStyleOnly" data-key="CLIEFF">
                                <span id="GraphControls_InputUserControl123_lblSliderfldName">Predefined Climate Effect on Riverine Flows</span>  <span id="GraphControls_InputUserControl123_lblSliderVal" style="display: none;">0</span>
                                <span id="GraphControls_InputUserControl123_lblunits"></span>
                                <div id="GraphControls_InputUserControl123_containerHelp" class="help">
                                    <input id="GraphControls_InputUserControl123_hvHelpURI" value="Content/HELPFILES/" type="hidden"/>
                                    <img src="../Images/icon_help.png"/>
                                </div>
                                <span id="GraphControls_InputUserControl123_lblSliderKeyWord" style="display: none;">CLIEFF</span>
                                <div id="CLIInputUserControl_buttonset" class="radio-container realclearfix controlgroup" style="float: left;">
                                    <input type="radio" id="CLIInputUserControl_radio_5" name="CLIInputUserControl_radio" value="5" /><label for="CLIInputUserControl_radio_5">Flood</label>

                                    <input type="radio" id="CLIInputUserControl_radio_0" name="CLIInputUserControl_radio" value="0" checked="checked"/><label for="CLIInputUserControl_radio_0">No Effect</label>
                                    <input type="radio" id="CLIInputUserControl_radio_1" name="CLIInputUserControl_radio" value="1"/><label for="CLIInputUserControl_radio_1">Slight</label>
                                    <input type="radio" id="CLIInputUserControl_radio_3" name="CLIInputUserControl_radio" value="3" /><label for="CLIInputUserControl_radio_3">Moderate</label>
                                    <input type="radio" id="CLIInputUserControl_radio_4" name="CLIInputUserControl_radio" value="4" /><label for="CLIInputUserControl_radio_4">Severe</label>
                                                  </div>
                            </div>
                        </div>
                    </div>
                    <div id="startYear">
                        <label id="COFLOWYR" style="color: #990033">Colorado River Start Year: 1922 </label>
                        <br />
                        <br />
                        <label id="SVFLOWYR" style="color: #990033">Salt-Verde Rivers Start Year: 1946</label>
                    </div>
                    <div id="droughtTab">
                        <h7>Drought Effect on River Flows</h7>
                        <br />
                        <%--<h_1> Only During Bracketed Years</h_1>--%>
                        <div id="settings-tabs-drought-test">
                            <Wsmi:InputUserControl ID="InputUserControl3" FieldKeyWord="DROUSCEN" runat="server" />

                        </div>
                    </div>
                    <div id="Image_container">
                        <img src="images\Low.png" id="img1" />
                        <img src="images\Median.png" id="img2" />
                        <img src="images\High.png" id="img3" />
                        <img src="images\Variable.png" id="img4" />
                    </div>


                    <div id="riverTab">
                        <h7>Thirty-year River Flow Record</h7>
                        <br />
                        <div>
                            <h_1>Magnitude and Pattern</h_1>
                        </div>
                        <div id="TRACESHelpControlContainer" class="help" data-key="TRACES">
                            <img style="" src="Images/icon_help.png" />
                        </div>
                        <div id="FlowRecord">
                            <select id="flowRecordList" name="flowRecord">
                                <option id="RBdry" value="dry" selected>Low flow years</option>
                                <option id="RBmed" value="med">Median flow years</option>
                                <option id="RBwet" value="wet">High flow years</option>
                                <option id="RBmix" value="mix">High inter-annual variability</option>
                            </select>
                        </div>
                        <div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-------------------------  END CLIMATE and DROUGHT -------------------------------------------->

        <!------------------------------  WATER SUPPLY TAB ------------------------------------------------->
        <div id="dragResize-tab-2-off" class="click-to-top">
            <div id="tabs-2">
                <div class="scrollbar">
                    <div class="handle">
                        <div class="mousearea"></div>
                    </div>
                </div>

                <div class="frame" id="basic-supply">
                    <div id="isotope-supply-container">
                        <div class="item transition Supply">
                            <div class="chart">
                                <Wsmo:OutputUserControl runat="server" ID="OutputControl1" Type="MFOP" FieldName="WATAUGUSED,BNKUSED,RECTOT,MGWPUMP,SRPSURF,SRPGW,COLDELIV,NONPOTAB" Title="Water Source" SeriesColors="8" />
                            </div>
                        </div>
                        <div class="item transition Supply">
                            <div class="chart">
                                <Wsmo:OutputUserControl runat="server" ID="OutputControl1a" Type="MFOP" FieldName="MGWPUMP,SRPGW,AGPUMPED" Title="Groundwater Pumped" SeriesColors="6" />
                            </div>
                        </div>

                        <div class="item transition Ratios">
                            <div class="chart">
                                <Wsmo:OutputUserControl runat="server" ID="OutputControlDEM" Type="MFOP" FieldName="RAINOUT,GRAYOUT,RECOUT" Title="Outdoor Demand met by Non-potable Sources" SeriesColors="6" />
                            </div>
                        </div>

                        <div class="item transition Rainwater">
                            <div class="chart">
                                <Wsmo:OutputUserControl runat="server" ID="OutputControl_RainHarvest" Type="MFOP" FieldName="RAINSF,RAINMF,RAINPU" Title="Residential Rain Water Harvested" SeriesColors="10" />
                            </div>
                        </div>
                        <div class="item transition GrayWater">
                            <div class="chart">
                                <Wsmo:OutputUserControl runat="server" ID="OutputControl_GrayWater" Type="MFOP" FieldName="RESGRAY,COMGRAY,INDGRAY" Title="Gray Water Used" SeriesColors="6" />
                            </div>
                        </div>

                        <div class="item transition Rainwater">
                            <div class="chart">
                                <Wsmo:OutputUserControl runat="server" ID="OutputControl_RainStormHarvest" Type="MFOP" FieldName="RAINHARV,STORMHARV" Title="Total Rain- and Storm- Water" SeriesColors="9" />
                            </div>
                        </div>
                        <div class="item transition WasteWater">
                            <div class="chart">
                                <Wsmo:OutputUserControl runat="server" ID="OutputControl_Waste1" Type="MFOP" FieldName="EFLCRT,AGEFF,EFLPP,EFLDISC,EFLVADOS" Title="Effluent Water" SeriesColors="10" />
                            </div>
                        </div>
                        <div class="item transition WasteWater">
                            <div class="chart">
                                <Wsmo:OutputUserControl runat="server" ID="OutputControl_Waste2" Type="MFOP" FieldName="RECTOT,RECINJEC,RECDISC,RECVADOS" Title="Reclaimed Water" SeriesColors="10" />
                            </div>
                        </div>


                    </div>
                </div>

                <div id="isotope-supply-filters" class="button-group shifted-down">
                    <a class="button" data-filter=".Supply">Water Supply</a>
                    <a class="button" data-filter=".Ratios">Outdoor Non-Potable</a>
                    <a class="button" data-filter=".Rainwater">Rainwater</a>
                    <a class="button" data-filter=".GrayWater">Gray Water</a>
                    <a class="button" data-filter=".WasteWater">Effluent and Reclaimed</a>
                    <a class="button" data-filter="*">All</a>
                </div>

            </div>
        </div>
        <!------------------------------  END OF WATER SUPPLY TAB ------------------------------------------------->

        <!-------------------------------------  DEMAND ------------------------------------------------------------------->
        <div id="dragResize-tab-3-off" class="click-to-top">
            <div id="tabs-3">
                <%-- <div id="DEMANDHelpControlContainer" style="position:absolute; left:107px; top:25px" class="help" data-key="DEMAND" ><img style="" src="Images/icon_help.png" /></div>--%>

                <div class="scrollbar">
                    <div class="handle">
                        <div class="mousearea"></div>
                    </div>
                </div>
                <div class="frame" id="basic-demand">
                    <div id="isotope-demand-container">
                        <%--                                    <div class="item transition total"><div class="chart"><Wsmo:OutputUserControl runat="server" ID="OutputControl7" Type="OFMP" FieldName="TOTDEM" Title="Total Water Use"  SeriesColors="5"/></div></div>--%>
                        <div class="item transition lclu">
                            <div class="chart">
                                <Wsmo:OutputUserControl runat="server" ID="OutputControlLCLU" Type="MFOP" FieldName="LDENDEM,MDENDEM,HDENDEM,TURFDEM,GREENDEM,TREEDEM,AGDEM" Title="LCLU Estimates of Water Demand" SeriesColors="8" />
                            </div>
                        </div>

                        <div class="item transition population">
                            <div class="chart">
                                <Wsmo:OutputUserControl runat="server" ID="OutputControl5" Type="OFMP" FieldName="POPUSED" Title="Population" SeriesColors="5" />
                            </div>
                        </div>
                        <div class="item transition gpcd">
                            <div class="chart">
                                <Wsmo:OutputUserControl runat="server" ID="OutputControl8B" Type="MFOP" FieldName="GPCDCOMIND,GPCDRES" Title="Gallons per Person per Day" SeriesColors="7" />
                            </div>
                        </div>
                        <div class="item transition gpcd">
                            <div class="chart">
                                <Wsmo:OutputUserControl runat="server" ID="OutputControl8C" Type="OFMPL" FieldName="GPCDUSED" Title="Total GPCD By Provider" SeriesColors="2" />
                            </div>
                        </div>
                        <%-- --%>
                        <div class="item transition gpcdLCLU">
                            <div class="chart">
                                <Wsmo:OutputUserControl runat="server" ID="OutputControlInDoorGPCD" Type="MFOP" FieldName="LRINGPCD,MRINGPCD,HRINGPCD" Title="Indoor Gallons per Person per Day" SeriesColors="10" />
                            </div>
                        </div>
                        <div class="item transition gpcdLCLU">
                            <div class="chart">
                                <Wsmo:OutputUserControl runat="server" ID="OutputControlOutDoorGPCD" Type="MFOP" FieldName="LROUTGPCD,MROUTGPCD,HROUTGPCD" Title="Outdoor Gallons per Person per Day" SeriesColors="10" />
                            </div>
                        </div>


                    </div>
                </div>

                <div id="isotope-demand-filters" class="button-group shifted-down">
                    <%-- <a class="button display" data-filter=".total">Water Demand</a>--%>
                    <a class="button display" data-filter=".lclu">LCLU Demand</a>
                    <a class="button population-button" data-filter=".population">Population</a>
                    <a class="button display" data-filter=".gpcd">GPCD</a>
                    <a class="button display" data-filter=".gpcdLCLU">LCLU GPCD</a>
                    <a class="button display" data-filter="*">All</a>
                </div>

            </div>
        </div>
        <!------------------------------  END WATER SUPPLY TAB ------------------------------------------------->

        <!-----------------------------  RIVERS and RESERVOIRS -------------------------------------------------->
        <div id="dragResize-tab-4-off" class="click-to-top">
            <div id="tabs-4">
                <div class="scrollbar">
                    <div class="handle">
                        <div class="mousearea"></div>
                    </div>
                </div>

                <div class="frame" id="basic-reservoirs">
                    <div id="isotope-reservoir-container">
                        <div class="item transition reservoirsCO">
                            <div class="chart">
                                <Wsmo:OutputUserControl runat="server" ID="OutputControl9" Type="BASEA" FieldName="POWSTORE,MEDSTORE" Title="Water Storage: Lake Powell and Lake Mead" SeriesColors="4" />
                            </div>
                        </div>
                        <div class="item transition reservoirsCO">
                            <div class="chart">
                                <Wsmo:OutputUserControl runat="server" ID="OutputControl13" Type="BASEAL" FieldName="MEADELEV,MDDPL,MDSSL,MDSSH,MDSSM" Title="Lake Mead Elevation(s)" SeriesColors="3" />
                            </div>
                        </div>
                        <div class="item transition traces">
                            <div class="chart">
                                <Wsmo:OutputUserControl runat="server" ID="OutputControl10" Type="BASEL" FieldName="CORFLOW" Title="Flow on the Colorado River" SeriesColors="1" />
                            </div>
                        </div>
                        <div class="item transition reservoirsSV">
                            <div class="chart">
                                <Wsmo:OutputUserControl runat="server" ID="OutputControl11" Type="BASEA" FieldName="SRSTORE,VRSTORE" Title="Water Storage: Salt-Verde" SeriesColors="4" />
                            </div>
                        </div>
                        <div class="item transition traces">
                            <div class="chart">
                                <Wsmo:OutputUserControl runat="server" ID="OutputControl18" Type="BASEL" FieldName="STRFLOW,VRFLOW" Title="Salt-Verde River Flows" SeriesColors="1" />
                            </div>
                        </div>
                        <div class="item transition aquifer">
                            <div class="chart">
                                <Wsmo:OutputUserControl runat="server" ID="OutputControl3" Type="BASEA" FieldName="REGAQBAL" Title="Regional Aquifer Level" SeriesColors="1" />
                            </div>
                        </div>

                    </div>
                </div>

                <div id="isotope-reservoir-filters" class="button-group shifted-down">
                    <a class="button" data-filter=".reservoirsCO">CO Reservoirs</a>
                    <a class="button" data-filter=".reservoirsSV">SV Reservoirs</a>
                    <a class="button" data-filter=".traces">Traces</a>
                    <a class="button" data-filter=".aquifer">Aquifer</a>
                    <a class="button" data-filter="*">All</a>

                </div>

            </div>
        </div>
        <!-----------------------------  END OF RIVERS and RESERVOIRS -------------------------------------------------->

        <!------------------------------  SUSTAINABILITY INDICATORS------------------------------------------------------>
        <div id="dragResize-tab-5-off" class="click-to-top">
            <div id="tabs-5">

                <div class="scrollbar">
                    <div class="handle">
                        <div class="mousearea"></div>
                    </div>
                </div>
                <div class="frame" id="basic-sustain">
                    <div id="isotope-sustainability-container">
                        <%--                                       <div class="item transition Indicators"><div class="chart" ><Wsmo:OutputUserControl runat="server"  ID="OutputControl14" Type="BASEL" FieldName="SINPCTGW,SINDENV,SINDAG,SINDPC,SINYRGWR" Title="Temporal Sustainability Indicators"  SeriesColors="2"/></div></div>--%>
                        <div class="item transition Indicators">
                            <div class="chart">
                                <Wsmo:OutputUserControl runat="server" ID="OutputControl14" Type="BASEL" FieldName="SINPCTGW,SINDPC,SINYRGWR" Title="Temporal Sustainability Indicators" SeriesColors="2" />
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
        <!------------------------------  END OF SUSTAINABILITY INDICATORS------------------------------------------------------>

        <!----------------------------Begin 15m maps for the Sustainable Future Scenarios --------------------------------------->
        <div id="dragResize-tab-6-off" class="click-to-top">
            <div id="tabs-6">
                <div class="" id="basic-scenario">
                    <div id="Tabs2">
                        <ul class="innerTabs">
                            <li><a href="#tab1">Current </a></li>
                            <li><a href="#tab2">Adaptive </a></li>
                            <li><a href="#tab3">Transformative</a></li>
                        </ul>
                        <div id="tab1" class="tab_content">
                            <div id="Tabs3">
                                <ul class="innerTabs">
                                    <li><a href="#tabA">2015</a></li>
                                    <li><a href="#tabB">Densities</a></li>
                                </ul>
                                <div id="tabA">
                                    <ul class="innerTabs">
                                        <li>
                                            <img src="Content/Images/Current_2015.jpeg" class="scenarioImg" data-key="CURRENT" />
                                        </li>
                                    </ul>
                                </div>
                                <div id="tabB">
                                    <ul class="innerTabs">
                                        <li>
                                            <img src="Content/Images/LowMedHighDensity.jpeg" class="scenarioImg" />
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div id="tab2">
                            <div id="Tabs4">
                                <ul class="innerTabs">
                                    <li><a href="#tabD">Drought</a></li>
                                    <li><a href="#tabE">Flood</a></li>
                                    <li><a href="#tabF">Heat</a></li>
                                </ul>
                                <div id="tabD">
                                    <ul class="innerTabs">
                                        <li>
                                            <img src="Content/Images/ADrought.jpeg" class="scenarioImg" data-key="ADROUGHT" />
                                        </li>
                                    </ul>
                                </div>
                                <div id="tabE">
                                    <ul class="innerTabs">
                                        <li>
                                            <img src="Content/Images/AFlood.jpeg" class="scenarioImg" data-key="AFLOOD" />
                                        </li>
                                    </ul>
                                </div>
                                <div id="tabF">
                                    <ul class="innerTabs">
                                        <li>
                                            <img src="Content/Images/AHeat.jpeg" class="scenarioImg" data-key="AHEAT" />
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div id="tab3">
                            <div id="Tabs5">
                                <ul class="innerTabs">
                                    <li><a href="#tabG">Healthy Harvest Hubs</a></li>
                                    <li><a href="#tabH">Emerald City</a></li>
                                    <li><a href="#tabI">Zero Waste</a></li>
                                </ul>
                                <div id="tabG">
                                    <ul class="innerTabs">
                                        <li>
                                            <img src="Content/Images/HHH.jpeg" class="scenarioImg" data-key="HHHUBS" />
                                        </li>
                                    </ul>
                                </div>
                                <div id="tabH">
                                    <ul class="innerTabs">
                                        <li>
                                            <img src="Content/Images/ECity.jpeg" class="scenarioImg" data-key="ECITY" />
                                        </li>
                                    </ul>
                                </div>
                                <div id="tabI">
                                    <ul class="innerTabs">
                                        <li>
                                            <img src="Content/Images/ZWaste.jpeg" class="scenarioImg" data-key="ZWASTE" />
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!----------------------------------- End of Scenario 15 m maps -------------------------------------------------------->
    </div>

    <script src="Scripts/Sly/sly.js"></script>
    <script src="Scripts/Sly/horizontal-supply.js"></script>
    <script src="Scripts/Sly/horizontal-demand.js"></script>
    <script src="Scripts/Sly/horizontal-reservoirs.js"></script>
    <script src="Scripts/Sly/horizontal-climate.js"></script>

    <script src="Scripts/Isotope/isotope.pkgd.js"></script>
    <!-- QUAY EDIT 3/13/14 -->

    <script src="Scripts/Custom/Charts/ChartTools.js"></script>
    <script src="Scripts/Custom/Charts/DrillDownChartBO.js"></script>
    <script src="Scripts/Custom/Charts/ProvidersChart.js"></script>
    <!-- QUAY EDIT 3/13/14 -->

    <script src="Scripts/Custom/Charts/AreaChart.js"></script>
    <script src="Scripts/Custom/Charts/DrillDownColumnChartBO.js"></script>
    <script src="Scripts/Custom/Charts/DrillDownLineChartBO.js"></script>
    <script src="Scripts/Custom/Charts/DrillDownLineChartTEMP.js"></script>
    <script src="Scripts/Custom/Charts/DrillDownPieColumnChartMF.js"></script>
    <script src="Scripts/Custom/Charts/DrillDownPieColumnChartMP.js"></script>
    <script src="Scripts/Custom/Charts/DrillDownSingleColumnChart.js"></script>
    <script src="Scripts/Custom/Charts/StackedAreaChart.js"></script>
    <script src="Scripts/Custom/Charts/StackedColumnChart.js"></script>
    <!-- QUAY EDIT 3/13/14 -->
    <script src="Scripts/Custom/Charts/LineChartMP.js"></script>
    <!-- QUAY EDIT 3/13/14 -->

    <script src="Scripts/Highcharts/highcharts.js"></script>
    <script src="Scripts/HighCharts/modules/drilldown.js"></script>
    <script src="Scripts/Custom/Charts/HighChartsUnderscoreFix.js"></script>

    <!-- QUAY EDIT 6/30/14 
    Used to support Report Generation
    -->
    <script src="Scripts/rgbcolor.js"></script>
    <script src="Scripts/canvg.js"></script>
    <script src="Scripts/Highcharts/modules/exporting.js"></script>
    <script src='Scripts/Custom/qPbar.js'></script>
    <!-- ------------------------------------- -->
</asp:Content>


