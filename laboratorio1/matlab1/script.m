% Se inicia una figura
figure

% a)
    % Se definen las matrices A, B, C, D para el sistema
    A = [0, 1, 0;0, 0, 1;-3, -2, -5];
    B = [0;0;1];
    C = [1, 0, 0];
    D = [-2];

    % Se crea el sistema G a partir de las matrices A, B, C, D
    G = ss(A, B, C, D);


% b)
    % Se obtienen los polos y los ceros del sistema
    p = pole(G);
    z = zero(G);

    % Se muestran polos y ceros en consola
    'Los polos son:'
    p
    'Los ceros son:'
    z
    
    % Se muestran polos y ceros en grafica
    subplot(2,2,1)
    pzmap(G)

% c)
    % Se dan valores iniciales al sistema
    x_t0 = [0;-1;1];
    subplot(2,2,2)
    plot(initial(G, x_t0))
    xlim([0,10])

% d)
    subplot(2,2,3)
    impulse(G)

% e)
    subplot(2,2,4)
    step(G)
    
% f)
    ts = 0.005;
    t = [0:ts:10];
    Phi = expm(A * t)
    S_10 = Phi*x_t0
    lsim(G,[0, 0],10)
    

% g)
    % Se obtiene G como funcion de transferencia H
    H = tf(ss);

% Se obtiene el sistema normalizado(ganancia=1)
G_n = zpk(z, p, 1);
