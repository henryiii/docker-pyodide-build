FROM python:3.11

ARG PYODIDE=0.23.2

LABEL description="A docker image for building wheels with Pyodide"
LABEL maintainer="Henry Schreiner"

SHELL ["/bin/bash", "-c"]

COPY entrypoint.sh .
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]

RUN python3 -m venv venv-host \
 && source venv-host/bin/activate \
 && pip install rich \
 && pip install pyodide-build \
 && pyodide config list \
 && EMSCRIPTEN_VERSION=$(pyodide config get emscripten_version) \
 && git clone https://github.com/emscripten-core/emsdk.git \
 && /emsdk/emsdk install $EMSCRIPTEN_VERSION \
 && /emsdk/emsdk activate $EMSCRIPTEN_VERSION \
 && source /emsdk/emsdk_env.sh \
 && pyodide venv venv-pyodide \
 && deactivate

