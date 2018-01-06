       IDENTIFICATION DIVISION.
       PROGRAM-ID. create-recipe.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT OPTIONAL fd-recipes
           ASSIGN TO 'recipes.db'
           ORGANIZATION IS INDEXED
           ACCESS IS RANDOM
           RECORD KEY IS fd-recipe-id.

       DATA DIVISION.
       FILE SECTION.
       FD fd-recipes.
       COPY 'src/recipe-record.cpy'
           REPLACING ==:X:== BY ==fd-==.

       PROCEDURE DIVISION.
           DISPLAY 'RECIPE ID:   ' WITH NO ADVANCING
           ACCEPT fd-recipe-id

           DISPLAY 'RECIPE NAME: ' WITH NO ADVANCING
           ACCEPT fd-recipe-name

           OPEN I-O fd-recipes
           WRITE fd-recipe
           CLOSE fd-recipes

           STOP RUN
           .
