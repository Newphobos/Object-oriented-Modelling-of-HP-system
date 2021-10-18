within ;
package Modelling_of_HP
  model Unnamed3

  end Unnamed3;

  package Tutorial_1

    model Pendulum_simulations "First simple version"

      constant Real g(unit = "m/s2") = 9.81;
      parameter Real L(unit = "m") = 1;
      Real theta(unit = "rad",start = 0.1);
      Real thetaDot;
      //line comment
      /* Multuline */
    equation
      thetaDot = der(theta);
      der(thetaDot)= -g/L* sin(theta);

      annotation (experiment(StopTime=4));
    end Pendulum_simulations;

    model Pendulum_simulationsSIUnits "modules using SI units"

      constant Real g(unit = "m/s2") = 9.81;
      parameter Modelica.SIunits.Length L = 1;
      Real theta(unit = "rad",start = 0.1);
      Real thetaDot;
      //line comment
      /* Multuline */
    equation
      thetaDot = der(theta);
      der(thetaDot)= -g/L* sin(theta);

      annotation (experiment(StopTime=4));
    end Pendulum_simulationsSIUnits;

    model Pendulum_simulationsUsingImport "First simple version"
      import SI = Modelica.SIunits;


      constant SI.Acceleration g = 9.81;

      parameter SI.Length L = 1;
      Real theta(unit = "rad",start = 0.1);
      Real thetaDot;
      //line comment
      /* Multuline */
    equation
      thetaDot = der(theta);
      der(thetaDot)= -g/L* sin(theta);

      annotation (experiment(StopTime=4));
    end Pendulum_simulationsUsingImport;
  end Tutorial_1;
end Modelling_of_HP;
