# exercisecollection
This LaTeX package allows to store exercises together with solutions and further information in a separate repository and include them with or without solutions in exercise sheets. If included, soluions can be printed immediatly after the exercise or in a separate section together with the solutions of other printed exercises.

## Files
* exercisesheet.cls - class file containing (my) standard packages, style and makro definitions; derived from scrartcl
* exercisecollection.sty - main package file containing the option management (using key=value style) and file management makros
* exercisecollectionenvs.sty - provides the environments for the package
* blatt.exc - contains the style definitions of the printed exercises
* sheet01.tex - example of an exercise sheet
* exc-the-elements-01.tex - example of a repository file containing exercises

## Provided environments
The very first environment is the container for all others
* exercise - contains everything related to a paritcular exercise, text, following environments; takes two mandatory parameters: title of the exercise and awarded points (may be empty)
* info - supposed to contain any information about the exercise like source, audience, difficulty, whatever
* solution - supposed to contain the solution of the exercise
* sketch - supposed to contain a sketch of the solution (in exams abused to contain more precise information about rewarded points)
* material - supposed to contain additional material needed to solve an exercise, like some proposition
* ex@source - environment to take care of distances of printed solutions and sketches; for internal use only 
* add@material - environment to take care of distances of printed additional material; for internal use only

## Provided makros
* LoadExerciseFile[2] - loads an exercise file; parameters #1 - some name, #2 - path to the exercise file including its name
* PrintExercise[2] - print an exercise; parameters #1 - name given in LoadExerciseFile, #2 id of the exercise
* IniFiles - set up temporary files, needed whenever contents like solutions, sketches or material is printed separately
* includesolutions - print all collected solutions
* includematerials - print all collected additional material
* SetExCollProp[1] - set preferences related to the behaviour of the environments, see section below

## Keys and preferences
Preferences are chosen using the makro SetExCollProp in a comma-separated list of key=value pairs. These are (a non-empty subset of)
* extype - style of exercise, can be changed at any point (default: exc); style definitons may be given in a separate file (here blatt.exc)
* points - show rewared points (true/false)
* solution - where to print solutions (immediate/separate(default)/none/info); info prints whether an exercise provides a solution environment (default: separate)
* solutionname - printed name (default: Lösung~zu~)
+ sketch: where to print sketches of solutions (immediate/separate/none/info); (default: none)
* sketchname: printed name (default: Lösungsskizze~zu~)
* solutiontitle: printed title for the separate solutions and sketches (default: Lösungsvorschläge)
* addmaterialname: printed name (default: Ad)
* addmaterialtitle: printed title for the separate additional material (default: Zusatzmaterial)

## Class file
The class file povides besides page style, enumeration and math makro definitions a header and a title makro.
* Kopf - sets the header
* Titel[#1]<#2> - sets title #1 with an additional line #2 for due dates (parameters are captured by these brackets)
Definitions in Kopf are set by the makros
* setVeranstaltung[1]
* setSemester[1]
* setVerein[1] - long version
* setverein[1] - short version
* setSektion[1] - long version
* setsektion[1] - short version
* setDozent[1]
* setAssistent[1]
* setBlattnummer[1]

## Required packages
* komascript as base class scrartcl
* xparse, expl3 - LaTeX3 kernel
* ifthen
* amsthm - exercise style and enumeration defined via theorems
* verbatim - redirects printings
* framed - print source and id of an exercise in framed environment
* some more for mathematical functionality
