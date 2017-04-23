/*
  Un circuito RLC en serie con switch.
  R: 4kOhm, L: 2mH, C: 75uF
  Switch se cierra en t=5s
*/
model RLCSerie1
  import Modelica.SIunits.Resistance;
  import Modelica.SIunits.Capacitance;
  import Modelica.SIunits.Inductance;
  import Modelica.SIunits.Voltage;
  import Modelica.SIunits.Current;

  // se asignan los valores de los parametros
  // Resistencia, Capacitancia e Inductancia.
  parameter Resistance R = 4000.0; // 4kOhm
  parameter Capacitance C = 0.000075; // 75uF
  parameter Inductance L = 0.002; //2mH

  // se inicializan las entradas y salidas del circuito
  // Vs Vr Vl
  Voltage Vs, Vr, Vl;
  // Vc e Il son estados del sistema
  Voltage Vc(start=0, fixed=true);
  Current Il(start=0, fixed=true);

equation
  // Se definen las ecuaciones que rigen al sistema.

  // Se asigna el valor de tension a Vs segun los tiempos en que se cierra el
  // circuito.
  Vs = if time >= 5.0 then 12 else 0;
  Vr = R * Il; // Ley de Ohm.
  Vl = L * der(Il); // Tension en el inductor.
  Il = C * der(Vc); // Corriente en EL capacitor.
  Vs = Vr + Vl + Vc; // LTK

  // Duracion del experimento.
  annotation(experiment(StartTime=0.0, StopTime=25.0));
end RLCSerie1;
