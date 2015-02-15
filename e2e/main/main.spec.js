'use strict';

describe('Main View', function() {
  var page;

  beforeEach(function() {
    browser.get('/');
    page = require('./main.po');
  });

  it('should include correct data', function() {
    expect(page.h1El.getText()).toBe('Hello');
    expect(page.pageHeaderEl.getText()).toBe('Test');
    expect(page.leadEl.getText()).toBe('This is test of app for Animator');
  });
});
