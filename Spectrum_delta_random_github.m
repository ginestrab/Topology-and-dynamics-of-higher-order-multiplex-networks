clear all


for in=1:4,
    p=0.25*in;
    random_duplex_overlap_github;
    read_github;
    Fiedler_github;
end

figure
for in=0:3,
    subplot(4,1,4-in)
surf(X1,X2,Fiedler_delta_s{in+1,2});
xlabel('$\bf{\gamma}_1$','Interpreter','Latex','FontSize',26,'FontWeight','bold')
ylabel('$\bf{\gamma}_2$','Interpreter','Latex','FontSize',26,'FontWeight','bold')
zlabel('$\bf{\lambda}_F^{up}$','Interpreter','Latex','FontSize',24,'FontWeight','bold')
xlim([-1 1]);
ylim([-1 1]);
set(gca,'FontWeight','bold','FontSize',18);
hold on
hold on


set(gca,'FontWeight','bold','FontSize',18);
hold on
hold on
end

