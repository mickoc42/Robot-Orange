# Tests for OrangeHrm application

## OrangeHrm Application

all tests use https://opensource-demo.orangehrmlive.com/ live demo


### Installation and setup


- (optional) install VSC recommended plugins
    - Robot Code (for syntax highlighting and IntelliSense)
    - Robocop LSP (for linting errors)

- create and activate virtual environment:
    - Linux/Mac: `python3 -m venv venv && source venv/bin/activate`
    - Windows: `python -m venv venv and .\venv\Scripts\activate`
- install python dependencies: pip install -r requirements.txt
- initialize Browser library (downloads Playwright binaries): rfbrowser init
- prepare local env file with following variables:
    - URL
    - USERNAME
    - PASSWORD


## Use

Run all tests:

```
python -m robot --outputdir results tests/
```

