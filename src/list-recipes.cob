       IDENTIFICATION DIVISION.
       PROGRAM-ID. list-recipes.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT fd-recipes
           ASSIGN TO 'recipes.db'
           ORGANIZATION IS INDEXED
           ACCESS IS SEQUENTIAL
           RECORD KEY IS fd-recipe-id.

       DATA DIVISION.
       FILE SECTION.
       FD fd-recipes.
       COPY 'src/recipe-record.cpy'
           REPLACING ==:X:== BY ==fd-==.

       WORKING-STORAGE SECTION.
       01 ws-recipe.
           02 ws-recipe-id             PIC 9(6).
           02 FILLER                   PIC X.
           02 ws-recipe-name           PIC X(100).
       01 FILLER                       PIC X VALUE 'N'.
           88 ws-eof                   VALUE 'Y'.
           88 ws-not-eof               VALUE 'N'.
       01 ws-recipe-count              PIC 9(6) BINARY.

       PROCEDURE DIVISION.
           OPEN INPUT fd-recipes
           PERFORM UNTIL ws-eof
               READ fd-recipes
                   AT END
                       SET ws-eof TO TRUE
                   NOT AT END
                       ADD 1 TO ws-recipe-count
                       MOVE fd-recipe-id TO ws-recipe-id
                       MOVE fd-recipe-name TO ws-recipe-name
                       DISPLAY ws-recipe
               END-READ
           END-PERFORM
           CLOSE fd-recipes

           DISPLAY 'NR. RECIPES: ' ws-recipe-count

           STOP RUN
           .
