This directory contains the Isabelle formalization used in our submission.
If you have Isabelle2021-1 (https://isabelle.in.tum.de) and the 
Archive of Formal Proofs 2021-1 (https://www.isa-afp.org) installed, then you can open 
Isabelle/jEdit to inspect our proofs.

If Isabelle2021-1 and the Archive of Formal Proofs 2021-1 are not on your machine you can 
install them as explained here:

== Installation of Isabelle and AFP on Linux ==

$ cd ~
$ mkdir Pushdown
$ cd Pushdown
$ wget https://isabelle.in.tum.de/dist/Isabelle2021-1_linux.tar.gz
$ tar zxvf Isabelle2021-1_linux.tar.gz
$ wget https://www.isa-afp.org/release/afp-2022-01-06.tar.gz
$ tar zxvf afp-2022-01-06.tar.gz
$ ./Isabelle2021-1/bin/isabelle components -u ./afp-2022-01-06/thys/
$ ./Isabelle2021-1/bin/isabelle jedit


The last command starts Isabelle/jEdit which is Isabelle's Prover IDE.
In Isabelle/jEdit under File>Open you can open the various .thy files in our 
reproducibility package to inspect our proofs.
