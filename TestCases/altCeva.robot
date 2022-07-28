*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${baseUrl}    https://transliterate.com

*** Test Cases ***
myTestLol
    create session      mysession    ${base_url}
    ${body}=    create dictionary    
    post request        mysession    /Home/Transliterate
