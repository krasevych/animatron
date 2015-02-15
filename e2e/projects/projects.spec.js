'use strict';

describe('Projects View', function () {
  var page;

  beforeEach(function () {
    browser.get('/projects');
    page = require('./projects.po');
  });

  function openModalNotEmptyTitle() {
    page.projects.filter(function (elem, index) {
      return elem.element(by.css('.p-name')).getText().then(function (text) {
        return text != '';
      });
    }).then(function (filteredElements) {
      filteredElements[0].element(by.css('a.btn-open')).click();
    });
  };

  it('should load 9 projects', function () {
    expect(page.projects.count()).toBe(9);
  });

  it('when click on btn-open should show modal', function () {
    page.btnOpenModal.click();
    expect(element(by.css('.modal')).isPresent()).toBe(true);
    expect(page.modalBackdrop.isPresent()).toBe(true);
  });

  it('window title should has project name', function () {
    openModalNotEmptyTitle();
    expect(browser.getTitle()).toBe(page.headerProject.getText());
  });

  it('should be show data from server in modal', function () {
    page.btnOpenModal.click();

    expect(page.modal.element(by.css('.modal-title')).getAttribute('editable-value')).toBe('project.name');
    expect(page.modal.element(by.css('ul.list-group li div')).getAttribute('editable-value')).toBe('project.display_name');
    expect(page.modal.element(by.css('.description')).getAttribute('editable-value')).toBe('project.description');

    expect(page.modal.element(by.exactBinding('project.created | date')).isPresent()).toBe(true);
    expect(page.modal.element(by.exactBinding('project.modified | date')).isPresent()).toBe(true);
    expect(page.modal.element(by.exactBinding('project.likes')).isPresent()).toBe(true);
    expect(page.modal.element(by.exactBinding('project.scenes')).isPresent()).toBe(true);
    expect(page.modal.element(by.exactBinding('project.copyright')).isPresent()).toBe(true);
  });

  it('when modal is opened  then history of browser should be changed', function () {
    var browseHistoryStateFirst = browser.getCurrentUrl();

    page.btnOpenModal.click();
    var browseHistoryStateSecond = browser.getCurrentUrl();

    browser.navigate().back();
    expect(browser.getCurrentUrl()).toBe(browseHistoryStateFirst);

    browser.navigate().forward();
    expect(browser.getCurrentUrl()).toBe(browseHistoryStateSecond);
  });

  it('title of modal should be editable ', function () {
    openModalNotEmptyTitle();

    expect(page.modalTitle.getAttribute('editable-value').isPresent()).toBe(true);
    expect(page.modalEditable.isPresent()).toBe(true);
    expect(page.editTextField.isPresent()).toBe(true);

    var title = page.modalTitle.getAttribute('editable-value').getText();

    expect(page.editTextField.getText()).toBe(title);
    expect(page.editInput.isPresent()).toBe(true);
    expect(page.editInput.getCssValue('display')).toBe('none');
    expect(page.editTextField.getCssValue('display')).toBe('block');

    page.editTextField.click();

    expect(page.editInput.getCssValue('display')).toBe('inline-block');
    expect(page.editTextField.getCssValue('display')).toBe('none');
  });


  it('editing - when change value in input and click button "OK" - parent value should change', function () {
    openModalNotEmptyTitle();
    var previousTextField = page.editTextField.getText();
    page.editTextField.click();
    page.modelInput.clear();
    page.modelInput.sendKeys('testOK');
    page.editBtnOK.click();

    expect(page.editTextField.getText()).toNotBe(previousTextField);
    expect(page.modalTitle.getAttribute('editable-value').getText()).toBe('testOK');
    expect(page.editInput.getCssValue('display')).toBe('none');
    expect(page.editTextField.getCssValue('display')).toBe('block');
  });

  it('editing - when change value in input and click button "Cancel" - parent value shouldn"t change', function () {
    openModalNotEmptyTitle();
    var previousTextField = page.editTextField.getText();
    page.editTextField.click();
    page.modelInput.clear();
    page.modelInput.sendKeys('testCancel');
    page.editBtnCancel.click();

    expect(page.editTextField.getText()).toNotBe('testCancel');
    expect(page.editTextField.getText()).toBe(previousTextField);
    expect(page.modalTitle.getAttribute('editable-value').getText()).toBe(previousTextField);
    expect(page.editInput.getCssValue('display')).toBe('none');
    expect(page.editTextField.getCssValue('display')).toBe('block');
  });

});
