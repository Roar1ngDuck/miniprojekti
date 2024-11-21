*** Settings ***
Resource  resource.robot
Suite Setup      Open And Configure Browser
Suite Teardown   Close Browser
Test Setup       Reset Citations

*** Test Cases ***
Loads at start
    Go To  ${HOME_URL}
    Title Should Be  Citation app


After adding a citation, there is one
    Go To  ${HOME_URL}
    Select From List By Value  citation_type  inproceedings
    Click Button  Select
    Input Text  author  author
    Input Text  title   testing
    Input Text  booktitle   testing
    Input Text  year    2024
    Click Button  Create
    Page Should Contain  testing by author

Type selection works
    Go To  ${HOME_URL}
    Select From List By Value  citation_type  article
    Click Button  Select
    Input Text  author  author2
    Input Text  title   testing
    Input Text  journal   testing
    Input Text  year    2024
    Click Button  Create
    Page Should Contain  testing by author2

    
