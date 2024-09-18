// implementation of Steve Reich's "Clapping Music" in vanilla SuperCollider, by Lluis Naceta

(
SynthDef(\pols, {
 arg freq, pan=0, vol=0.5, atk=0.01, rel=0.4, width=0.5, des=0.03, curve= -6;
 var sig, env;
 env = EnvGen.kr(Env.perc(atk, rel, curve: curve), doneAction: 2);
 sig = Pulse.ar({ExpRand(freq*(1-des), freq*(1+des))}!19, width);
 sig = sig * env;
 sig = Splay.ar(sig, level: vol, center: pan);
 Out.ar(0, sig);
}).add;
)

(
Pdef(\clap1,
 Pbind(
  \instrument, \pols, //or any other instrument you like
  \midinote, 57,
  \dur, Pseq([0.2, 0.2, 0.4, 0.2, 0.4, 0.4, 0.2, 0.4], inf),
  \vol, Pexprand(0.1, 0.2),
  \pan, -1.5
 )
).play(quant: 2.4);
)

(
Pdef(\clap2,
 Pbind(
  \instrument, \pols,
  \midinote, 54,
  \dur, Pseq([
   0.2, 0.2, 0.4, 0.2, 0.4, 0.4, 0.2, 0.4,
   0.2, 0.2, 0.4, 0.2, 0.4, 0.4, 0.2, 0.4,
   0.2, 0.2, 0.4, 0.2, 0.4, 0.4, 0.2, 0.4,
   0.2, 0.2, 0.4, 0.2, 0.4, 0.4, 0.2, 0.2
  ], inf),
  \vol, Pexprand(0.1, 0.2),
  \pan, 1.5
 )
).play(quant: 2.4*4);
)