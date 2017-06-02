anim = @animate for i=1:1:100
  plot([0:0.01:1;],sin(2*pi*1*([0:0.01:1;]))/i);
end 

#gif(anim,"anim.gif",fps=10);

