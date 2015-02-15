'use strict';

var HeaderPage = function() {
  this.navbar = element(by.css('.navbar'));
  this.navbarToggleBtn = this.navbar.element(by.css('button.navbar-toggle'));
  this.navbarBrand = this.navbar.element(by.css('.navbar-brand'));
  this.navbarCollapse= this.navbar.element(by.css('.navbar-collapse'));
  this.menuList = element.all(by.css('#navbar-main ul.nav.navbar-nav li a'));

};

module.exports = new HeaderPage();

