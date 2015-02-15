'use strict';

var ProjectsPage = function() {
  var that = this;
  this.projects = element.all(by.css('.row > div'));
  this.project = this.projects.get(0);
  this.btnOpenModal = this.project.element(by.css('a.btn-open'));
  this.modal = element(by.css('.modal-project'));
  this.modalTitle = this.modal.element(by.css('h3.modal-title'));
  this.modalEditable = this.modal.element(by.css('.editable'));
  this.modalEditField = this.modalEditable.element(by.css('.edit-field'));
  this.headerProject = this.modal.element(by.css('.edit-field'));
};

module.exports = new ProjectsPage();

