clear;clc;
load save_racer3_dyn.mat

% G over g
G_g(1)=simplify(G(1)/g);
G_g(2)=simplify(G(2)/g);
G_g(3)=simplify(G(3)/g);
G_g(4)=simplify(G(4)/g);
G_g(5)=simplify(G(5)/g);
G_g(6)=simplify(G(6)/g);

G_g = collect(G_g,betaG);
G_g'


