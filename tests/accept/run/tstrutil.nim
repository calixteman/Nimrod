# test the new strutils module

import
  strutils

proc testStrip() =
  write(stdout, strip("  ha  "))

proc main() = 
  testStrip()
  for p in split("/home/a1:xyz:/usr/bin", {':'}):
    write(stdout, p)
    
assert(insertSep($1000_000) == "1_000_000")
assert(insertSep($232) == "232")
assert(insertSep($12345, ',') == "12,345")
assert(insertSep($0) == "0")

assert(editDistance("prefix__hallo_suffix", "prefix__hallo_suffix") == 0)
assert(editDistance("prefix__hallo_suffix", "prefix__hallo_suffi1") == 1)
assert(editDistance("prefix__hallo_suffix", "prefix__HALLO_suffix") == 5)
assert(editDistance("prefix__hallo_suffix", "prefix__ha_suffix") == 3)
assert(editDistance("prefix__hallo_suffix", "prefix") == 14)
assert(editDistance("prefix__hallo_suffix", "suffix") == 14)
assert(editDistance("prefix__hallo_suffix", "prefix__hao_suffix") == 2)

main()
#OUT ha/home/a1xyz/usr/bin