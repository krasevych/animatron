'use strict';

describe('Header View', function() {
  var page;

  beforeEach(function() {
    browser.get('/');
    page = require('./header.po');
  });

  it('navbar should have NavbarCtrl controller', function() {
    expect(page.navbar.getAttribute('ng-controller')).toBe('NavbarCtrl');
  });

  it('navbar-collapse should work correct', function() {
    expect(page.navbarToggleBtn.getAttribute('ng-click')).toBe('isCollapsed = !isCollapsed');
    expect(page.navbarCollapse.getAttribute('collapse')).toBe('isCollapsed');
  });

  it('navbar Brand should have title Animatron and have link to home', function() {
    expect(page.navbarBrand.getText()).toBe('Animatron');
    expect(page.navbarBrand.getAttribute('ng-href')).toBe('/');
  });

  it('menu should include correct href of address and title of link', function() {
    page.menuList.then(function(arr){
      expect(arr[0].getText()).toBe('Home');
      expect(arr[0].getAttribute('ng-href')).toBe('/');

      expect(arr[1].getText()).toBe('Projects');
      expect(arr[1].getAttribute('ng-href')).toBe('/projects');

      expect(arr[2].getText()).toBe('About Us');
      expect(arr[2].getAttribute('ng-href')).toBe('/about');
    });
  });
});
