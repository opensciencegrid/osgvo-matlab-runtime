FROM opensciencegrid/osgvo-el7

LABEL opensciencegrid.name="Matlab Runtime"
LABEL opensciencegrid.description="This is the Matlab runtime component you can use to execute compiled Matlab codes"
LABEL opensciencegrid.url="https://www.mathworks.com/products/compiler/matlab-runtime.html"
LABEL opensciencegrid.category="Languages"
LABEL opensciencegrid.definition_url="https://github.com/opensciencegrid/osgvo-matlab-runtime"

COPY labels.json /.singularity.d/labels.json
COPY 90-osgvo-matlab-runtime.sh /.singularity.d/env/90-osgvo-matlab-runtime.sh

RUN wget -nv https://ssd.mathworks.com/supportfiles/downloads/R2018b/deployment_files/R2018b/installers/glnxa64/MCR_R2018b_glnxa64_installer.zip && \
    unzip MCR*.zip -d MATLAB_Runtime_Installer && \
    cd MATLAB_Runtime_Installer && \
    ./install -mode silent -agreeToLicense yes -outputFile ./install.log && \
    cd .. && \
    rm -rf MCR*.zip MATLAB_Runtime_Installer
