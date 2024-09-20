// implementation of Steve Reich's "Clapping Music" in Bacalao, by Glen Fraser
// Version where an "agent" (Task) makes the rotation changes, every 8 bars:
b = Bacalao().boot.tempo_(1.8);

(
var clapPattern = [deg: "0 0 0 ~ 0 0 ~ 0 ~ 0 0 ~", amp: 0.7, ins: \clap_electro].pb;
var rotAmt = 0;
b.p(1, [
  clapPattern <> (pan: -0.7),
  Plazy({ clapPattern.rotate(rotAmt) }) <> (pan: 0.7)
].par);

Tdef(\main, {
  12.do{ arg i;
    rotAmt = i.debug("rotAmt");
    8.wait;
  };
  b.clear(1, 0);
}).play(b.barClock, quant: 1)
)
