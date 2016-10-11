## PlanetOS-Mathematica-Examples
**PlanetOS** is a cloud-based data solutions for geospatial data.
It maintains catalog of public and commercial datasets.
**Mathematica** is a popular mathematical modelling software. It enables efficient model prototype and advanced data visualization.


This repository contains examples to demonstrate how to use PlanetOS API with Mathematica with real engineering applications.

### Create PlanetOS configure file to set up API key

Create `PlanetOSconfigure.m` with following API key information
~~~
(*Insert your API key here*)
apikey = " ";
~~~

### Online previews:

Station metadata: https://www.wolframcloud.com/objects/45889abe-8e75-4870-9095-f26dc48a1db2

Station data request and processing: https://www.wolframcloud.com/objects/4d9bb966-ed5e-4ccb-9f9b-51212781eabe


### Use this API in your own project

Place `PlanetOS.m` into your working directory and load it along with configure file

~~~
<<PlanetOS.m
<<PlanetOSconfigure.m
~~~
