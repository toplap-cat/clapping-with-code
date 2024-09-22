-- implementation of Steve Reich's "Clapping Music" in TidalCycles

setbpm 160

-- Version 1 - First verbose version, by Tim Cowlishaw
do
  let pattern = n "1 3 3 ~ 3 3 ~ 3 ~ 3 3 ~"
  let clap = s "realclaps" # gain "0.8 0.6!11"
  let struct = "<0%12!12 1%12!12 2%12!12 3%12!12 4%12!12 5%12!12 6%12!12 7%12!12 8%12!12 9%12!12 10%12!12 11%12!12>"
  d1 $ pattern # clap
  d2 $ (struct <~ pattern) # clap

-- Version 2 - shorter, clearer (but slightly accelarated) version by Niklas Reppel
-- the "phase" of the two pairs of clapping hands changes every cycle instead of every 8 or 12

d1 $ jux (iter 12) $ s "808:3 808:3 808:3 ~ 808:3 808:3 ~ 808:3 ~ 808:3 808:3 ~"

-- Version 3 - pointless (and mostly point-free) code golf iteration on the above by Tim Cowlishaw, to see if there's
-- a way of getting back the "switch phase every 8 to 12 bars" structure, while maintaining the brevity of Niklas's version.
d1 $ jux (\x -> cat $ map ($ x) (map (rotL . (% 12)) ([0..11] >>= replicate 8))) "808:3!3 ~ 808:3!2 ~ 808:3 ~ 808:3!2 ~"


-- Version 4 by Tim Cowlishaw - reassembling the code-golf version 3 with some slightly more self-explanatory helper functions,
-- to hopefully make it a little more readable.
do
  let flap fs x = map ($ x) fs
  let repeatEvery n xs = xs >>= replicate n
  let iterEvery n m p = cat $ flap (map (rotL . (% m)) (repeatEvery n [0..(m-1)])) p
  d1 $ jux (iterEvery 8 12) "808:3!3 ~ 808:3!2 ~ 808:3 ~ 808:3!2 ~"


--Version 5 by Tim Cowlishaw: Thinking from the other direction, we use Niklas's accelarated, succinct version
-- and simply stretch it by repeating each cycle 8 times:
d1 $ repeatCycles 8 $ jux (iter 12) $ s "808:3!3 ~ 808:3!2 ~ 808:3 ~ 803:3!2 ~"
