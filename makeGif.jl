#anim - an animation object made by "@animate" command of
#       "Plots" library
#
#filename - output filename of *.gif
#           
#fps -  the frames per second
#
function makeGif(anim,filename,fps)
  f = open("pngFiles.txt","w");
  for i = 1:length(anim.frames)
    write(f,[anim.dir "\\" anim.frames[i] "\n"]);
  end
  close(f);
  run(`magick -delay $(string(fps)) -loop 0 @pngFiles.txt -alpha off
      $filename`);

end

