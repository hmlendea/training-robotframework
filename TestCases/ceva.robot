*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${base_url}      http://api.geonames.org
${geoNamesId}    3899192
${username}      geonamesfreeaccountt

*** Test Cases ***
Get_info
    create session      mysession    ${base_url}
    ${response}=        GET on session    mysession    url=/getJSON?username=${username}&geonameId=${geoNamesId}
    ${responseJson}=    set variable    ${response.json()}

    #log to console    ${response.status_code}
    #log to console    ${response.headers}
    #log to console    ${responseJson}

    

    @{alternateNames}=        get value from json    ${responseJson}    alternateNames
    #@{firstAlternateName}=    get value from json    ${responseJson}    alternateNames[3].name
    ${firstAlternateName}=    get from list    ${alternateNames}    0

    log to console    ${firstAlternateName}
    #log to console    ${name_alternateName}

    should be equal as integers    200    ${response.status_code}
