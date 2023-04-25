FROM python:3.11

SHELL ["/bin/bash", "-c"]

COPY entrypoint.sh .
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]

RUN apt update \
 && git clone https://github.com/emscripten-core/emsdk.git \
 && /emsdk/emsdk install 3.1.32 \
 && /emsdk/emsdk activate 3.1.32 \
 && source /emsdk/emsdk_env.sh \
 && python3 -m venv venv-host \
 && source venv-host/bin/activate \
 && pip install rich \
 && pip install pyodide-build \
 && pyodide venv venv-pyodide \
 && deactivate


