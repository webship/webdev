'use strict';

const { Given, Then, When } = require('@cucumber/cucumber');
const { friendly } = require('webship-js/tests/step-definitions/webship');

/**
 * Run a step body and rethrow any failure as a tester-friendly error.
 */
async function attempt(body, message) {
  try {
    await body();
  } catch (err) {
    throw friendly(message, err);
  }
}

/**
 * Resolve a form field locator by label.
 */
function fieldLocator(page, label) {
  return page
    .locator('label.form-item__label, label.form-required, label')
    .filter({ hasText: new RegExp(`^\\s*${label.replace(/[.*+?^${}()|[\\]\\\\]/g, '\\$&')}(\\s|$)`, 'i') })
    .first();
}

/**
 * Assert that a form field with the given label is visible on the page.
 *
 * Example #1: Then I should see a "Title" field
 * Example #2: Then I should see a "Description" field
 */
Then(/^(?:I |we )?should see a "([^"]*)" field$/, async function (label) {
  await attempt(async () => {
    const locator = fieldLocator(this.page, label);
    await locator.waitFor({ state: 'visible', timeout: 10000 });
  }, `Expected to find a field labeled "${label}"`);
});

/**
 * Assert that a form field with the given label (with article "an") is visible.
 *
 * Example #1: Then I should see an "Image" field
 */
Then(/^(?:I |we )?should see an "([^"]*)" field$/, async function (label) {
  await attempt(async () => {
    const locator = fieldLocator(this.page, label);
    await locator.waitFor({ state: 'visible', timeout: 10000 });
  }, `Expected to find a field labeled "${label}"`);
});

/**
 * Assert that a button with the given text is visible on the page.
 *
 * Example #1: Then I should see the button "Save"
 */
Then(/^(?:I |we )?should see the button "([^"]*)"$/, async function (text) {
  await attempt(async () => {
    const locator = this.page.getByRole('button', { name: text, exact: false }).first();
    await locator.waitFor({ state: 'visible', timeout: 10000 });
  }, `Expected to find a button with text "${text}"`);
});

/**
 * Assert that the response of a path is the given HTTP status code.
 *
 * Example #1: Then the response status of "/node/add/article" should be 200
 * Example #2: Then the response status of "/admin/config/search/path" should be 200
 */
Then(/^the response status of "([^"]+)" should be (\d+)$/, async function (path, status) {
  await attempt(async () => {
    const url = `${this.parameters.launchUrl}${path}`;
    const response = await this.page.request.get(url, { failOnStatusCode: false });
    const actual = response.status();
    if (String(actual) !== String(status)) {
      throw new Error(`GET ${path} returned ${actual}, expected ${status}`);
    }
  }, `Unexpected HTTP status for "${path}"`);
});

/**
 * Assert that an HTML head meta tag with the given attribute key/value is present.
 *
 * Example #1: Then the page meta "name" "description" should exist
 * Example #2: Then the page meta "property" "og:title" should exist
 */
Then(/^the page meta "([^"]+)" "([^"]+)" should exist$/, async function (attr, value) {
  await attempt(async () => {
    const count = await this.page.locator(`head meta[${attr}="${value}"]`).count();
    if (count === 0) {
      throw new Error(`No meta tag with ${attr}="${value}" found in <head>`);
    }
  }, `Expected page <head> to contain meta[${attr}="${value}"]`);
});

/**
 * Assert that a link rel value is present in the HTML head.
 *
 * Example #1: Then the page link rel "canonical" should exist
 * Example #2: Then the page link rel "shortlink" should exist
 */
Then(/^the page link rel "([^"]+)" should exist$/, async function (rel) {
  await attempt(async () => {
    const count = await this.page.locator(`head link[rel="${rel}"]`).count();
    if (count === 0) {
      throw new Error(`No link with rel="${rel}" found in <head>`);
    }
  }, `Expected page <head> to contain link[rel="${rel}"]`);
});

/**
 * Fill a form field resolved by its label text.
 *
 * Example #1: When I fill in the "Title" field with "My article"
 */
When(/^(?:I |we )?fill in the "([^"]*)" field with "([^"]*)"$/, async function (label, value) {
  await attempt(async () => {
    await this.page.getByLabel(label, { exact: false }).first().fill(value);
  }, `Could not fill the "${label}" field`);
});
