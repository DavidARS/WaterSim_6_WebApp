<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ModelCompareControl.ascx.cs" Inherits="WaterSimUI.UserControls.ModelCompareControl" %>
<%@ Register Src="OutputUserControl.ascx" TagName="OutputUserControl" TagPrefix="Wsmo" %>

<link href="Content/horizontal.css" rel="stylesheet" />
<link href="Content/isotope.css" rel="stylesheet" />
<style type="text/css">
    .modelContentMain {
        width: 1330px;
        padding: 0px;
        position: relative;
    }

        .modelContentMain:after {
            display: table;
            clear: both;
            content: '';
        }

    .alphaModelContainer {
        width: 1300px;
        float: left;
        overflow: hidden;
        height: 495px;
    }

    .alphaConstrict {
        width: 530px;
        float: left;
        overflow: hidden;
        padding: 10px 25px 10px 25px;
        margin-left: 50px;
        border: solid;
        border-width: 1px;
    }

    .betaConstrict {
        width: 530px;
        float: right;
        overflow: hidden;
        padding: 10px 25px 10px 25px;
        margin-right: 50px;
        border: solid;
        border-width: 1px;
    }

    .filterSection {
        position: absolute;
        margin-left: 35px;
        top: 0;
        bottom: 0;
        width: 800px;
        height: 100px;
        vertical-align: bottom;
        float: left;
        margin-top: 400px;
    }

    .displaySection {
        position: relative;
    }
</style>


