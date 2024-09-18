// implementation of Steve Reich's "Clapping Music" in Bacalao, by Glen Fraser

// long version

b = Bacalao().boot.tempo_(1.8);

(
var clapPattern = [deg: "0 0 0 ~ 0 0 ~ 0 ~ 0 0 ~", amp: ([0.7] ++ (0.2!11)).loop, ins: \clap_electro].pb;
var rotAmt = 0;
var rotatedPattern = Plazy({ clapPattern.rotate(rotAmt) });
b.p(1, [
  clapPattern <> (pan: -0.7),
  rotatedPattern <> (pan: 0.7)
].par);

Tdef(\main, {
  12.do{ arg i;
    rotAmt = i.debug("rotAmt");
    8.wait;
  };
  b.clear(1, 0);
}).play(b.barClock, quant: 1)
)