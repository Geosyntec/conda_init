# Getting Started with Conda
This repository should help bootstrap new users of `conda` for managing programming environments.

No knowledge of `git` is required (though it is strongly recommended) to use this repository. 

*TLDR: download this repo as a zip, click the .bat, profit.*

## Installation

1. Download this repository as a .zip file
2. Extract it
3. Open the extracted directory
4. Double click the .bat file to install conda
   - This will install miniconda on your machine for your user profile.
   - the `conda` command will be available from the cmd prompt because it will be appended to your user PATH variable.
   - The location is %UserProfile%\miniconda3.
     Normalizing this install location allows IT to find this directory and white-list certain processes if needed.
5. Open a command prompt and try it out.
    One way to do so is to click your start menu and type `cmd`, then click Command Prompt. 
    That should allow you to check if the install worked by running the following command:
   
    ```shell
    >conda --version
    conda 4.11.0
    ```
    If it worked you'll see the `conda` version. If it failed with
    ```shell
    'conda' is not recognized as an internal or external command, operable program or batch file.
    ``` 
    Then you have not successfully installed conda on your system.
    If something else happened, you might not be on a Geosyntec windows computer and are therefore on your own.

## How To `conda`

Always create a `conda` environment for new projects that you work on. 
This will allow you to properly 'silo' the libraries you install so that as you assist with more and more projects you're still able to return to old project environments and run the code.

To create a new environment for an example project called Regional Climate Assessment for which we'll need to load datafiles, do maths on them, make plots from the maths, and produce figures and summary statistics, we will create a new `conda` environment.

Let's call the new env 'rca' since we'll be typing it a lot. 
We also know we want to work with `python` and use the `pandas` and `scipy` and `matplotlib` libraries to support our analysis.
Let's also install jupyter so we can do our exploratory analysis from `jupyter notebook`.

### Create an env
We can handle all this with a single command:

```shell
>conda create -n rca python=3.9 pandas scipy matplotlib jupyter
```

### Activate an env
Now all we need to do is to activate the env:
```shell
>conda activate rca
```
Now your command prompt looks something like this:
```shell
(rca) >
```

That will make python and our libraries available to us from *this command prompt only*. 

### Start doing project work
Now we can navigate to our project directory and use this environment to do data analysis on our project files.
Changing to the project directory might like this, for example:

Switch to a network drive:
```shell
(rca) >P:
```
Then change to the project directory (i.e., `cd`):
```shell
(rca) >cd "P:/some/path/to/projects/Regional Climate Assessment/Technical Analysis"
```

Then we just launch a jupyter notebook and start working:
```shell
(rca) >jupyter notebook
```

### Install other libraries
There will likely come a time when you need to do add libraries to your existing `conda` env. 

Simply activate the environment that you wish to modify, and install the libraries:
```shell
> conda activate rca
(rca) >conda install geopandas -c conda-forge
```
The above command will install the `geopandas` library and all of its dependencies into the current environment.
The "-c conda-forge" ensures that all the libraries are fully compatible with eachother and with the libraries already installed within the current environment. 
This is one of the main advantages to using `conda` is that for tricky packages like `geopandas` conda will help resolve package conflicts and ensure that the environment 'just works'.

## `arcpy` (if you must)

ESRI products use python internally for many of their functions and both ArcGIS Pro and ArcMap 10.x expose their `arcpy` library for users with active licenses.

If you do not have a license, you will find that this section of this how-to document does not apply to you.

Everything in this section is also available (and likely more current) on ESRI's own documentation [here](https://pro.arcgis.com/en/pro-app/latest/arcpy/get-started/using-conda-with-arcgis-pro.htm).

### ArcGIS Pro
ESRI's fancy new multi-core modern desktop application, ArcGIS Pro, loves `conda` so much that they actually ship both `conda` and a massive `conda` environment containing python and other `arcpy` dependencies. 

To use the ArcGIS Pro's python (and environment) when running standalone scripts use:
```shell
>c:\Progra~1\ArcGIS\Pro\bin\Python\scripts\propy.bat my_script.py
```

To activate the ArcGIS Pro environment use:
```shell
>c:\Progra~1\ArcGIS\Pro\bin\Python\scripts\proenv.bat
```

If you want to run an `arcpy` enabled jupyter notebook, simply run the above command to activate the `arcgispro-py3` environment and type `jupyter notebook`.

Consult ESRI's [documentation](https://pro.arcgis.com/en/pro-app/latest/arcpy/get-started/work-with-python-environments.htm) for other advanced features about the ArcGIS Pro environment, including cloning and installing new packages. 
This is not necessary for nearly all use cases involving `arcpy`, but if you want to explore options, see their [docs](https://pro.arcgis.com/en/pro-app/latest/arcpy/get-started/work-with-python-environments.htm).

### ArcMap 10.x
If you're still using ArcMap, consider starting to use ArcGIS Pro.

If that is not an option for you or your project, use the following command to execute the (long ago deprecated and abandoned) python 2.7 executable that ESRI ships with ArcMap 10.x:

```shell
>c:\python27\ArcGIS10.7\python.exe my_script.py
```
You'll probably need to adjust the path above if you're using a different version of ArcMap.

Lastly, if you're still using ArcMap, consider starting to use ArcGIS Pro.
