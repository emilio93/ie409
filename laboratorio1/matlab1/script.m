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
    
    % Se obtiene el sistema normalizado(ganancia=1)
    G_n = zpk(z, p, 1);

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
    title('Polos y ceros del sistema')
    xlabel('Eje Real')
    ylabel('Eje Imaginario')

% c)
    % Se dan valores iniciales al sistema
    x_t0 = [0;-1;1];
    subplot(2,2,2)
    
    % Con los valores iniciales se grafica de 0 a 10 segundos
    initial(G, x_t0)
    xlim([0,10])
    title('Respuesta para condiciones iniciales [0, -1, 1]^T')
    ylabel('Amplitud')
    xlabel('Tiempo')

% d)
    % Grafica la respuesta al impulso
    subplot(2,2,3)
    impulse(G)

% e)
    % Grafica la respuesta al escalon
    subplot(2,2,4)
    step(G)

figure
% f)
    % i
        t = 10;
        Phi = expm(A * t)
        s_10 = Phi * x_t0
    % ii
        % El valor del primer elemento en s_10, -0.2545 coincide con 
        % el que se ve en la grafica para la respuesta con las condiciones
        % iniciales de c) (x_t0).
    % iii
        tt = [0:0.005:20];
        u = zeros(size(tt));
        lsim(G, u, tt, [0; -1; 1])


% g)
    % Se obtiene G como funcion de transferencia H
    H = tf(G)
    


