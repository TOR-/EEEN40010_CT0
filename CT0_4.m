%% Constants, setup
a=4;
b=6;
c=6;

set(gca, 'defaultTextInterpreter','latex')
close all
%% Problem Four
Np = [1 0.9*a];
Dp = conv([1 a],[1 a+b+c]);
Hp = tf(Np,Dp);

G_unity = tf([1],[1]);

kk = [0.1 0.5 2];
zz = [0.1 0.5 2];
yi=1;
fprintf(1,"k & z & p1 & p2 & p3\\\\\n");
for k=kk
    xi=1;
    %subplot(ceil(length(kk)/2),ceil(length(kk)/2),yi)
    %hold on
    for z=zz
        Nc = k.*[1 z];
        Dc = [1 0];
        Hc = tf(Nc,Dc);

        Go = series(Hp,Hc);

        Gcl = feedback(Go, G_unity);
        
        %%%%%subplot(length(kk),length(zz),(yi-1)*length(zz) + xi)
        %step(Gcl)
        %title("k="+k)
        
        poles=pole(Gcl);
        zeroes=zero(Gcl);
        [pm, pn] = size(poles);
        %[zm, zn] = size(zeroes);
        polestr = repmat([' & \\num{%.3f}'], 1, pm);
        %zerostr = repmat([' & \\num{%.3f}'], 1, zm);
        fprintf(1,"\\num{%.3f} & \\num{%.3f}"+polestr+"\\\\\n", k, z, poles);
        xi=xi+1;
    end
    %xlim([0 floor(max(xlim())/2)])
    %legend("z="+zz(1),"z="+zz(2),"z="+zz(3))
    yi=yi+1;
end

%print('report/img/p4-steps-annotations','-dpng');