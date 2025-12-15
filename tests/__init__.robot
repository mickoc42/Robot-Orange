*** Settings ***
Resource            ${EXECDIR}/src/common.resource
Suite Setup     Start New Browser Session
Suite Teardown   Close Browser    ALL
Test Setup          Open App And Login
Test Teardown       Close Context
