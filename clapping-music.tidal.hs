-- implementation of Steve Reich's "Clapping Music" in TidalCycles, by Tim Cowlishaw

setbpm 160

do
  let pattern = n "1 3 3 ~ 3 3 ~ 3 ~ 3 3 ~"
  let clap = s "realclaps" # gain "0.8 0.6!10"
  let struct = "<0%11!12 1%11!12 2%11!12 3%11!12 4%11!12 5%11!12 6%11!12 7%11!12 8%11!12 9%11!12 10%11!12 11%11!12>"
  resetCycles
  d1 $ pattern # clap
  d2 $ (struct <~ pattern) # clap
