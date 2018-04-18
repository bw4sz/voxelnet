conda create -n voxelnet python=3.6
source activate voxelnet
conda install numba shapely scipy numpy Pillow pandas matplotlib
conda install -c menpo opencv
conda install -c anaconda cython
conda install -c conda-forge jupyterlab
pip install easydict

#Tensorflow, choose one
#conda install -c anaconda tensorflow-gpu
#or pip install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.7.0-cp36-cp36m-linux_x86_64.whl
conda install -c conda-forge tensorflow

#edited the setup.py to capture numpy array
python3 setup.py build_ext --inplace

cd kitti_eval

#load boost
ml boost

#find the boost dir
echo $HPC_BOOST_DIR

#build evaluation metrics
g++ -o evaluate_object_3d_offline evaluate_object_3d_offline.cpp -I /apps/boost/1.59.0

#grant permissions to launch tests
chmod +x launch_test.sh
