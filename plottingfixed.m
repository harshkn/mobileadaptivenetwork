



fnmsd =   ['msdl2.fig   ';'msdl5.fig   ';'msdl8.fig   ';'msdl5n.fig  ';'gmsd.fig    ' ];
fnmse =   ['msel2.fig   ';'msel5.fig   ';'msel8.fig   ';'msel5n.fig  ';'gmse.fig    ' ];
fnmsdev = ['msdevl2.fig ';'msdevl5.fig ';'msdevl8.fig ';'msdevl5n.fig';'gmsdev.fig  ' ];

fn = [fnmsd ;fnmse ;fnmsdev];


fig1 = open(strtrim(fn(1,:)));
fig2 = open(strtrim(fn(2,:)));


ax1 = get(fig1, 'Children');
ax2 = get(fig2, 'Children');


for i = 1 : numel(ax2) 
   ax2Children = get(ax2(i),'Children');
   copyobj(ax2Children, ax1(i));
end


close(fig2)
saveas(gcf,strtrim(fn(5,:)), 'fig')
close(fig1)
open(strtrim(fn(5,:)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig1 = open(strtrim(fn(6,:)));
fig2 = open(strtrim(fn(7,:)));


ax1 = get(fig1, 'Children');
ax2 = get(fig2, 'Children');


for i = 1 : numel(ax2) 
   ax2Children = get(ax2(i),'Children');
   copyobj(ax2Children, ax1(i));

end

close(fig2)
saveas(gcf,strtrim(fn(10,:)), 'fig')
close(fig1)
open(strtrim(fn(10,:)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fig1 = open(strtrim(fn(11,:)));
fig2 = open(strtrim(fn(12,:)));


ax1 = get(fig1, 'Children');
ax2 = get(fig2, 'Children');


for i = 1 : numel(ax2) 
   ax2Children = get(ax2(i),'Children');
   copyobj(ax2Children, ax1(i));
end

close(fig2)
saveas(gcf,strtrim(fn(15,:)), 'fig')
close(fig1)
open(strtrim(fn(15,:)));
