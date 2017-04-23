/*
  Un circuito RLC en serie con switch.
  R: 20kOhm, L: 7mH, C: 100uF
  Switch se cierra en t=5s
*/
model RLCSerie2
  import Modelica.SIunits.Resistance;
  import Modelica.SIunits.Capacitance;
  import Modelica.SIunits.Inductance;
  import Modelica.SIunits.Voltage;
  import Modelica.SIunits.Current;

  // se asignan los valores de los parametros
  // Resistencia, Capacitancia e Inductancia.
  // R: 20kOhm, L: 7mH, C: 100uF
  parameter Resistance R = 20000.0;
  parameter Capacitance C = 0.000100;
  parameter Inductance L = 0.007;

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
end RLCSerie2;
