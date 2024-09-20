// implementation of Steve Reich's "Clapping Music" in Bacalao, by Glen Fraser
// Shorter, "baked" version:
b = Bacalao().boot.tempo_(1.8);

(
var clapPattern = [deg: "0 0 0 ~ 0 0 ~ 0 ~ 0 0 ~", amp: 0.7, ins: \clap_electro].pb;
var rotatedPattern = 12.collect{ |i| clapPattern.rotate(i).pn(8) }.pseq;
b.p(1, [
  clapPattern.loop <> (pan: -0.7),
  rotatedPattern.loop <> (pan: 0.7)
].par);
)
