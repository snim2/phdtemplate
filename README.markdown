
# PhD Meta-Thesis, University of Wolverhampton.

This repository contains a meta-thesis, that is, a LaTeX template for
typesetting PhD thesis at the University of Wolverhampton. It is
largely based on a similar piece of work by Donald Craig at Memorial
University, Newfoundland. You can find Donald's original work on his
web site, here: http://www.cs.mun.ca/~donald/metathesis/

The latest version of _this_ template can be found here:
[http://github.com/snim2/phdtemplate](http://github.com/snim2/phdtemplate)


## Contents of this meta-thesis

### Documentation

  * **README.markdown** this file.
  * **example.pdf** example thesis, read this before you start.

### Files you should edit

  * **Makefile** used to build the thesis. Edit this to include all of
     your LaTeX, BibTeX files and figures.
  * **abstract.tex** write your thesis abstract here.
  * **ack.tex** write your acknowledgements here.
  * **bib.tex** includes all of your BibTeX files. Edit this to list
     each file you want to use.
  * **thesis.tex** generates the thesis document. Edit this to change
     the title, author and year of the thesis and to include each of
     your chapters and appendices.
  * **chapters/** directory containing LaTeX files for each of your
     chapters or appendices. Edit these as you wish. The file
     **chapters/introduction.tex** describes how the various
     facilities provided in this template can be used.
  * **figures/** directory containing all figures used in the
     thesis. Edit these as you wish.
  * **refs/** directory containing all BibTeX files containing
     references cited in the thesis. Edit these as you wish.
  * **src/** directory containing all software quoted in the
      thesis. Edit these as you wish.

### Files you should not edit

  * **contents.tex** automatically generates a table of contents. Do
     not edit this.
  * **figures.tex** automatically generates a table of figures included
     in the thesis. Do not edit this.
  * **listings.tex** automatically generates a table of software
     listings included in the thesis. Do not edit this.
  * **tables.tex** automatically generates a table of tables included
     in the thesis. Do not edit this.
  * **tango.tex** controls the syntax highlighting of software
     listings. Edit this if you want to change the way that listings
     are displayed.
  * **thesis.sty** controls the way that the thesis is typeset. Do not
     edit this.

All other files are automatically generated.


## Requirements and installation

As a minimum, you will need a working LaTeX installation, a version of
`make` (such as GNU make), the LaTeX listings package, which is used
for typesetting software listings
[http://www.ctan.org/tex-archive/macros/latex/contrib/listings/](http://www.ctan.org/tex-archive/macros/latex/contrib/listings/)
and BibTeX, for processing references and citations. To use the
automatic word count facility you will also need `detex` and `wc`.

If you have an aversion to using non-WYSIWYG typesetting systems you
may want to look at LyX: [http://www.lyx.org/](http://www.lyx.org/)
which is a cross-platform, graphical front-end to LaTeX.

### Ubuntu

On Ubuntu you can get all of these by typing the following at the
command line:

    $ sudo apt-get install build-essential
    $ sudo apt-get install tetex*

In fact, this will also install all sorts of LaTeX packages that might
be useful to you later on, which is nice.

### Windows

The most common way to get a LaTeX distribution for Windows is to use
the MikTeX packages: (http://www.miktex.org/)[http://www.miktex.org/]
A guide to installing MikTeX can be found here:
(http://www3.hi.is/~tpr/latex/index.html)[http://www3.hi.is/~tpr/latex/index.html}


## Usage

On Linux (or any other UNIX), you can build you PhD thesis by typing
this at the command line:

    $ make

This will build the thesis and attempt to open `acroread` to view
it. If you don't use acroread to view PDF documents then edit the
`Makefile` and change the line: `VIEWER=$(PREFIX)/acroread` to
whatever PDF viewer you prefer.

If something goes wrong with the build and LaTeX prints an error
message and does _not_ return directly to the shell, type `x` to
interrupt the LaTeX process and drop back into BASH (or whatever shell
you are using). Edit your document then do a `make clean` (see below)
and start again. You can combine these last two stages in most shells
like this:

    $ make clean && make

which will only execute the `make` command if `make clean` exits
successfully. 

### Postscript

If you want to generate a Postscript (.ps) version of your thesis, use
the following:

    $ make thesis.ps

### PDF

If you want to generate a PDF version of your thesis, use the
following:

    $ make thesis.pdf

### Cleaning up (removing generated files)

To "clean" your thesis directory by removing auto-generated files, use
the following:

    $ make clean

### Accurate word counts

Before submitting your thesis you will need to generate an accurate
word count of your document. This should exclude things like tables of
contents and LaTeX directives. To generate such a word count
automatically, use the following:

    $ make wc

The output should look something like this:

    $ make wc
    
      UoW metathesis, current word count: 24495
    
    $


## Hints and tips

  * For goodness sake archive your thesis with a version control
    system (CVS, SVN, Git, Mercurial, Bazaar, ...) or at the very
    least keep some sort of remote backup. Because you are using
    LaTeX, you will be able to `diff` different versions of your
    thesis (using UNIX `diff` or a graphical tool such as Meld:
    (http://meld.sourceforge.net/)[http://meld.sourceforge.net/]), 
    roll-back erroneous changes, and so
    on. If nothing else use a service like 
    (http://www.dropbox.com)[http://www.dropbox.com] 
    or Ubuntu One to keep a backup somewhere.
  * If you are including code listings in your thesis, keep them in a
    separate directory on disk and include them with the listings
    package, as shown in the example chapter. This way, when you edit
    your programs (and execute and test them) you won't have to copy
    your changes back into your document. This will save you a tonne
    of time. If you already use LaTeX, you will think this is a stupid
    thing to include as a hint, but you would be amazed at how many
    word processor users are quite happy to waste their time in this
    way.  
  * Use services like (http://www.bibsonomy.org/)[http://www.bibsonomy.org/] 
    to find BibTeX versions of references and save generating them 
    yourself.

---------------------------------------

© Sarah Mount, University of Wolverhampton, 2010.

