within ;
package FM3217_Assignment2021 "Assignment for 2021 course"
  extends Modelica.Icons.Package;
  model TaskDescription "Description of the assignment"
    extends Modelica.Icons.Information;
    annotation(preferredView="info", Documentation(info="<html>
<h4>FM3217 - Object-oriented Modelling of Hydro Power Systems</h4>
<h5>Modelling Assignment</h5>
<h4>Deadline:</h4>
<p>Sunday, 21<sup>st</sup> November 2021 at 23:55 hours</p>
<h4>Where:</h4>
<p>Via GitHub</p>
<h4>How:</h4>
<p>You should add/integrate your solution into this library and save it as <b>one</b> 
  simple Modelica <code>*.mo</code> file. It can be accompanied by image files that 
  are linked from the info layer. Your work should finally be delivered by committing 
  <b>and pushing</b> your changes back to the fork you got the files from. 
  <i>Please do not include any temporary simulation files created by Dymola.
  Doing so will result in point reduction.</i>
</p>
<h4>Result:</h4>
<p>Counts 30&percnt; of the end result and will be published by the end of 3<sup>rd</sup> of December 2021</p>
<h4>Task:</h4>
<p>During the tutorial every participant should have learned how to built simple models 
  using components from the <a href=\"modelica://Modelica\">Modelica Standard Library</a> 
  and/or the <a href=\"modelica://HydroPower\">HydroPower Library</a>.</p>
<p>In order to demonstrate your knowledge please fulfill the following tasks:</p>
<ol type=\"A\">
  <li><h5>Parametrisation error</h5>
    <p>The package <a href=\"modelica://FM3217_Assignment2021.AssignmentModels\">AssignmentModels</a> 
      contains an individual model for each student (<code>Model_&LT;YourStudentID&GT;</code>). 
      They all contain at <b>least</b> one parametrisation error which can prevent a successful 
      simulation or simply generates unrealistic results.</p>
    <ol>
      <li>Create a new model which <b>extends</b> from your personalised model(look for your Student ID) 
        and place it under <a href=\"modelica://FM3217_Assignment2021.YourFixedModel\">YourFixedModel</a></li>
      <li>Find the parametrisation error(s), fix <b>and document</b> them in the 
        &QUOT;info&QUOT; layer of your newly created model.</li>
      <li>Simulate the model and create an image of the plot of &QUOT;<code>penstock.symmary.Q_out</code>&QUOT;
        and add that image to the info layer of that same model (<em>e.g.,</em> adding the stored 
        image file via toolbar of the editor or using the code snippet 
        <code>&LT;img src=&QUOT;modelica://FM3217_Assignment2021/Resources/Images/ImageFile.png&QUOT;&GT;</code>
        in your documentation source.)</li>
    </ol>
  </li>
  <li><h5>Power balance</h5>
    <p>Now that we have a working production model you will find that the electrical power grid 
        is not in balance. This means that the frequency starts to deviate considerable from 50Hz 
        once the generator is connected at <code>T=150 sec</code>.</p>
    <ol>
      <li>Determine the amount of unbalance in the system (either by checking the parameters 
        or by checking the simulation results of the power balance) and set the power reference 
        &QUOT;<code>pwr_ref</code>&QUOT; of the turbine governor to the correct value.</li>
      <li>Again document what you have done in the &QUOT;info&QUOT; layer and include a plot 
        of the turbine power &QUOT;<code>turbine.summary.P_turbine</code>&QUOT; and the total 
        grid power &QUOT;<code>generator.summary.P_grid_tot</code>&QUOT;</li>
    </ol>
  </li>
  <li><h5>Your library</h5>
    <p>The last tasks is about the general modelling in Modelica.</p>
    <ol>
      <li>To demonstrate your ability you should create a sub-library under
        <a href=\"modelica://FM3217_Assignment2021.YourSubLibrary\">YourSubLibrary</a>
      <li>Document the sub-library (at least) in the top-level package</li>
      <li>Include at least one base component</li>
      <li>Extend the functionality of the base component by:
        <ul>
          <li>duplication</li>
          <li>inheritance</li>
        </ul>
      </li>
      <li>Create an example package with at least one example for each extension method 
        (<em>i.e.,</em> duplication, inheritance)</li>
      <li>Document the differences, benefits and drawbacks of the two methods in the info
        layer of the library package.</li>
      <li>The library should have a useful structure</li>
    </ol>
    <p>Example:<br>
      Below is a rough sketch of an example you could use as a guide line.
      Only your version should be placed under 
      <a href=\"modelica://FM3217_Assignment2021.YourSubLibrary\">YourSubLibrary</a>.
    </p>
    <p><img src=\"modelica://FM3217_Assignment2021/Resources/Images/ControllerLib.png\"/></p>
    <p><b>Your work does <i>not</i> have to be in the same way. I&apos;m more than happy 
      if you can surprise me with an even better feature rich set up/structure.</b></p>
  </li>
</ol>
</html>"));
  end TaskDescription;

  package AssignmentModels "This package contains the different variants of assigment models."
    model Model_152569
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=215,
        ZR=541.5)
                annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-15,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=40e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_152569;
    extends Modelica.Icons.VariantsPackage;
    model Model_161091
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZR=215) annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-5,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=70e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_161091;

    model Model_161092
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=451.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-17,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=10e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_161092;

    model Model_162591
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=564,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZR=415) annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-7,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=60e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_162591;

    model Model_215289
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=564,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZR=415) annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-7,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=60e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_215289;

    model Model_221857
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=154.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-16,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=15e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_221857;

    model Model_230757
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=15,
        ZR=241.5)
                annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={180,100,500},
        distNoGen={-27,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=22.5e6) annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_230757;

    model Model_230782
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=415,
        ZR=115) annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={180,100,500},
        distNoGen={-9,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=67.5e6) annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_230782;

    model Model_231149
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=315,
        ZR=541.5)
                annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-3,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=80e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_231149;

    model Model_236950
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=115,
        ZR=641.5)
                annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-1,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=90e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_236950;

    model Model_238758
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=641.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-18,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=5e6)    annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_238758;

    model Model_238760
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=315,
        ZR=541.5)
                annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-3,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=80e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_238760;

    model Model_238761
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=215,
        ZR=541.5)
                annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-4,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=70e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_238761;

    model Model_238798
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=641.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-18,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=5e6)    annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_238798;

    model Model_238801
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=461.5,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-10,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=45e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_238801;

    model Model_238802
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=154.5,
        ZR=456.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-13,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=30e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_238802;

    model Model_238805
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=164.5,
        ZR=641.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-12,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=35e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_238805;

    model Model_238806
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=215,
        ZR=541.5)
                annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-2,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=85e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_238806;

    model Model_238808
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-12,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=115,
        ZR=315) annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=5e6)    annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_238808;

    model Model_238810
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=154.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-16,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=15e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_238810;

    model Model_238811
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=351.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-15,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=20e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_238811;

    model Model_238813
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=154.5,
        ZR=456.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-13,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=30e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_238813;

    model Model_238814
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=252.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-14,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=25e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_238814;

    model Model_238817
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=345.5,
        ZR=641.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-9,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=50e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_238817;

    model Model_238815
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZR=315) annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-6,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=65e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_238815;

    model Model_238821
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=451.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-17,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=10e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_238821;

    model Model_238822
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=115,
        ZR=641.5)
                annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-1,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=90e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_238822;

    model Model_239255
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=164.5,
        ZR=641.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-8,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=55e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_239255;

    model Model_246524
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZR=541.5,
        ZL=246.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-11,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=40e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_246524;

    model Model_246526
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        ZL=564,
        endL={0,0},
        n=4,
        ZR=541.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZR=415) annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-4,0,0})     annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=75e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,-19.6667},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_246526;

    model Model_246528
      extends Modelica.Icons.ReleaseNotes;

      HydroPower.HydroSystems.Pipe conduit(
        horizontalIcon=true,
        L=6600,
        endD={5.8,5.8},
        showDataInIcon=false,
        endL={0,0},
        n=4,
        ZL=164.5,
        ZR=641.5) annotation (Placement(transformation(extent={{-66,-28},{-46,-8}})));
      HydroPower.HydroSystems.Pipe penstock(
        endD={3,3},
        L=724,
        showDataInIcon=false,
        ZL=541.5,
        ZR=112.5,
        endL={0,0})
        annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
      HydroPower.HydroSystems.SurgeTank surgeTank(
        D=3.6,
        H2L=0.87,
        Vol=100,
        showDataInIcon=false,
        deltZ=40) annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
      HydroPower.SinksAndSources.Fixed_HT inTH(
        depth=60,
        paraOption=false,
        H_const=48 + 564,
        Hmax=564 + 60)
        annotation (Placement(transformation(extent={{-74,2},{-90,18}})));
      HydroPower.HydroSystems.Reservoir reservoir(
        Hmax=564 + 60,
        depth=ones(reservoir.n)*60,
        H_start=48 + 564,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        Krough=100,
        pWb=1,
        k=2,
        steadyState=false)
        annotation (Placement(transformation(extent={{-94,-22},{-74,-2}})));
      HydroPower.SinksAndSources.Fixed_HT outTH(
        paraOption=false,
        H_const=115,
        Hmax=130,
        depth=20)
        annotation (Placement(transformation(extent={{72,-52},{90,-68}})));
      HydroPower.HydroSystems.Reservoir river(
        H_start=115,
        MidWidth=200,
        SideWidth=100,
        L=100,
        depthIntake={0,0},
        pWb=1,
        k=2,
        Hmax=130,
        depth=ones(river.n)*20)
               annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
      HydroPower.HydroSystems.Pipe downstream(
        horizontalIcon=true,
        endD={5.8,5.8},
        L=724,
        ZL=110.5,
        showDataInIcon=false,
        ZR=110,
        endL={0,0},
        n=4)    annotation (Placement(transformation(extent={{40,-46},{60,-26}})));
      HydroPower.ElectricalSystems.PowerGrid
                                  powerGrid(
        distTgen={150,1e6,1e6},
        loadDiv={0.5,0.25,0.25},
        loadT={0.5,1,2},
        NoLoadUnits={2000,4000,10000},
        distTload={1e6,1e6,1e6},
        distNoLoad={0,0,0},
        prodDiv={0.45,0.45,0.1},
        prodT={120,15,5},
        ep={0.5,0.08,0.04},
        unitsJ={122000,5.5e6,8000},
        NoGenUnits={90,100,500},
        distNoGen={-12,0,0})    annotation (Placement(transformation(extent={{-20,20},{0,40}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp pwr_ref(
        duration=10,
        height=0,
        startTime=1e6,
        offset=35e6)   annotation (Placement(transformation(extent={{20,60},{40,80}},
                      rotation=0)));
      HydroPower.ElectricalSystems.GeneratorAndMCB generator(
        np={12},
        timeMCB_close=ones(generator.n)*150,
        timeMCB_open=ones(generator.n)*250,
        f_start=0,
        J={212500},
        P_nom={103000000})
                      annotation (Placement(transformation(extent={{20,20},{40,40}},
                       rotation=0)));
      HydroPower.ControllersAndSensors.TurbineGovernorAnalog
                                                  turbineGovernor(
        ep=1,
        tRamp=40,
        P_generator_nom=generator.P_nom[1],
        enableRamp=false,
        Kd_noLoad=0.05,
        Kd_load=0.5,
        K_noLoad=0.2,
        K_load=0.4,
        Ki_load=0.1,
        Ki_noLoad=0.025)
                    annotation (Placement(transformation(extent={{50,20},{70,40}},
              rotation=0)));
      HydroPower.MechanicalSystems.BasicTurbine turbine(
        H_nom=460,
        LdraftTube=2.9,
        DavDraftTube=3,
        LscrollCase=15.7,
        DavScrollCasing=1.5,
        np=12,
        tableOnFile=true,
        PUInFlowTables=true,
        QTableName="Qtab",
        T_start(displayUnit="degC"),
        yvLim1=[-0.4,0.05],
        yvLim2=[-0.4,0.05],
        Q_nom=24.3,
        H_start=564 + 48,
        H_start_draftTube=115,
        effMech=1,
        TurbDmp0=0.01,
        TurbineDataFile=Modelica.Utilities.Files.loadResource(HydroPower.TABLE_DIR
             + "TurbineDataFile.mat"),
        P_nom=103000000)
        annotation (Placement(transformation(extent={{12,-40},{32,-20}})));
      inner HydroPower.System_HPL system_HPL(                  constantTemperature=true,
          steadyState=true)
        annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
    equation
      connect(reservoir.a2_pipe, conduit.a) annotation (Line(
          points={{-73,-18},{-67,-18}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(powerGrid.f_grid,generator. f_grid)         annotation (Line(
          points={{1,23},{19,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.J_grid,generator. J_grid)         annotation (Line(
          points={{1,30},{19,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerGrid.P_grid_balance,generator. P_grid_balance)
        annotation (Line(
          points={{1,37},{19,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pwr_ref.y,turbineGovernor. P_reference) annotation (Line(
          points={{41,70},{54,70},{54,41}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out[1],turbineGovernor. f) annotation (Line(
          points={{41,23},{49,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.onMCB,powerGrid. MCB) annotation (Line(
          points={{30,41},{30,48},{-10,48},{-10,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.onMCB[1],turbineGovernor. isMCB) annotation (Line(
          points={{30,41},{30,48},{60,48},{60,41}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(generator.P_out[1],turbineGovernor. P_generator) annotation (Line(
          points={{41,37},{49,37}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(generator.f_out,powerGrid. f) annotation (Line(
          points={{41,23},{46,23},{46,10},{-36,10},{-36,23},{-21,23}},
          color={0,0,127},
          smooth=Smooth.None));

      connect(turbine.b, downstream.a) annotation (Line(
          points={{33,-30},{36,-30},{36,-36},{39,-36}},
          color={0,0,255},
          smooth=Smooth.None));

      connect(turbine.TurbineData[1], generator.P_turbine[1]) annotation (Line(
          points={{22,-19.6667},{22,0},{22,19},{24,19}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.f_generator, generator.f_out[1]) annotation (Line(
          points={{16,-19},{16,10},{46,10},{46,23},{41,23}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(turbine.yGV, turbineGovernor.y) annotation (Line(
          points={{28,-19},{28,0},{80,0},{80,30},{71,30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(inTH.b, reservoir.a1_open) annotation (Line(points={{-90.8,10},{-98,10},{-98,-6},{-95,-6}},
                                                color={0,0,255}));
      connect(downstream.b, river.a1_pipe) annotation (Line(points={{61,-36},{61,-36},{69,-36}},
                                   color={0,0,255}));
      connect(river.a2_open, outTH.b) annotation (Line(points={{91,-24},{95.5,-24},{95.5,-60},{90.9,-60}},
                                  color={0,0,255}));
      connect(turbine.a, penstock.b) annotation (Line(points={{11,-30},{5,-30}}, color={0,0,255}));
      connect(penstock.a, surgeTank.b) annotation (Line(points={{-17,-30},{-18,-30},{-18,-18},{-19,-18}}, color={0,0,255}));
      connect(conduit.b, surgeTank.a) annotation (Line(points={{-45,-18},{-41,-18}}, color={0,0,255}));
      annotation (experiment(StopTime=500, Algorithm="Radau"), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
    end Model_246528;

  end AssignmentModels;

  package YourFixedModel "Put your model into this package"
    extends Modelica.Icons.BasesPackage;
    model Model_239255 "HP Model"
      extends AssignmentModels.Model_239255;
      annotation (experiment(StopTime=1000), Documentation(info="<html>
<p><br><br><br><br><br><br><br><br><br><br>These are the different errors found in the first simulation.</p>
<p><br><br><br><img src=\"modelica://FM3217_Assignment2021/Resources/Images/Capture.PNG\"/></p>
</html>"));
    end Model_239255;
  end YourFixedModel;

  package YourSubLibrary
    "This is the place where you should add your sub-library."
    extends Modelica.Icons.ExamplesPackage;
  end YourSubLibrary;
  annotation ( preferredView="info",uses(Modelica(version="3.2.3"), HydroPower(version="2.11")),
                                Documentation(info="<html>
<h4>Please go to the <a href=\"modelica://FM3217_Assignment2021.TaskDescription\">TaskDescription</a> for details on the assignment.</h4>
</html>"));
end FM3217_Assignment2021;
