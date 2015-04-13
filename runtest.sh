rm -rf Whatever*
hprotoc --unknown_fields whatever.proto whatever2.proto
runhaskell test.hs
