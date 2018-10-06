from behave import when, given, then
import allure
from selenium import webdriver


@given('The values {bool1} & {bool2}')
def step_impl(context, bool1, bool2):
    context.bool1 = bool1 == 'True'
    context.bool2 = bool2 == 'True'


@when('I apply an Or gate')
def step_impl(context):
    context.res = context.bool1 or context.bool2


@when('I apply an And gate')
def step_impl(context):
    context.res = context.bool1 and context.bool2


@then('The result should be {res}')
def step_impl(context, res):
    allure.attach('This is attached', name='Text attached', attachment_type=allure.attachment_type.TEXT)
    assert context.res == (res == 'True'), f'Expected {res}, got {context.res}'
    allure.tag(['asdf'])


@when('I launch chrome')
def step_impl(context):
    context.driver = webdriver.Chrome()


@when('I visit {url}')
def step_impl(context, url):
    context.driver.get(url)
    allure.attach(context.driver.get_screenshot_as_png(), name='Screenshot', attachment_type=allure.attachment_type.PNG)
    allure.tag(['asdf'])




















