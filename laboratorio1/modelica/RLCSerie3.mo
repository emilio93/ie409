model RLCSerie3
  import Modelica.SIunits.Resistance;
  import Modelica.SIunits.Capacitance;
  import Modelica.SIunits.Inductance;
  import Modelica.SIunits.Voltage;
  import Modelica.SIunits.Current;

  parameter Resistance R = 5000.0;
  parameter Capacitance C = 0.000470;
  parameter Inductance L = 0.005;

  Voltage Vs, Vr, Vl;
  Voltage Vc(start=0, fixed=true);
  Current Il(start=0, fixed=true);

equation
  Vs = if (time >= 5.0 and time <= 7.0) or (time >= 15) then 10 else 0;
  Vr = R * Il;
  Vl = L * der(Il);
  Il = C * der(Vc);
  Vs = Vr + Vl + Vc;
  annotation(experiment(StartTime=0.0, StopTime=25.0));
end RLCSerie3;
