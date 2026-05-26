**Cellprofiler version 3.1.8**

Notes:
- example test-data taken from CellProfiler website, ExampleHuman.zip
- py-dask==0.19.1 is crucial when build containers, other version will break
- as at 10/09/2019, both containers are tested ok when run headlessly
- need to test running with GUI

**Build Docker container**

```
docker build -t cellprofiler:latest .
```

**To Run docker headlessly with test-data**

cd to the directory

``` 
docker run --volume=`pwd`/test-data/input:/input \
            --volume=`pwd`/test-data/output:/output cellprofiler \
            --image-directory=/test-data/input --output-directory=/test-data/output \
            --pipeline=/test-data/input/ExampleHuman.cppipe \
            --file-list=/test-data/input/filelist.txt
```
            

**Build Singularity container**

```
singularity build cellprofiler Singularity
```

**To run singularity container headlessly**


```
singularity run -B ./test-data/input:/input,./test-data/output/:/output \
            cellprofiler-s --pipeline=/test-data/input/ExampleHuman.cppipe \
            --file-list=/test-data/input/filelist.txt
```

**Run docker container with GUI** (not working with gnome+vmware horizon)


```
xhost +local:root
docker run -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro cellprofiler ""
```

**Run singularity container with GUI**
- for gnome+vmware, check xauthority file location and display port first
- for other envs it's just works



