# StreamflowCatalog

The [Streamflow Catalog](https://www.mdpi.com/2073-4441/15/4/679) project is an effort to combine current and historical streamflow monitoring location information in the United States Pacific Northwest that has been obtained from 32 state and local organizations. Over 60% of the streamflow monitoring locations in the Streamflow Data Catalog are not available online and are thus not findable through web search engines. This repository is the compilation of code used to query, clean, and process the stream gage information that is the current version of the streamflow catalog. 

## Contacts

Kendra Kaiser (kendrakaiser@boisestate.edu)

Steven Schmitz (stevenschmitz@u.boisestate.edu)


## Getting Started

Usage of these codes requires multiple external python libraries to execute that are listed below. If these libraries are not on your machine,
follow the steps below to install. Python 3.0 or greater is required. Code was written and executed on Python v. 3.9.7.

-[OpenPyxl](https://openpyxl.readthedocs.io/en/stable/#) version 3.0.10

-[NumPy](https://numpy.org/) version 1.23.1

-[matplotlib](https://matplotlib.org/) version 3.5.2

## Step 1: Checking if Libraries are Installed

In your terminal, run the following code:

```
$ pip list
```

This call returns a list of all installed python packages. Verify that these packages are installed before attempting to run the code.

## Step 2: Installing New Libraries

In your terminal, run the following code:

```
$ pip install *library*
```

where *library* is the library you wish to install. Below is an example for installing the Python library matplotlib:

```
$ pip install matplotlib
```

Your machine will source, download, and install the matplotlib library. As long as no errors are thrown, you will now have access to matplotlib!
To double check that the library was installed properly, run the following code:

```
$ python
$ import matplotlib as plt
```





Install t
a) Editing code (https://github.com/AppliedHydro/StreamflowCatalog/tree/main/Editing%20Code) holds all of the scripts that were used for edits throughout the compilation process.

b) Visualization code (https://github.com/AppliedHydro/StreamflowCatalog/tree/main/Visualization%20Code) is the folder where all code used for graphic visualizations is stored. This includes graphics used internally and for the publication.


The following modules are necessary to successfully execute the catalog code. Below are the web sources
as well as installation instruction through command prompt. Python 3.0 or greater is required. Code was
written and executed on Python v. 3.9.7.

Editing_Master.py is the master editing file that contains examples of the code used to evaluate streamflow
catalog to check for misspellings, standardization issues, and empty fields. Many incorrect field edits were 
made manually on a case-by-case basis.

Catalog_Master.py is the python script to sort data and create graph visualizations using matplotlib.


(1) 	
NumPy
version 1.23.1
https://numpy.org/

a) installation through command prompt:
	$pip install numpy
b) double check module was installed correctly:
	$pip show numpy
<show> command will show module name, version number, and file location. <package not found> will indicate
the module didn't install correctly.

(2)
openpyxl 
version 3.0.10
https://openpyxl.readthedocs.io/en/stable/#

a) installation through command prompt:
	$pip install openpyxl
b) double check module was installed correctly:
	$pip show openpyxl
<show> command will show module name, version number, and file location. <package not found> will indicate
the module didn't install correctly.

(3)
matplotlib
version 3.5.2
https://matplotlib.org/

a) installation through command prompt:
	$pip install matplotlib
b) double check module was installed correctly:
	$pip show matplotlib
<show> command will show module name, version number, and file location. <package not found> will indicate
the module didn't install correctly.
