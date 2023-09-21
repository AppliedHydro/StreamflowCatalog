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

-[dataretrieval](https://github.com/DOI-USGS/dataretrieval-python) version 0.7

-[requests](https://pypi.org/project/requests/) version 2.28.1


## Step 1: Checking if Libraries are Installed

In your terminal, run the following code:

```
$ pip list
```

This call returns a list of all installed python packages. Verify that these packages are installed before attempting to run the code.

## Step 2: Installing New Libraries

In your terminal, run the following code:

```
$ pip install library
```

where *library* is the package you wish to install. Below is an example for installing the Python library matplotlib:

```
$ pip install matplotlib
```

Your machine will source, download, and install the matplotlib library. As long as no errors are thrown, you will now have access to matplotlib!
To double check that the library was installed properly, run the following code in your terminal:

```
$ python
$ import matplotlib as plt
```

## Running the Code

The code contained in this repository has a wide array of applications regarding the Streamflow Catalog and is not intended to be run
in sequence. Several scripts were created to handle syntax/formatting problems specific to individual data sets and therefore are not
applicable to every data set used in this project. Wherever possible, the target data set will be listed at the top of the script.

The codes are split into two different folders:

* Editing Code       | purpose is to configure data sets to catalog standards and naming conventions, fix null values, and query data
* Visualization Code | used for creation of tables, graphs etc. used for publications and literature

Code contained in the *Editing Code* folder will only be used as new data is added into the catalog. In other words, this is the toolbox for standardizing
and processing all data before it is entered into the master streamflow catalog. Code in the *Visualization Code* folder can be run at any time to produce
up-to-date graphics and statistics of the catalog. 

## Input Files

The Streamflow Catalog is handled as an .xlsx or .csv depending on the code operation. The master catalog file is kept and maintained on a
private shared drive and distributed by request. There is a [catalog copy](https://github.com/AppliedHydro/StreamflowCatalog/blob/main/Streamflow_Catalog.xlsx)
in the main repository folder that is available for viewing and download. Be aware that this is possibly ** not ** the most updated version of
the catalog and should only be used as a reference.

