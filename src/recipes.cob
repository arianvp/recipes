       IDENTIFICATION DIVISION.
       PROGRAM-ID. recipes.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 FILLER.
           02 FILLER PIC X.
           02 ws-number PIC 9(2) BINARY.

       PROCEDURE DIVISION.
           ADD 1 TO ws-number
           DISPLAY ws-number
           STOP RUN
           .
