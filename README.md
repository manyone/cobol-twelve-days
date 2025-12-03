

# 🎄 TWELVE Days of Christmas – A COBOL Lyrics Generator

A classic holiday carol brought to life in **COBOL**, demonstrating structured data handling and nested loops in vintage mainframe style.

> *"On the 1st day of Christmas, my true love gave to me…"*

This program generates all twelve verses of *"The Twelve Days of Christmas"* using pure COBOL, with no external dependencies—just data tables, redefines, and good old-fashioned performs.

---

## 📜 Program Overview

- **Language**: GnuCOBOL (for the **pc**) and COBOL-74 (compatible with MVS/TSO environments like **TK4-**)
- **Key Techniques**:
  - Tabular data via `OCCURS` and `REDEFINES`
  - Ordinal suffix handling (`1st`, `2nd`, `3rd`, `4th`, …)
  - Nested `PERFORM` loops to list gifts cumulatively—because nothing says holiday cheer like **year-end inventory with look-back logic for period-to-date tracking**.

The inner loop **descends from the current day down to day 1**, printing each gift in reverse chronological order—just like the song!

---

## 🧾 Data Structure

Two parallel tables drive the lyrics:

1. **`GIFTS-DEF`**  
   Holds the 12 gift lines (padded to 26 characters):
   ```text
   'a partridge in a pear tree'
   'two turtle doves, and      '
   'three French hens          '
   ...
   ```

2. **`ORD-SFX-DEF`**  
   Encodes ordinal suffixes compactly:
   ```text
   'stndrdththththththththth'
   ```
   Redefined as `ORD-SFX OCCURS 12`, used for expressing ordinal suffixes (`1st`,`2nd`, `3rd`, etc).

Both tables are indexed by the same loop counter (`WS-DAY`), ensuring tight synchronization between day number, suffix, and gift.

---

## ▶️ How to Run

### ✅ On PC (GnuCOBOL)

1. Install [GnuCOBOL](https://www.gnu.org/software/gnu-cobol/)
2. Compile and run:
   ```bash
   cobc -x twelve.cob -o twelve
   ./twelve
   ```
   Or simply (if `cobc` is in your PATH and script is executable):
   ```bash
   ./twelve
   ```

### 🖥️ On Mainframe (TK4- / MVS)

1. Download `TWELVE74.cbl` into your TK4- environment as  source member `TWELVE` in a PDS such as `userid.SOURCE.COBOL`
2. Compile and run with a standard **compile-and-go** procedure:
```
//useridX  JOB (COB),
//             'TWELVE',
//             CLASS=A,
//             MSGCLASS=C,
//             REGION=0M,TIME=1440,
//             MSGLEVEL=(1,1)
//STP2 EXEC COBUCLG
//COB.SYSIN DD DISP=SHR,
//            DSN=userid.SOURCE.COBOL(TWELVE)
```
> 💡 The `twelve74.cob` adapts the GnuCOBOL logic to COBOL-74 syntax (e.g., explicit loop bounds instead of inline `PERFORM`).



---

## 🎁 Sample Output

```
On the  1st day of Christmas,
my true love gave to me
a partridge in a pear tree

On the  2nd day of Christmas,
my true love gave to me
two turtle doves, and
a partridge in a pear tree

...
```

---

## 🎄 Merry Christmas!

*— manyone*

---

