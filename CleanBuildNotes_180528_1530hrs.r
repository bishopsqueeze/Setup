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

## [1] Install R & reboot

## [2] Install TaskView Library
	install.packages("ctv")
	library(ctv)

## [3] Attempt to install views (only use binaries)
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
		
## [4] (again) Attempt to install views (only use binaries)
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
			
		## Because of this issue, I removed java using the following methods:
			https://docs.oracle.com/javase/8/docs/technotes/guides/install/mac_jdk.html#A1096903
			http://osxdaily.com/2017/06/16/uninstall-java-mac/
	
	ctv::install.views("Multivariate")	
	ctv::install.views("NumericalMathematics")
	ctv::install.views("Survival")	
	ctv::install.views("TimeSeries")


## [5] Insatlling some of the troublesome packages

	## attempted to install RGtk2
		install.packages("RGtk2")
		configure: error: GTK version 2.8.0 required
		
	## install the GTK+ package GTK_2.24.17-X11.pkg from https://r.research.att.com/
	## (now try the above again ... fail)
	
	## see also https://stackoverflow.com/questions/44013379/installing-rgtk2-on-macos-sierra-version-10-12-4-and-r-version-3-4-0
		
	## Attempting to follow those instructions, but I faile running "R CMD INSTALL ~/Downloads/cairoDevice_2.24.tar.gz"
	## it says there is no 'pkg-config'
	
	## So, install via brew
		brew install pkg-config

	## I'm not certain of the value of these packages given that they seem to be 
	## specialized graphics / GTK-based tools, so I'll abandon this for now.


##-------------------------------------------------------------------
## Clean install of Python
##-------------------------------------------------------------------

## [1] Follow the instructions on this website
	
	http://docs.python-guide.org/en/latest/starting/install3/osx/
	
## [2] Install homebrew (package manager for mac os)
	
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	
## [3] Edit /etc/paths to include /usr/local/sbin in the search patch
	
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
	
	
## [4] Add the above path to the python simlink to enable links to python / pip
	
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
## Rstudio install
##-------------------------------------------------------------------

## [1] Installed RStudio-1.1.453.dmg


##-------------------------------------------------------------------
## Issues with JAGS
##-------------------------------------------------------------------

## [1] Tried to run the installed 'rjags' library in R, but got the 
## following error message

Error: package or namespace load failed for ‘rjags’:
 .onLoad failed in loadNamespace() for 'rjags', details:
	call: dyn.load(file, DLLpath = DLLpath, ...)
	error: unable to load shared object '/Library/Frameworks/R.framework/Versions/3.5/Resources/library/rjags/libs/rjags.so':
	dlopen(/Library/Frameworks/R.framework/Versions/3.5/Resources/library/rjags/libs/rjags.so, 10): Library not loaded: /usr/local/lib/libjags.4.dylib
	Referenced from: /Library/Frameworks/R.framework/Versions/3.5/Resources/library/rjags/libs/rjags.so
	Reason: image not found
	
	
## [2] One source to help trouble-shoot the issue 
## 		- https://gist.github.com/casallas/8411082
##		- Which suggests doing
	brew install jags
	