<div id="CompareControlMain" style="width: 100%">
    <div class="modelContentMain">
        <div id="compareAlphaTabs">
            <div id="compareTabs">
                <input type="radio" id="WaterSupplyRadio" onclick="ActivateThisTab('#displayWaterSupply')" name="outputSelector" value="WaterSupply" checked="checked" />
                Water Supply
            &nbsp;
            <input type="radio" id="DemandRadio" onclick="ActivateThisTab('#displayDemand')" name="outputSelector" value="Demand" />
                Demand
            &nbsp;
            <input type="radio" id="RiversRiservoirsRadio" onclick="ActivateThisTab('#displayRiverReservoirs')" name="outputSelector" value="RiversRiservoirs" />
                Rivers and Riservoirs           
            <br />
            </div>
            <br />
            <div class="alphaModelContainer">
                <div class="alphaModelContent">
                    <div id="alphaModelCharts">
                        <!------------------------------  WATER SUPPLY TAB ------------------------------------------------->
                        <div id="displayWaterSupply" class="displaySection">
                            <div class="alphaConstrict">
                                <h1>Model One</h1>
                                Scenario Used: <span class="AlphaScenario"></span>
                                <br />
                                <div id="cM-dragResize-tab-1-off" class="click-to-top">
                                    <div class="scrollbar">
                                        <div class="handle">
                                            <div class="mousearea"></div>
                                        </div>
                                    </div>
                                    <div class="frame" id="cM-basic-supply">
                                        <div id="cM-isotope-supply-container">
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
                                </div>
                            </div>

                            <div class="betaConstrict">
                                <h1>Model Two</h1>
                                Scenario Used: <span class="BetaScenario"></span>
                                <br />
                                <div id="cMBeta-dragResize-tab-1-off" class="click-to-top">
                                    <div class="scrollbar">
                                        <div class="handle">
                                            <div class="mousearea"></div>
                                        </div>
                                    </div>
                                    <div class="frame" id="cMBeta-basic-supply">
                                        <div id="cMBeta-isotope-supply-container">
                                            <div class="item transition Supply">
                                                <div class="chart">
                                                    <Wsmo:OutputUserControl runat="server" ID="OutputUserControl1" Type="MFOP" FieldName="WATAUGUSED,BNKUSED,RECTOT,MGWPUMP,SRPSURF,SRPGW,COLDELIV,NONPOTAB" Title="Water Source" SeriesColors="8" />
                                                </div>
                                            </div>
                                            <div class="item transition Supply">
                                                <div class="chart">
                                                    <Wsmo:OutputUserControl runat="server" ID="OutputUserControl2" Type="MFOP" FieldName="MGWPUMP,SRPGW,AGPUMPED" Title="Groundwater Pumped" SeriesColors="6" />
                                                </div>
                                            </div>

                                            <div class="item transition Ratios">
                                                <div class="chart">
                                                    <Wsmo:OutputUserControl runat="server" ID="OutputUserControl3" Type="MFOP" FieldName="RAINOUT,GRAYOUT,RECOUT" Title="Outdoor Demand met by Non-potable Sources" SeriesColors="6" />
                                                </div>
                                            </div>

                                            <div class="item transition Rainwater">
                                                <div class="chart">
                                                    <Wsmo:OutputUserControl runat="server" ID="OutputUserControl4" Type="MFOP" FieldName="RAINSF,RAINMF,RAINPU" Title="Residential Rain Water Harvested" SeriesColors="10" />
                                                </div>
                                            </div>
                                            <div class="item transition GrayWater">
                                                <div class="chart">
                                                    <Wsmo:OutputUserControl runat="server" ID="OutputUserControl5" Type="MFOP" FieldName="RESGRAY,COMGRAY,INDGRAY" Title="Gray Water Used" SeriesColors="6" />
                                                </div>
                                            </div>

                                            <div class="item transition Rainwater">
                                                <div class="chart">
                                                    <Wsmo:OutputUserControl runat="server" ID="OutputUserControl6" Type="MFOP" FieldName="RAINHARV,STORMHARV" Title="Total Rain- and Storm- Water" SeriesColors="9" />
                                                </div>
                                            </div>
                                            <div class="item transition WasteWater">
                                                <div class="chart">
                                                    <Wsmo:OutputUserControl runat="server" ID="OutputUserControl7" Type="MFOP" FieldName="EFLCRT,AGEFF,EFLPP,EFLDISC,EFLVADOS" Title="Effluent Water" SeriesColors="10" />
                                                </div>
                                            </div>
                                            <div class="item transition WasteWater">
                                                <div class="chart">
                                                    <Wsmo:OutputUserControl runat="server" ID="OutputUserControl8" Type="MFOP" FieldName="RECTOT,RECINJEC,RECDISC,RECVADOS" Title="Reclaimed Water" SeriesColors="10" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="filterSection">
                                <div id="cM-isotope-supply-filters" class="button-group shifted-down">
                                    <a class="button" data-filter=".Supply" aria-checked="true">Water Supply</a>
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
                        <div id="displayDemand" class="displaySection">
                            <div class="alphaConstrict">
                                <h1>Model One</h1>
                                Scenario Used: <span class="AlphaScenario"></span>
                                <br />
                                <div id="cM-dragResize-tab-2-off" class="click-to-top">
                                    <div class="scrollbar">
                                        <div class="handle">
                                            <div class="mousearea"></div>
                                        </div>
                                    </div>
                                    <div class="frame" id="cM-basic-demand">
                                        <div id="cM-isotope-demand-container">
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

                                </div>
                            </div>

                            <div class="betaConstrict">
                                <h1>Model Two</h1>
                                Scenario Used: <span class="BetaScenario"></span>
                                <br />
                                <div id="cMBeta-dragResize-tab-2-off" class="click-to-top">
                                    <div class="scrollbar">
                                        <div class="handle">
                                            <div class="mousearea"></div>
                                        </div>
                                    </div>
                                    <div class="frame" id="cMBeta-basic-demand">
                                        <div id="cMBeta-isotope-demand-container">
                                            <div class="item transition lclu">
                                                <div class="chart">
                                                    <Wsmo:OutputUserControl runat="server" ID="OutputUserControl9" Type="MFOP" FieldName="LDENDEM,MDENDEM,HDENDEM,TURFDEM,GREENDEM,TREEDEM,AGDEM" Title="LCLU Estimates of Water Demand" SeriesColors="8" />
                                                </div>
                                            </div>
                                            <div class="item transition population">
                                                <div class="chart">
                                                    <Wsmo:OutputUserControl runat="server" ID="OutputUserControl10" Type="OFMP" FieldName="POPUSED" Title="Population" SeriesColors="5" />
                                                </div>
                                            </div>
                                            <div class="item transition gpcd">
                                                <div class="chart">
                                                    <Wsmo:OutputUserControl runat="server" ID="OutputUserControl11" Type="MFOP" FieldName="GPCDCOMIND,GPCDRES" Title="Gallons per Person per Day" SeriesColors="7" />
                                                </div>
                                            </div>
                                            <div class="item transition gpcd">
                                                <div class="chart">
                                                    <Wsmo:OutputUserControl runat="server" ID="OutputUserControl12" Type="OFMPL" FieldName="GPCDUSED" Title="Total GPCD By Provider" SeriesColors="2" />
                                                </div>
                                            </div>
                                            <div class="item transition gpcdLCLU">
                                                <div class="chart">
                                                    <Wsmo:OutputUserControl runat="server" ID="OutputUserControl13" Type="MFOP" FieldName="LRINGPCD,MRINGPCD,HRINGPCD" Title="Indoor Gallons per Person per Day" SeriesColors="10" />
                                                </div>
                                            </div>
                                            <div class="item transition gpcdLCLU">
                                                <div class="chart">
                                                    <Wsmo:OutputUserControl runat="server" ID="OutputUserControl14" Type="MFOP" FieldName="LROUTGPCD,MROUTGPCD,HROUTGPCD" Title="Outdoor Gallons per Person per Day" SeriesColors="10" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="filterSection">
                                <div id="cM-isotope-demand-filters" class="button-group shifted-down">
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
                        <div id="displayRiverReservoirs" class="displaySection">
                            <div class="alphaConstrict">
                                <h1>Model One</h1>
                                Scenario User: <span class="AlphaScenario"></span>
                                <br />
                                <div id="cM-dragResize-tab-3-off" class="click-to-top">
                                    <div class="scrollbar">
                                        <div class="handle">
                                            <div class="mousearea"></div>
                                        </div>
                                    </div>
                                    <div class="frame" id="cM-basic-reservoirs">
                                        <div id="cM-isotope-reservoir-container">
                                            <div class="item transition reservoirsCO">
                                                <div class="chart">
                                                    <Wsmo:OutputUserControl runat="server" ID="OutputControl9" Type="BASEA" FieldName="POWSTORE,MEDSTORE" Title="Water Storage: Lake Powell and Lake Mead" SeriesColors="4" />
                                                </div>
                                            </div>
                                            <div class="item transition reservoirsCO">
                                                <div class="chart">
                                                    <Wsmo:OutputUserControl runat="server" ID="OutputControl13" Type="BASEAL" FieldName="MEADELEV,MDDPL,MDSSL,MDSSH,MDMPL" Title="Lake Mead Elevation(s)" SeriesColors="3" />
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
                                </div>
                            </div>

                            <div class="betaConstrict">
                                <h1>Model Two</h1>
                                Scenario User: <span class="BetaScenario"></span>
                                <br />
                                <div id="cMBeta-dragResize-tab-3-off" class="click-to-top">
                                    <div class="scrollbar">
                                        <div class="handle">
                                            <div class="mousearea"></div>
                                        </div>
                                    </div>
                                    <div class="frame" id="cMBeta-basic-reservoirs">
                                        <div id="cMBeta-isotope-reservoir-container">
                                            <div class="item transition reservoirsCO">
                                                <div class="chart">
                                                    <Wsmo:OutputUserControl runat="server" ID="OutputUserControl15" Type="BASEA" FieldName="POWSTORE,MEDSTORE" Title="Water Storage: Lake Powell and Lake Mead" SeriesColors="4" />
                                                </div>
                                            </div>
                                            <div class="item transition reservoirsCO">
                                                <div class="chart">
                                                    <Wsmo:OutputUserControl runat="server" ID="OutputUserControl16" Type="BASEAL" FieldName="MEADELEV,MDDPL,MDSSL,MDSSH,MDMPL" Title="Lake Mead Elevation(s)" SeriesColors="3" />
                                                </div>
                                            </div>
                                            <div class="item transition traces">
                                                <div class="chart">
                                                    <Wsmo:OutputUserControl runat="server" ID="OutputUserControl17" Type="BASEL" FieldName="CORFLOW" Title="Flow on the Colorado River" SeriesColors="1" />
                                                </div>
                                            </div>
                                            <div class="item transition reservoirsSV">
                                                <div class="chart">
                                                    <Wsmo:OutputUserControl runat="server" ID="OutputUserControl18" Type="BASEA" FieldName="SRSTORE,VRSTORE" Title="Water Storage: Salt-Verde" SeriesColors="4" />
                                                </div>
                                            </div>
                                            <div class="item transition traces">
                                                <div class="chart">
                                                    <Wsmo:OutputUserControl runat="server" ID="OutputUserControl19" Type="BASEL" FieldName="STRFLOW,VRFLOW" Title="Salt-Verde River Flows" SeriesColors="1" />
                                                </div>
                                            </div>
                                            <div class="item transition aquifer">
                                                <div class="chart">
                                                    <Wsmo:OutputUserControl runat="server" ID="OutputUserControl20" Type="BASEA" FieldName="REGAQBAL" Title="Regional Aquifer Level" SeriesColors="1" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="filterSection">
                                <div id="cM-isotope-reservoir-filters" class="button-group shifted-down">
                                    <a class="button" data-filter=".reservoirsCO">CO Reservoirs</a>
                                    <a class="button" data-filter=".reservoirsSV">SV Reservoirs</a>
                                    <a class="button" data-filter=".traces">Traces</a>
                                    <a class="button" data-filter=".aquifer">Aquifer</a>
                                    <a class="button" data-filter="*">All</a>
                                </div>
                            </div>
                        </div>
                        <!-----------------------------  END OF RIVERS and RESERVOIRS -------------------------------------------------->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="../Scripts/Sly/sly.js" type="text/javascript"></script>
<script src="../Scripts/Sly/horizontal-compare.js" type="text/javascript"></script>
<script src="../Scripts/Isotope/isotope.pkgd.js" type="text/javascript"></script>
