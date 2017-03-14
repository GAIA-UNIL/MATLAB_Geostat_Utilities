function [XI,YI,ZI]=interp_surf(x,y,z,stepx,stepy,method,show)

% pour représenter une surface composée de points répartis de façon
% non-uniforme

xi= min(x):stepx:max(x);
yi= min(y):stepy:max(y);
yi=yi';                                     % doit être un vecteur colonne
[XI,YI,ZI]= griddata(x,y,z,xi,yi,method); % interpolation sur grille
if show==1
    surf(XI,YI,ZI);                             % affichage surface interpolée et contours
    axis equal;
    view(0,90)
    shading flat
end
%hold('on');                                 % pour superposer le semis de points
%plot3(x,y,z,'.');