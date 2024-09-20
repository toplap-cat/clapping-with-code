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

b.tp(\main, { loop {
  12.do{ |i|
    rotAmt = i;
    8.wait;
  };
}});
)
