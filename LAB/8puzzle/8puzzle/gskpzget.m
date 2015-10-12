function [movedisplay, intv00f, intv00g, intv00h] =  gskpzget(pzinl,intv0ln);
movedisplay=[];
movedisplay(1,1:3) = pzinl(intv0ln,1:3);
movedisplay(2,1:3) = pzinl(intv0ln,4:6);
movedisplay(3,1:3) = pzinl(intv0ln,7:9);
intv00f = pzinl(intv0ln,10);
intv00g = pzinl(intv0ln,11);
intv00h = pzinl(intv0ln,12);