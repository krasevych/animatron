'use strict';

var ProjectsPage = function() {
  var that = this;
  this.projects = element.all(by.css('.row > div'));
  this.project = this.projects.get(0);
  this.btnOpenModal = this.project.element(by.css('a.btn-open'));
  this.modal = element(by.css('.modal-project'));
  this.modalTitle = this.modal.element(by.css('h3.modal-title'));
  this.modalCloseBtn = this.modal.element(by.css('.btn-close'));
  this.modalEditable = this.modal.element(by.css('.editable'));
  this.editTextField = this.modalEditable.element(by.css('.edit-field'));
  this.editBtnOK = this.modalEditable.element(by.css('button.text-success'));
  this.editBtnCancel = this.modalEditable.element(by.css('button.text-danger'));
  this.editInput = this.modalEditable.element(by.css('input'));
  this.modelInput = this.modalEditable.element(by.model('value'));
  this.headerProject = this.modal.element(by.css('.edit-field'));
  this.modalBackdrop = element(by.css('.modal-backdrop'))
};

module.exports = new ProjectsPage();

