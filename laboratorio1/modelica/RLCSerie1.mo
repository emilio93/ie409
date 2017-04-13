model RLCSerie1
  import Modelica.SIunits.Resistance;
  import Modelica.SIunits.Capacitance;
  import Modelica.SIunits.Inductance;
  import Modelica.SIunits.Voltage;
  import Modelica.SIunits.Current;

  parameter Resistance R = 4000.0;
  parameter Capacitance C = 0.000075;
  parameter Inductance L = 0.002;

  Voltage Vs, Vr, Vl;
  Voltage Vc(start=0, fixed=true);
  Current Il(start=0, fixed=true);

equation
  Vs = if time >= 5.0 then 10 else 0;
  Vr = R * Il;
  Vl = L * der(Il);
  Il = C * der(Vc);
  Vs= Vr + Vl + Vc;
  annotation(experiment(StartTime=0.0, StopTime=25.0));
end RLCSerie1;
