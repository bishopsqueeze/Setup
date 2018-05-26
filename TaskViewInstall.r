##-------------------------------------------------------------------
## install the TaskView Library
##-------------------------------------------------------------------
install.packages("ctv")
library(ctv)

##-------------------------------------------------------------------
## Some packages will only install via source; however, we need to have compilers installed. 
## I followed the basic steps to install source packages, but I generally prefer to 
## install binary packages instead.
##-------------------------------------------------------------------

##-------------------------------------------------------------------
## Steps Taken
##-------------------------------------------------------------------
##	1. Install the binary compilers housed on the CRAN site (https://cran.r-project.org/bin/macosx/tools/)
##		- Installed the clang package (6.0.0) from that site
##
##	2. Since there was a later version of gFortran on (https://gcc.gnu.org/wiki/GFortranBinaries) I 
##	   installed the gfortran-6.3-Sierra.dmg instead
##
##  3. Then I tried to install a package
##		- The initial attempt failed b/c I had to install the Xcode command line tools
##
##	4. Then I tried to install the High Performance Computing package
##		- ctv::install.views("HighPerformanceComputing")
##		- There were several packages that I had to install via source.  Some worked, some failed.
##			- E.g., install.packages("OpenCL") would install
##			- But other packages like install.packages("Rhpc") would fail do to a missing mpi.h header
##
##	5. Then I installed other compilers to get OpenMPI to install
##		- install latest gcc libraries (http://hpc.sourceforge.net/; gcc-7.1-bin.tar)
##		- attempt to configure/make/make install OpenMPI
##
##	6. Try some of the source-only packaged
##		- install.packages("Rmpi") == worked
##		- install.packages("Rhpc") == failed (seems like there could be an issue in RhpcMPIapaplyLB.h)
##		- Others that failed
##			- ‘cudaBayesreg’ (error)	## GPU platform for the analysis of brain fMRI data
##			- ‘permGPU’ (error)			## For permutation resampling inference in the context of RNA microarray studies
##			- ‘Rhpc’ (error)			## Function of apply style using 'MPI' provides better 'HPC' environment on R
##			- ‘pbdBASE’ (error)			## An interface to and extensions for the 'PBLAS' and 'ScaLAPACK' numerical libraries
##			- ‘pbdDEMO’ (error)
##			- ‘pbdDMAT’ (error)
##			- ‘pmclust’ (error			## model-based clustering (unsupervised) for high dimensional and ultra large data

##-------------------------------------------------------------------
## Views Installed
##-------------------------------------------------------------------
##ctv::install.views("HighPerformanceComputing")
##ctv::install.views("Bayesian")				##	Failed compiles: RGtk2, cairoDevice, cudaBayesreg, gWidgetsRGtk2, AtelieR
##ctv::install.views("Cluster")					## binaries only
##ctv::install.views("Distributions")			## binaries only
ctv::install.views("Econometrics")
ctv::install.views("ExperimentalDesign")
ctv::install.views("ExtremeValue")
ctv::install.views("Finance")
ctv::install.views("Graphics")
ctv::install.views("MachineLearning")			## binaries only
ctv::install.views("Multivariate")			## binaries only
ctv::install.views("NumericalMathematics")
ctv::install.views("Survival")				## binaries only
ctv::install.views("TimeSeries")
ctv::install.views("WebTechnologies")
