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

-[dataretrieval](https://github.com/DOI-USGS/dataretrieval-python)

-[requests](https://pypi.org/project/requests/)

-[re](https://docs.python.org/3/library/re.html)

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

