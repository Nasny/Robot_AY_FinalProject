*** Settings ***
Library    SeleniumLibrary
Test Setup    Open browser  ${url}    ${b}
Test Teardown    Close browser

*** Variables ***
${url}    https://iqit-commerce.com/ps17/demo15/en/
${b}    Chrome

*** Test Cases ***
Test valid registration
    [Documentation]    Test otwiera aplikacje webowa i przeprowadza poprawną rejestrację użytkownika
    maximize browser window
    Sleep    2
    Sing In
    Create Account
    Choose Gendre
    Input Valid Credentials
    Input E-mail
    Input Password
    Scroll
    Save Button
Test invalid registration
    [Documentation]    Test otwiera aplikacje webowa i przeprowadza rejestrację użytkownika używając nieprawidłowych danych użytkownika
    maximize browser window
    Sleep    2
    Sing In
    Create Account
    Choose Gendre
    Input Invalid Credentials
    Input E-mail
    Input Password
    Scroll
    Save Button
    Assert Invalid Credentials

Test Valid Sign In
    [Documentation]    Test przeprowadza poprawne logowanie zarejestrowanego użytkownika
    maximize browser window
    Sleep    2
    Sing In
    Input E-mail
    Input Password
    Sing In Button
    Sleep    2
    wait until element is visible    xpath://*[@id="main"]/header/h1/span
    Sleep    5
Test Invalid Sign In
    [Documentation]    Test przeprowadza logowanie niezarejestrowanego użytkownika
    maximize browser window
    sleep    2
    Sing In
    Input Unregistered E-mail
    Input Password
    Sing In Button
    Sleep    2
    wait until element is visible    xpath://*[@id="content"]/section/div/ul/li
    Sleep    10

*** Keywords ***
Sing In
    click element     xpath://*[@id="header-user-btn"]/a/i
Create Account
    click element     xpath://*[@id="content"]/div/a
Choose Gendre
    click element    name:id_gender
Input Valid Credentials
    Input Text  id=field-firstname  John
    Input Text  id=field-lastname  Smith
    Input Text    id=field-birthday    01/01/1990
Input Invalid Credentials
    Input Text  id=field-firstname  123
    Input Text  id=field-lastname  321
    Input Text    id=field-birthday    00/00/1990
Input E-mail
    Input Text    id=field-email    john@smith.com
Input Unregistered E-mail
    Input Text    id=field-email    unregistered@email.com
Input Password
    Input Text    id=field-password    pa$$word
Scroll
    scroll element into view    xpath://*[@id="customer-form"]/footer/button
Save Button
    click element   css=button[data-link-action="save-customer"]
Sing In Button
    click element   id=submit-login
Assert Invalid Credentials
    wait until element is visible    xpath=//*[@id="customer-form"]/div/div[2]/div[1]/div/ul/li
    wait until element is visible    xpath=//*[@id="customer-form"]/div/div[3]/div[1]/div/ul/li
    wait until element is visible    xpath=//*[@id="customer-form"]/div/div[4]/div[1]/div/ul/li
    wait until element is visible    xpath=//*[@id="customer-form"]/div/div[6]/div[1]/div/ul/li
