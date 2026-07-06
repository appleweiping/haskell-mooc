#!/usr/bin/env bash
# Runs every SetNTest.hs and captures output to ../results/SetN.txt
# Usage: bash run_all_tests.sh
set -u
mkdir -p ../results
SETS="1 2a 2b 3a 3b 4a 4b 5a 5b 6 7 8 9a 9b 10a 10b 11a 11b 12 13a 13b 14a 14b 15 16a 16b"
: > ../results/SUMMARY.txt
for s in $SETS; do
  echo "===== Set${s} ====="
  out=$(stack runghc "Set${s}Test.hs" 2>&1)
  echo "$out" > "../results/Set${s}.txt"
  # extract the final "score / total" line
  score=$(echo "$out" | grep -E "^[0-9]+ / [0-9]+" | tail -1)
  echo "Set${s}: ${score:-<no score>}" | tee -a ../results/SUMMARY.txt
done
echo "=== DONE ==="
cat ../results/SUMMARY.txt
