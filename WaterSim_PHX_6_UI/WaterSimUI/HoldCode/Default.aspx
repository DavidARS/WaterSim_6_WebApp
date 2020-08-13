<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WaterSimUI._Default" %>

<%@ Register src="UserControls/OutputUserControl.ascx" tagname="OutputUserControl" tagprefix="Wsmo" %>

<%@ Register src="UserControls/InputUserControl.ascx" tagname="InputUserControl" tagprefix="Wsmi" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="GraphControls">
 
                    <link href="Content/horizontal.css" rel="stylesheet" />
                    <link href="Content/isotope.css" rel="stylesheet" />
 
                    <div id="tabs">
                        <ul style="border-bottom: 1px solid !important;">
                            <li><a href="#tabs-6">SCENARIOS: <br /> 15m LCLU </a></li> 
                            <li><a href="#tabs-2">OUTPUTS: <br /> Supply</a></li>
                            <li><a href="#tabs-3">OUTPUTS: <br />Demand</a></li>
                            <li><a href="#tabs-4">OUTPUTS: <br />Reservoirs/Rivers</a></li>
                            <li><a href="#tabs-5">OUTPUTS: <br />Sustainability</a></li>
                            <li><a href="#tabs-1">INPUTS: <br />Climate/River Flows</a></li>

                        </ul>
                 <!-------------------------  CLIMATE and DROUGHT -------------------------------------------->
                        <div id="dragResize-tab-1-off" class="click-to-top">
                            <div id="tabs-1" style="height:495px;"> 
                              <div id="settings-tabs-climateDrought" style="background-color:#E6E6E6">
                                       <div id="climateTab">
                                            <h7>Climate Effect on Riverine Flows</h7><br />
                                            <h_1> Graduated Effect</h_1>
                                            <div id="settings-tabs-climate" >
                                                <Wsmi:InputUserControl ID="InputUserControl1" FieldKeyWord="COCLMADJ" runat="server" />
                                                <Wsmi:InputUserControl ID="InputUserControl2" FieldKeyWord="SVCLMADJ" runat="server" />
                                                <div id="GraphControls_InputUserControl123_ControlContainer" class="InputControlStyleOnly" data-key="CLIEFF">
                                                    <span id="GraphControls_InputUserControl123_lblSliderfldName">Predefined Climate Effect on Riverine Flows</span>  <span id="GraphControls_InputUserControl123_lblSliderVal" style="display:none;">0</span> 
                                                      <span id="GraphControls_InputUserControl123_lblunits"></span>
                                                    <div id="GraphControls_InputUserControl123_containerHelp" class="help">
                                                        <input id="GraphControls_InputUserControl123_hvHelpURI" value="Content/HELPFILES/" type="hidden">
                                                        <img src="../Images/icon_help.png">
                                                    </div>
                                                    <span id="GraphControls_InputUserControl123_lblSliderKeyWord" style="display: none;">CLIEFF</span>
                                                    <div id="CLIInputUserControl_buttonset" class="radio-container realclearfix controlgroup" style="float:left;">
                                                        <input type="radio" id="CLIInputUserControl_radio_0" name="CLIInputUserControl_radio" value="0" checked="checked"><label for="CLIInputUserControl_radio_0">No Effect</label>
                                                        <input type="radio" id="CLIInputUserControl_radio_1" name="CLIInputUserControl_radio" value="1"><label for="CLIInputUserControl_radio_1">Minor</label>
                                                        <input type="radio" id="CLIInputUserControl_radio_2" name="CLIInputUserControl_radio" value="2"><label for="CLIInputUserControl_radio_2">Moderate</label>
                                                        <input type="radio" id="CLIInputUserControl_radio_3" name="CLIInputUserControl_radio" value="3"><label for="CLIInputUserControl_radio_3">Severe</label>
                                                    </div>
                                                </div>
                                            </div>  
                                       </div>
                                       <!-- -->
                                         <div id="Image_container">                                       
                                            <img src="images\Low.png" id="img1" />
                                            <img src="images\Median.png" id="img2" />
                                            <img src="images\High.png" id="img3" />
                                            <img src="images\Variable.png" id="img4" />
                                        </div>      
                                        <div  id="riverTab">
                                            <h7>Thirty-year River Flow Record</h7><br />
                                             <div><h_1>Magnitude and Pattern</h_1></div><div id="TRACESHelpControlContainer" class="help" data-key="TRACES"><img style="" src="Images/icon_help.png" /></div>
                                                <div id="FlowRecord" >
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

                                       <div id="startYear">
                                           <label id="COFLOWYR" style="color: #990033">Colorado River Start Year: 1922 </label>
                                           <br /><br />
                                           <label id="SVFLOWYR" style="color: #990033">Salt-Verde Rivers Start Year: 1946</label>
                                       </div>

                                        <div id="droughtTab">
                                            <h7>Drought Effect on River Flows</h7><br />
                                                <%--<h_1> Only During Bracketed Years</h_1>--%>
                                            <div id="settings-tabs-drought-test">
                                                <Wsmi:InputUserControl ID="InputUserControl3" FieldKeyWord="DROUSCEN" runat="server" />
 
                                            </div>
                                        </div>

                                       <!-- Start and End year in settings-tabs-climateDrought-2 -->

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
                                  <div class="item transition Supply"><div class="chart" ><Wsmo:OutputUserControl runat="server"  ID="OutputControl1" Type="MFOP" FieldName="WATAUGUSED,BNKUSED,RECTOT,MGWPUMP,SRPSURF,SRPGW,COLDELIV" Title="Water Source"  SeriesColors="8" /></div></div>
                                  <div class="item transition Supply"><div class="chart" ><Wsmo:OutputUserControl runat="server"  ID="OutputControl1a" Type="MFOP" FieldName="MGWPUMP,AGPUMPED,SRPGW" Title="Groundwater Pumped"  SeriesColors="7" /></div></div>
               
                                  <div class="item transition Ratios"><div class="chart" ><Wsmo:OutputUserControl runat="server"  ID="OutputControlNON" Type="BASEL" FieldName="NONPOUT,NONPDEM" Title="Non-potable Use to Outdoor and Total Demand"  SeriesColors="7"/></div></div>
                                  <div class="item transition Ratios"><div class="chart" ><Wsmo:OutputUserControl runat="server"  ID="OutputControlDEM" Type="BASEL" FieldName="RAINDEM,GRAYDEM" Title="Rain and Gray Water % of Outdoor Use"  SeriesColors="7"/></div></div>

 				                  <div class="item transition NonPotable"><div class="chart"><Wsmo:OutputUserControl runat="server" ID="OutputControl_RainHarvest" Type="MFOP" FieldName="RAINSF,RAINMF,RAINPU" Title="Rain Water Harvested: Residential"  SeriesColors="7"/></div></div>
                                  <div class="item transition NonPotable"><div class="chart"><Wsmo:OutputUserControl runat="server" ID="OutputControl_GrayWater" Type="MFOP" FieldName="RESGRAY,COMGRAY,INDGRAY" Title="Gray Water Used"  SeriesColors="3"/></div></div>

 			<%--	                  <div class="item transition NonPotable"><div class="chart"><Wsmo:OutputUserControl runat="server" ID="OutputControl_RainStormHarvest" Type="MFOP" FieldName="RAINHARV,STORMHARV" Title="Rain and Storm Water Harvested"  SeriesColors="7"/></div></div>--%>

         			    
                               </div>
			                </div>

                            <div id="isotope-supply-filters" class="button-group shifted-down">
                                <a class="button" data-filter=".Supply">Water Supply</a>
                                <a class="button" data-filter=".Ratios">Non-Potable Use</a>
                                <a class="button" data-filter=".NonPotable">Non-potable Water</a>
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
                                    <div class="item transition total"><div class="chart"><Wsmo:OutputUserControl runat="server" ID="OutputControl7" Type="OFMP" FieldName="TOTDEM" Title="Total Water Use"  SeriesColors="5"/></div></div>
 					                <div class="item transition population"><div class="chart"><Wsmo:OutputUserControl runat="server" ID="OutputControl5" Type="OFMP" FieldName="POPUSED" Title="Population"  SeriesColors="5"/></div></div>                                                                 
                                    <div class="item transition gpcd"><div class="chart"><Wsmo:OutputUserControl runat="server" ID="OutputControl8B" Type="MFOP" FieldName="GPCDCOMIND,GPCDRES" Title="Gallons per Person per Day"  SeriesColors="7"/></div></div>
                                    <div class="item transition gpcd"><div class="chart"><Wsmo:OutputUserControl runat="server" ID="OutputControl8C" Type="OFMPL" FieldName="GPCDUSED" Title="Total GPCD By Provider"  SeriesColors="2"/></div></div>
				                </div>
			                </div>
                       
                            <div id="isotope-demand-filters" class="button-group shifted-down">
                              <a class="button display" data-filter=".total">Water Demand</a>
                              <a class="button population-button" data-filter=".population">Population</a>
                              <a class="button display" data-filter=".gpcd">GPCD</a>
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
 <%-- 				                    <div class="item transition reservoirsCO"><div class="chart"><Wsmo:OutputUserControl runat="server" ID="OutputControl9" Type="BASEA" FieldName="POWSTORE,MEDSTORE" Title="Water Storage: Lake Powell and Lake Mead"  SeriesColors="4"/></div></div>--%>
                                    <div class="item transition reservoirsCO"><div class="chart"><Wsmo:OutputUserControl runat="server" ID="OutputControl13" Type="BASEAL" FieldName="MEADELEV,MDDPL,MDSSL,MDSSH,MDMPL" Title="Lake Mead Elevation(s)"  SeriesColors="3"/></div></div>
                                    <div class="item transition traces"><div class="chart"><Wsmo:OutputUserControl runat="server" ID="OutputControl10" Type="BASEL" FieldName="CORFLOW" Title="Flow on the Colorado River"  SeriesColors="1"/></div></div>
                                    <div class="item transition reservoirsSV"><div class="chart"><Wsmo:OutputUserControl runat="server" ID="OutputControl11" Type="BASEA" FieldName="SRSTORE,VRSTORE" Title="Water Storage: Salt-Verde"  SeriesColors="4"/></div></div>
                                    <div class="item transition traces"><div class="chart"><Wsmo:OutputUserControl runat="server" ID="OutputControl18" Type="BASEL" FieldName="STRFLOW,VRFLOW" Title="Salt-Verde River Flows"  SeriesColors="1" /></div></div>
                                </div>
			                </div>

                            <div id="isotope-reservoir-filters" class="button-group shifted-down">
                               <a class="button" data-filter=".reservoirsCO">CO Reservoirs</a>
                               <a class="button" data-filter=".reservoirsSV">SV Reservoirs</a>

                               <a class="button" data-filter=".traces">Traces</a>
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
                                       <div class="item transition Indicators"><div class="chart" ><Wsmo:OutputUserControl runat="server"  ID="OutputControl14" Type="BASEL" FieldName="SINPCTGW,SINDENV,SINDAG,SINDPC,SINYRGWR" Title="Temporal Sustainability Indicators"  SeriesColors="2"/></div></div>
                                     </div>
    	    	                  </div>

                        </div>
                      </div>
                  <!------------------------------  END OF SUSTAINABILITY INDICATORS------------------------------------------------------>
                        <div id="dragResize-tab-6-off" class="click-to-top">
                            <div id="tabs-6">
                                  <div class="" id="basic-scenario">
                                    <div id="Tabs2">
                                        <%-- <div id="isotope-scenario-container">--%>
                                        <ul class="innerTabs">
                                            <li><a href="#tab1">Current <br /> 2015</a></li>
                                            <li><a href="#tab2">Adaptive <br />Drought</a></li>
                                            <li><a href="#tab3">Adaptive <br />Flood</a></li>
                                            <li><a href="#tab4">Adaptive <br />Heat</a></li>
                                            <li><a href="#tab5">Healthy <br />HHubs</a></li>
                                            <li><a href="#tab6">Emerald <br />City</a></li>
                                            <li><a href="#tab7">Zero <br />Waste</a></li>
                                            <li><a href="#tab8">Residential<br />Densities</a></li>
                                        </ul>
                                        <div id="tab1" class="tab_content">
                                            <ul class="innerTabs">
                                                <li>
                                                    <img src="Content/Images/Current_2015.jpeg" class="scenarioImg" />
                                                </li>
                                            </ul>
                                        </div>
                                         <div id="tab2" class="tab_content">
                                            <ul>
                                                <li>
                                                    <img src="Content/Images/ADrought.jpeg" class="scenarioImg"/></li>
                                            </ul>
                                        </div>
                                        <div id="tab3" class="tab_content">
                                            <ul>
                                                <li>
                                                    <img src="Content/Images/AFlood.jpeg" class="scenarioImg"/></li>
                                            </ul>
                                        </div>
                                        <div id="tab4" class="tab_content">
                                            <ul>
                                                <li>
                                                    <img src="Content/Images/AHeat.jpeg" class="scenarioImg"/></li>
                                            </ul>
                                        </div>
                                        <div id="tab5" class="tab_content">
                                            <ul>
                                                <li>
                                                    <img src="Content/Images/HHH.jpeg" class="scenarioImg"/></li>
                                            </ul>
                                        </div>
                                        <div id="tab6" class="tab_content">
                                            <ul>
                                                <li>
                                                    <img src="Content/Images/ECity.jpeg" class="scenarioImg"/></li>
                                            </ul>
                                        </div>
                                        <div id="tab7" class="tab_content">
                                            <ul>
                                                <li>
                                                    <img src="Content/Images/ZWaste.jpeg" class="scenarioImg"/></li>
                                            </ul>
                                        </div>
                                       <div id="tab8" class="tab_content">
                                            <ul>
                                                <li>
                                                    <img src="Content/Images/LowMedHighDensity.jpeg" class="scenarioImg"/></li>
                                            </ul>
                                        </div>


                                    </div>

                                </div>
                            </div>
                        </div>
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


