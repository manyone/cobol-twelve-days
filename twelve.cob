       IDENTIFICATION DIVISION.
       PROGRAM-ID.    TWELVE.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  GIFTS-DEF.
       	  03 FILLER PIC X(26) VALUE 'a partridge in a pear tree'.
       	  03 FILLER PIC X(26) VALUE 'two turtle doves, and'.
       	  03 FILLER PIC X(26) VALUE 'three French hens'.
       	  03 FILLER PIC X(26) VALUE 'four calling birds'.
       	  03 FILLER PIC X(26) VALUE 'five gold rings'.
       	  03 FILLER PIC X(26) VALUE 'six geese a-laying'.
       	  03 FILLER PIC X(26) VALUE 'seven swans a-swimming'.
       	  03 FILLER PIC X(26) VALUE 'eight maids a-milking'.
       	  03 FILLER PIC X(26) VALUE 'nine ladies dancing'.
       	  03 FILLER PIC X(26) VALUE 'ten lords a-leaping'.
       	  03 FILLER PIC X(26) VALUE 'eleven pipers piping'.
       	  03 FILLER PIC X(26) VALUE 'twelve drummers drumming'.
       01  FILLER REDEFINES GIFTS-DEF. 03  GIFT PIC X(26) OCCURS 12.
       01  ORD-SFX-DEF.
       03 FILLER PIC X(24) VALUE 'stndrdththththththththth'.
       01  FILLER REDEFINES ORD-SFX-DEF. 03  ORD-SFX PIC X(2) OCCURS 12.           
       01  WS-DAY PIC 99. 01  WS-DAY-FMT PIC Z9.  01  temp-day  pic 99.             
       PROCEDURE DIVISION.
           PERFORM VARYING WS-DAY FROM 1 BY +1 UNTIL WS-DAY > 12
               DISPLAY ' '
               MOVE WS-DAY TO WS-DAY-FMT
               DISPLAY 'On the ' WS-DAY-FMT 
               ORD-SFX (WS-DAY) ' day of Christmas,'
               DISPLAY 'my true love gave to me'
               PERFORM VARYING TEMP-DAY FROM WS-DAY BY -1
               UNTIL TEMP-DAY < 1
                   DISPLAY GIFT (TEMP-DAY)
               END-PERFORM
           END-PERFORM
           GOBACK.
