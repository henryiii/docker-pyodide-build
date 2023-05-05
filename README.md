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


## Guides

Getting into the build environment:

> So what you want to do is: Set `symlink_dir_str` to a constant absolute path instead of the temp directory
> [here](https://github.com/pyodide/pyodide/blob/main/pyodide-build/pyodide_build/pypabuild.py#L208)
> then the compilers in that directory will work the same as in the build
> so you should be able to reproduce the linker error.
> You should also add that directory at the beginning of your path.
> You probably also want to keep the virtual environment around.
> [by uncommenting this line])https://github.com/pyodide/pyodide/blob/main/pyodide-build/pyodide_build/pypabuild.py#L99).
> If you source the activate script from the build virtual environment and add
> the compiler symlinks directory to the beginning of your path
> it should be possible to reproduce a lot of the build.
