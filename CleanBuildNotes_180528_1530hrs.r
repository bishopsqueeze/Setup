##-------------------------------------------------------------------
## Clean install of OS
##-------------------------------------------------------------------

## [1] Wipe the disk and install a clean mac OS

## [2] Install basic apps
##		- Firefox
##		- Github Desktop Application
##		- CodeRunner

## [3] Install Xcode command line tools via "xcode-select --install"


## [4] Install compilers to allow us to build R packages from source
##		- Go to: http://hpc.sourceforge.net/
##		- Get the latest build (gcc-8.1-bin.tar.gz as of 05/28/18)
## 		- Install 
##			gunzip gcc-8.1-bin.tar.gz
## 			sudo tar -xvf gcc-8.1-bin.tar -C /.
## 		- It installs everything in /usr/local

## [5] Confirm install of gfortran & gcc

	qp:Downloads alexstephens$ gfortran --version
	GNU Fortran (GCC) 8.1.0
	Copyright (C) 2018 Free Software Foundation, Inc.
	This is free software; see the source for copying conditions.  There is NO
	warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

	qp:Downloads alexstephens$ gcc --version
	gcc (GCC) 8.1.0
	Copyright (C) 2018 Free Software Foundation, Inc.
	This is free software; see the source for copying conditions.  There is NO
	warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

##-------------------------------------------------------------------
## Clean install of R
##-------------------------------------------------------------------

## [6] Install R & reboot

## [7] Install TaskView Library
	install.packages("ctv")
	library(ctv)

## [8] Attempt to install views (only use binaries)
	ctv::install.views("HighPerformanceComputing")

		## attempt to install Rmpi after this error message
		ERROR: dependency ‘Rmpi’ is not available for package ‘doMPI’
		* removing ‘/Library/Frameworks/R.framework/Versions/3.5/Resources/library/doMPI’

			## attempt to install Rmpi from source
			install.packages("Rmpi")
			configure: error: "Cannot find mpi.h header file"

			## follow instructions on the following website to download
			## and install OpenMPI (Message Passing Interface)
			https://wiki.helsinki.fi/display/HUGG/Open+MPI+install+on+Mac+OS+X
			
			## try to install Rmpi ... worked!
		
## [9] (again) Attempt to install views (only use binaries)
	ctv::install.views("HighPerformanceComputing")
	ctv::install.views("Bayesian")					## cairoDevice, gWidgetsRGtk2, AtelieR not installed
	ctv::install.views("Cluster")					## clusterfly not installed	
	ctv::install.views("Distributions")				
	ctv::install.views("Econometrics")
	ctv::install.views("ExperimentalDesign")
	ctv::install.views("ExtremeValue")
	ctv::install.views("Finance")					## Rglpk, Quantlib
	ctv::install.views("Graphics")
	ctv::install.views("MachineLearning")			## Rweka failed need JDK
	
		## need to instsll a jdk (Java Development Kit) to install RWeka, so download the latest 
		
		java version "10.0.1" 2018-04-17
		Java(TM) SE Runtime Environment 18.3 (build 10.0.1+10)
		Java HotSpot(TM) 64-Bit Server VM 18.3 (build 10.0.1+10, mixed mode)
		
		## Installed the JDK 10.*; but looks like RWeka is looking for version 9.*,
		## so the install failed
		  dlopen(/Library/Frameworks/R.framework/Versions/3.5/Resources/library/rJava/libs/rJava.so, 
			6): Library not loaded: /Library/Java/JavaVirtualMachines/jdk-9.jdk/Contents/Home/lib/server/libjvm.dylib
	
	ctv::install.views("Multivariate")	
	ctv::install.views("NumericalMathematics")
	ctv::install.views("Survival")	
	ctv::install.views("TimeSeries")


##-------------------------------------------------------------------
## Clean install of Python
##-------------------------------------------------------------------

## [] Follow the instructions on this website
	
	http://docs.python-guide.org/en/latest/starting/install3/osx/
	
