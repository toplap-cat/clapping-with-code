// implementation of Steve Reich's "Clapping Music" in Živa, by Roger Pibernat

~claps = [0,0,0,r,0,0,r,0,r].mirror;
~steve s:\clap n: ~claps.pseq pan: (-0.7) >>>.1 0.2;
~reich s:\clap n: [1 + ~claps!!12, r].pseq pan: (0.7) >>>.2 0.2;