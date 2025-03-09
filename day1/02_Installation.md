## Installation and setup

### Installing Python on Linux

On Linux you should have suitable Python installation with pip available by default. If not, you need to consult your distributions documentation to learn how to install them. This is also true if you want to use some other Python version than the one provided by your distribution by default.

### Installing Python on Windows

On Windows Python is not available by default, but it is easy to install. The recommended way to install it is using the official Windows installers available at http://python.org. For other alternatives, such as installing from the Microsoft Store, see the official Python documentation.
When installing Python on Windows, it is recommended to add Python to PATH to make it and tools like pip and Robot Framework easier to execute from the command line. When using the official installer, you just need to select the Add Python 3.x to PATH checkbox on the first dialog.

### Installing Python on macOS

MacOS does not provide Python 3 compatible Python version by default, so it needs to be installed separately. The recommended approach is using the official macOS installers available at http://python.org. If you are using a package manager like Homebrew, installing Python via it is possible as well.

### Installing UV Package manager

For installing UV package manager, you can follow the instructions provided in the official documentation:
https://docs.astral.sh/uv/getting-started/installation/

### Installing Robot Framework

Once you have Python installed, you can install Robot Framework and the Browser library using UV, the package installer. Run the following commands in your terminal or command prompt:

```bash
uv init robotframework-playground
cd robotframework-playground
uv add robotframework
uv add robotframework-browser
uv run rfbrowser init
```

You can also install development packages to help you with formatting and linting with the following commands:

```bash
uv add robotframework-tidy --dev
uv add ruff --dev
```

This will activate the virtual environment on Windows:

```bash
.venv\Scripts\activate
```

And on Linux/macOS:

```bash
source .venv/bin/activate
```

To make sure everything is set up correctly, you can run the following command to check the Robot Framework version:

```bash
robot --version
```