## [] Install homebrew (package manager for mac os)
	
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	
## [] Edit /etc/paths to include /usr/local/sbin in the search patch
	
	See:  https://www.architectryan.com/2012/10/02/add-to-the-path-on-mac-os-x-mountain-lion/

## Install python via "% brew install python"


	Python has been installed as
		/usr/local/bin/python3

	Unversioned symlinks `python`, `python-config`, `pip` etc. pointing to
	`python3`, `python3-config`, `pip3` etc., respectively, have been installed into
		/usr/local/opt/python/libexec/bin

	If you need Homebrews Python 2.7 run
		brew install python@2

	Pip, setuptools, and wheel have been installed. To update them run
		pip3 install --upgrade pip setuptools wheel

	You can install Python packages with
		pip3 install <package>
		
	They will install into the site-package directory
		/usr/local/lib/python3.6/site-packages

	See: https://docs.brew.sh/Homebrew-and-Python
	
	
## Add the above path to the python simlink to enable links to python / pip
	
	export PATH=/usr/local/opt/python/libexec/bin:$PATH
	

##-------------------------------------------------------------------
## Clean install of CodeRunner
##-------------------------------------------------------------------

## [1] I installed a version of CodeRunner from the App Store, when I 
## tried to run a python script from the application, it said that I
## would need to download the non-app-store version. 

## [2] Install the non-app-store version (CodeRunner-2.3.zip)

## [3] This worked.  I was able to execute python commands from the app






##-------------------------------------------------------------------
## Notes from previous build attempts
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
##		  so I installed them via the command line 'xcode-select --install'
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
##
##	7. At this point, most of the source installs I would not likely use, so 
##	   I just installed the non-source versions and skipped compiles as a rule
##-------------------------------------------------------------------

##-------------------------------------------------------------------
## Views Installed
##-------------------------------------------------------------------
ctv::install.views("HighPerformanceComputing")
ctv::install.views("Bayesian")					## Failed compiles: RGtk2, cairoDevice, cudaBayesreg, gWidgetsRGtk2, AtelieR
ctv::install.views("Cluster")					## binaries only
ctv::install.views("Distributions")				## binaries only
ctv::install.views("Econometrics")
ctv::install.views("ExperimentalDesign")
ctv::install.views("ExtremeValue")
ctv::install.views("Finance")
ctv::install.views("Graphics")
ctv::install.views("MachineLearning")			## binaries only
ctv::install.views("Multivariate")				## binaries only
ctv::install.views("NumericalMathematics")
ctv::install.views("Survival")					## binaries only
ctv::install.views("TimeSeries")
ctv::install.views("WebTechnologies")


##-------------------------------------------------------------------
## Python install
##-------------------------------------------------------------------

## Use the following guide.  It is a little clunky though
##	http://docs.python-guide.org/en/latest/starting/install3/osx/

## install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## modify the path to ensure /usr/local directories are first in the search list
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

## I edited the /etc/paths file
/usr/local/bin
/usr/local/sbin
/usr/bin
/bin
/usr/sbin
/sbin

## Use homebew to install python3
brew install python

## The install echoed the following
python has been installed as 
	/usr/local/bin/python3

Unversioned symlinks `python`, `python-config`, `pip` etc. pointing to `python3`, `python3-config`, `pip3` etc., 
respectively, have been installed into
	/usr/local/opt/python/libexec/bin

If you need Homebrews Python 2.7 run
	brew install python@2

Pip, setuptools, and wheel have been installed. To update them run
	pip3 install --upgrade pip setuptools wheel

You can install Python packages with
	pip3 install <package>
They will install into the site-package directory
	/usr/local/lib/python3.6/site-packages

See: https://docs.brew.sh/Homebrew-and-Python


## To take advantage of the above symlinks I edited the .bash_profile to include
export PATH=/usr/local/opt/python/libexec/bin:$PATH:/Users/alexstephens/Library/Python/3.6/bin


##

## add this to the .bash_profile $PATH variable: /Users/alexstephens/Library/Python/3.6/bin