## [3] Ok, this appears to work, but there were several issues with the brew 
## install itself 
	
	==> Pouring gmp-6.1.2_2.high_sierra.bottle.tar.gz
	Error: The `brew link` step did not complete successfully
	The formula built, but is not symlinked into /usr/local
	Could not symlink include/gmp.h
	Target /usr/local/include/gmp.h
	already exists. You may want to remove it:
		rm '/usr/local/include/gmp.h'

	To force the link and overwrite all conflicting files:
		brew link --overwrite gmp

	To list all files that would be deleted:
		brew link --overwrite --dry-run gmp

		Possible conflicting files are:
		/usr/local/include/gmp.h
		/usr/local/include/gmpxx.h
		/usr/local/lib/libgmp.10.dylib
		/usr/local/lib/libgmp.a
		/usr/local/lib/libgmp.dylib -> /usr/local/lib/libgmp.10.dylib
		/usr/local/lib/libgmpxx.4.dylib
		/usr/local/lib/libgmpxx.a
		/usr/local/lib/libgmpxx.dylib -> /usr/local/lib/libgmpxx.4.dylib
		

		==> Pouring mpfr-4.0.1.high_sierra.bottle.tar.gz
		Error: The `brew link` step did not complete successfully
		The formula built, but is not symlinked into /usr/local
		Could not symlink include/mpf2mpfr.h
		Target /usr/local/include/mpf2mpfr.h
		already exists. You may want to remove it:
			rm '/usr/local/include/mpf2mpfr.h'

		To force the link and overwrite all conflicting files:
			brew link --overwrite mpfr

		To list all files that would be deleted:
			brew link --overwrite --dry-run mpfr

		Possible conflicting files are:
		/usr/local/include/mpf2mpfr.h
		/usr/local/include/mpfr.h
		/usr/local/lib/libmpfr.a
		/usr/local/lib/libmpfr.dylib -> /usr/local/lib/libmpfr.4.dylib
		
		
		==> Pouring libmpc-1.1.0.high_sierra.bottle.tar.gz
		Error: The `brew link` step did not complete successfully
		The formula built, but is not symlinked into /usr/local
		Could not symlink include/mpc.h
		Target /usr/local/include/mpc.h
		already exists. You may want to remove it:
			rm '/usr/local/include/mpc.h'

		To force the link and overwrite all conflicting files:
			brew link --overwrite libmpc

		To list all files that would be deleted:
			brew link --overwrite --dry-run libmpc

		Possible conflicting files are:
		/usr/local/include/mpc.h
		/usr/local/lib/libmpc.3.dylib
		/usr/local/lib/libmpc.a
		/usr/local/lib/libmpc.dylib -> /usr/local/lib/libmpc.3.dylib
		
		
		## Most troubling
		==> Pouring gcc-8.1.0.high_sierra.bottle.1.tar.gz
		Error: The `brew link` step did not complete successfully
		The formula built, but is not symlinked into /usr/local
		Could not symlink bin/gfortran
		Target /usr/local/bin/gfortran
		already exists. You may want to remove it:
			rm '/usr/local/bin/gfortran'

		To force the link and overwrite all conflicting files:
			brew link --overwrite gcc

		To list all files that would be deleted:
			brew link --overwrite --dry-run gcc

	

	==> Pouring jags-4.3.0_2.high_sierra.bottle.tar.gz
	Warning: jags dependency gcc was built with a different C++ standard
	library (libstdc++ from clang). This may cause problems at runtime.
	🍺  /usr/local/Cellar/jags/4.3.0_2

	## [4] Source the DBDA2E-utilities -- worked ... but not sure if it
	## "really" works
	
	## [5] attempt to run jags from the command line
	
	db:~ alexstephens$ jags 
	dyld: Library not loaded: /usr/local/opt/libtool/lib/libltdl.7.dylib
		Referenced from: /usr/local/Cellar/jags/4.3.0_2/libexec/jags-terminal
		Reason: image not found
	Abort trap: 6
	
	## [6] Try to install libtool via homebrew
	
	db:Cellar alexstephens$ brew install libtool --universal
	Warning: libtool: this formula has no --universal option so it will be ignored!
	==> Downloading https://homebrew.bintray.com/bottles/libtool-2.4.6_1.high_sierra.bottle.tar.gz
	######################################################################## 100.0%
	==> Pouring libtool-2.4.6_1.high_sierra.bottle.tar.gz
	==> Caveats
	In order to prevent conflicts with Apples own libtool we have prepended a "g"
	so, you have instead: glibtool and glibtoolize.
	==> Summary
	🍺  /usr/local/Cellar/libtool/2.4.6_1: 71 files
	
	## [7] Now try to run jags from the command link (ok)
	
	db:Cellar alexstephens$ jags
	Welcome to JAGS 4.3.0 on Sun Jun  3 22:10:15 2018
	JAGS is free software and comes with ABSOLUTELY NO WARRANTY
	Loading module: basemod: ok
	Loading module: bugs: ok



