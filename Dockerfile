# Use the official Jupyter Spark image as base
FROM jupyter/all-spark-notebook:latest

# Install Apache Toree
#USER root
RUN pip install toree

# Switch back to jovyan user
USER $NB_UID

# Install the Toree kernel in user-space
RUN jupyter toree install \
  --spark_home=$SPARK_HOME \
  --spark_opts="--master=local[*]" \
  --interpreters=Scala \
  --user

# Expose JupyterLab by default
ENV JUPYTER_ENABLE_LAB=yes

# Optional: set a default working directory
WORKDIR /home/jovyan/work
