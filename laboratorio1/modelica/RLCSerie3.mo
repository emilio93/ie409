/*
  Un circuito RLC en serie con switch.
  R: 5kOhm, L: 5mH, C: 470uF
  El switch afetca al circuito de la siguente manera
    -  5s: se cierra
    -  7s: se abre
    - 15s: se ceirra
*/
model RLCSerie3
  import Modelica.SIunits.Resistance;
  import Modelica.SIunits.Capacitance;
  import Modelica.SIunits.Inductance;
  import Modelica.SIunits.Voltage;
  import Modelica.SIunits.Current;

  /*
    Parametros del circuito.
  */
  parameter Resistance R = 5000.0;
  parameter Capacitance C = 0.000470;
  parameter Inductance L = 0.005;

  /*
    Variables del circuito.
   */
  Voltage Vs, Vr, Vl, Vcoff, Vc;
  Voltage Vcon(start=0, fixed=true);
  Current Il(start=0, fixed=true);

equation
  // Condiciones iniciales para t=7
  when time >= 7.0 then
    reinit(Vcon, 0);
    reinit(Il, 0);
  end when;

  // Condiciones iniciales para t=15
  // Los valores se obtienen de los
  // valores para Vc1 e Il1 cuando t=7
  when time >= 15.0 then
    reinit(Vcon, 6.87648);
    reinit(Il, 0.0010247);
  end when;

  // Se definen las ecuaciones que rigen al sistema.

  // Se asigna el valor de tension a Vs segun los tiempos en que se cierra el
  // circuito.
  Vs = if (time >= 5.0 and time <= 7.0) or (time >= 15) then 12 else 0;

  // mientras el circuito este abierto la carga del capacitor
  // permanece constante
  Vcoff = if (time >= 7.0 and time <= 15.0) then 6.87648 else 0;

  Vr = R * Il; // Ley de Ohm.
  Vl = L * der(Il); // Tension en el inductor.
  Il = C * der(Vcon); // Corriente en EL capacitor.
  Vs = Vr + Vl + Vcon; // LTK
  // Vc es la suma de cuando esta cerrado y abierto el circuito
  Vc = Vcon+ Vcoff;

  // Duracion del experimento.
  annotation(experiment(StartTime=0.0, StopTime=25.0));
end RLCSerie3;
