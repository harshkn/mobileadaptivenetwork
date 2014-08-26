



fnmsd =   ['msdl2.fig   ';'msdl5.fig   ';'msdl8.fig   ';'msdl5n.fig  ';'gmsd.fig    ' ];
fnmse =   ['msel2.fig   ';'msel5.fig   ';'msel8.fig   ';'msel5n.fig  ';'gmse.fig    ' ];
fnmsdev = ['msdevl2.fig ';'msdevl5.fig ';'msdevl8.fig ';'msdevl5n.fig';'gmsdev.fig  ' ];

fn = [fnmsd ;fnmse ;fnmsdev];


fig1 = open(strtrim(fn(1,:)));
fig2 = open(strtrim(fn(2,:)));
fig3 = open(strtrim(fn(3,:)));
fig4 = open(strtrim(fn(4,:)));

ax1 = get(fig1, 'Children');
ax2 = get(fig2, 'Children');
ax3 = get(fig3, 'Children');
ax4 = get(fig4, 'Children');

for i = 1 : numel(ax2) 
   ax1Children = get(ax1(i), 'Children');
   fir = copyobj(ax1Children, ax1(i));
 
   ax2Children = get(ax2(i),'Children');
   sec = copyobj(ax2Children, ax1(i));
   
   ax3Children = get(ax3(i),'Children');
   thr = copyobj(ax3Children, ax1(i));
   ax4Children = get(ax4(i),'Children');
   fou = copyobj(ax4Children, ax1(i));
end

% legend(fir, {'first'})
% legend(sec, {'SEC'})
% legend(thr, {'CS'})
% legend(fir, {'first'})
% legend(fir, {'first'},fou, {'VFSDV'})

close(fig2,fig3, fig4)
saveas(gcf,strtrim(fn(5,:)), 'fig')
close(fig1)
open(strtrim(fn(5,:)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig1 = open(strtrim(fn(6,:)));
fig2 = open(strtrim(fn(7,:)));
fig3 = open(strtrim(fn(8,:)));
fig4 = open(strtrim(fn(9,:)));

ax1 = get(fig1, 'Children');
ax2 = get(fig2, 'Children');
ax3 = get(fig3, 'Children');
ax4 = get(fig4, 'Children');

for i = 1 : numel(ax2) 
   ax2Children = get(ax2(i),'Children');
   copyobj(ax2Children, ax1(i));
   ax3Children = get(ax3(i),'Children');
   copyobj(ax3Children, ax1(i));
   ax4Children = get(ax4(i),'Children');
   copyobj(ax4Children, ax1(i));
end

close(fig2,fig3, fig4)
saveas(gcf,strtrim(fn(10,:)), 'fig')
close(fig1)
open(strtrim(fn(10,:)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fig1 = open(strtrim(fn(11,:)));
fig2 = open(strtrim(fn(12,:)));
fig3 = open(strtrim(fn(13,:)));
fig4 = open(strtrim(fn(14,:)));

ax1 = get(fig1, 'Children');
ax2 = get(fig2, 'Children');
ax3 = get(fig3, 'Children');
ax4 = get(fig4, 'Children');

for i = 1 : numel(ax2) 
   ax2Children = get(ax2(i),'Children');
   copyobj(ax2Children, ax1(i));
   ax3Children = get(ax3(i),'Children');
   copyobj(ax3Children, ax1(i));
   ax4Children = get(ax4(i),'Children');
   copyobj(ax4Children, ax1(i));
end

close(fig2,fig3, fig4)
saveas(gcf,strtrim(fn(15,:)), 'fig')
close(fig1)
open(strtrim(fn(15,:)));
