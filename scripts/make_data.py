#!/usr/bin/env python3
"""
make_data.py
Generates two lists x and y of length N with random ints 0..9
and writes to a CSV with columns x,y.

Usage:
  python scripts/make_data.py --N 50 --out data/pandas_out_50.csv
"""

import argparse
import pandas as pd
import numpy as np

def main():
    p = argparse.ArgumentParser(description="Generate random x,y and save CSV")
    p.add_argument("--N", type=int, required=True, help="Number of random points")
    p.add_argument("--out", required=True, help="Output CSV file path")
    p.add_argument("--seed", type=int, default=None, help="Optional random seed")
    args = p.parse_args()

    if args.seed is not None:
        np.random.seed(args.seed)

    x = np.random.normal(loc=0, scale=1, size=args.N)
    y = np.random.normal(loc=0, scale=1, size=args.N)

    df = pd.DataFrame({"x": x, "y": y})
    df.to_csv(args.out, index=False)
    print(f"Wrote {args.out} (N={args.N})")

if __name__ == "__main__":
    main()
