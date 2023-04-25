# Dockerfile for pyodide build
Useful on macOS, where it's currently broken.

Build with:

```bash
docker build . -t pyodide-build
```

Run with:

```bash
docker run -v $PWD:/pkg -w /pkg --rm -it pyodide-build
```

To activate environment with `pyodide build`:

```bash
. /venv-host/bin/activate
```

Then you can build with:

```bash
pyodide build
```

To run tests.

```bash
deactivate
. /venv-pyodide/bin/activate
pytest
```
